class Ccsm < Formula
  desc "Claude Code Session Manager: elenca, cerca e cestina le sessioni locali"
  homepage "https://github.com/daniele-russano/homebrew-tap"
  version "0.1.14"

  on_arm do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.14/ccsm-darwin-arm64.tar.gz"
    sha256 "44dacdfcf2c3812bfd50c284e65ba8decd5e600cc07d4f2da99d52462a16fc21"
  end
  on_intel do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.14/ccsm-darwin-x64.tar.gz"
    sha256 "a2cc70341b481d75b25acd1640e3038b4d24c05fb73d0524428031abd9218be2"
  end

  depends_on :macos

  def install
    bin.install "ccsm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccsm --version")
  end
end
