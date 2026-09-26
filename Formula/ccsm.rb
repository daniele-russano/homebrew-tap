class Ccsm < Formula
  desc "Claude Code Session Manager: elenca, cerca e cestina le sessioni locali"
  homepage "https://github.com/daniele-russano/homebrew-tap"
  version "0.1.5"

  on_arm do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.5/ccsm-darwin-arm64.tar.gz"
    sha256 "06a9da5e781098ffbb06406f9c5549e098a0cc61498ce3167be04b37c6c346bb"
  end
  on_intel do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.5/ccsm-darwin-x64.tar.gz"
    sha256 "01acff382a3b37ff7aaf72066db942b2ed782a990a166a006f2e2fad871e3747"
  end

  depends_on :macos

  def install
    bin.install "ccsm"
  end

  def caveats
    <<~CAVEATS
      Per la skill /ccsm di Claude Code:
        ccsm install-skill --force
    CAVEATS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccsm --version")
  end
end
