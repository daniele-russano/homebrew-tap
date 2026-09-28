class Transcription < Formula
  desc "Trascrizione di audio in italiano con whisper.cpp (large-v3-turbo, Metal)"
  homepage "https://github.com/daniele-russano/homebrew-tap"
  url "https://github.com/daniele-russano/homebrew-tap/releases/download/transcription-v0.1.0/transcription-0.1.0.tar.gz"
  sha256 "1a0e6f2acf63157d23d3c6b326007c6dbddc551dd0f2b95a3a235c03c32639a3"

  depends_on arch: :arm64
  depends_on macos: :sonoma
  depends_on "python@3.14"
  depends_on "whisper.cpp"

  # Vedi install: gli ID @rpath/... delle dylib di PyAV vanno lasciati così.
  preserve_rpath

  # Wheel ufficiale, con le librerie FFmpeg incluse. Le formule di solito
  # compilano i pacchetti Python dai sorgenti (std_pip_args forza
  # --no-binary=:all:), ma PyAV andrebbe compilato contro l'ffmpeg di
  # Homebrew, di cui non garantisce il supporto per ogni versione.
  resource "av" do
    url "https://files.pythonhosted.org/packages/3f/c9/37a619297492256b77d5ed906e7d8166c10a26ed251dccf1ae03ab19bff6/av-18.1.0-cp311-abi3-macosx_14_0_arm64.whl"
    sha256 "b30a4e8d934558e19602b68998a4d9ac9f250fa0dacef216f7e8e40153b13316"
  end

  def install
    python = formula_opt_bin("python@3.14")/"python3.14"
    system python, "-m", "venv", libexec

    av = resource("av")
    wheel = buildpath/File.basename(av.url)
    cp av.cached_download, wheel
    system libexec/"bin/python", "-m", "pip", "install", "--no-deps", "--no-index", wheel

    # Le dylib della wheel hanno ID segnaposto (/DLC/av/.dylibs/...) e header
    # senza spazio libero: Homebrew fallisce nel riscriverli con il percorso
    # del Cellar (MachO::HeaderPadError). Un ID @rpath/... è più corto, quindi
    # entra, e con preserve_rpath Homebrew non lo tocca più. Il caricamento
    # non cambia: i moduli di av le referenziano via @loader_path.
    site_packages = libexec/Language::Python.site_packages(python)
    (site_packages/"av/.dylibs").glob("*.dylib").each do |dylib|
      MachO::Tools.change_dylib_id(dylib, "@rpath/#{dylib.basename}")
      system "codesign", "--force", "--sign", "-", dylib
    end

    libexec.install "transcription.py", "audio_utils.py"

    (bin/"transcription").write <<~SH
      #!/bin/bash
      export TRANSCRIPTION_INSTALLED=1
      export WHISPER_CPP_BIN="#{formula_opt_bin("whisper.cpp")}/whisper-cli"
      exec "#{libexec}/bin/python" "#{libexec}/transcription.py" "$@"
    SH
  end

  def caveats
    <<~EOS
      Al primo avvio vengono scaricati i modelli (~835 MB) in:
        ~/Library/Application Support/transcription/models

      Uso:
        transcription lezione.m4a altra-registrazione.mp3
      Il testo viene salvato in un .md accanto a ogni file audio.
    EOS
  end

  test do
    assert_match "file audio da trascrivere", shell_output("#{bin}/transcription --help")
    system libexec/"bin/python", "-c", "import av"
  end
end
