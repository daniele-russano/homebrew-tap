class Ccsm < Formula
  desc "Claude Code Session Manager: elenca, cerca e cestina le sessioni locali"
  homepage "https://github.com/daniele-russano/homebrew-tap"
  version "0.1.9"

  on_arm do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.9/ccsm-darwin-arm64.tar.gz"
    sha256 "5204e6101d69f9ff79888f3b3b16db30f27c9e4ab8b934c231748ce3a194ea90"
  end
  on_intel do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.9/ccsm-darwin-x64.tar.gz"
    sha256 "ffb472470a64cb458fb325ddb6bbe0bf77fb28cdf3a3a937af5fb9df74bacc20"
  end

  depends_on :macos

  def install
    bin.install "ccsm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccsm --version")
  end
end
