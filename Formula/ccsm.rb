class Ccsm < Formula
  desc "Claude Code Session Manager: elenca, cerca e cestina le sessioni locali"
  homepage "https://github.com/daniele-russano/homebrew-tap"
  version "0.1.18"

  on_arm do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.18/ccsm-darwin-arm64.tar.gz"
    sha256 "2e50f16c59fbecde62992d1404da4ffee14bd322b0c4ebed90f7ddca2153d780"
  end
  on_intel do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.18/ccsm-darwin-x64.tar.gz"
    sha256 "02a744a41880a3586ae436981f45268401a6e123ab3a62de44c207b829750008"
  end

  depends_on :macos

  def install
    bin.install "ccsm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccsm --version")
  end
end
