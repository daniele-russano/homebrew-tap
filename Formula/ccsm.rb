class Ccsm < Formula
  desc "Claude Code Session Manager: elenca, cerca e cestina le sessioni locali"
  homepage "https://github.com/daniele-russano/homebrew-tap"
  version "0.1.4"

  on_arm do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.4/ccsm-darwin-arm64.tar.gz"
    sha256 "a4f2820f69f7bf7784ecb0fa6dc84348b3b3073c468c28ffb0635c4cd1b87f37"
  end
  on_intel do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.4/ccsm-darwin-x64.tar.gz"
    sha256 "9cdc67fd8ae40dbaf6447d7a35095b1f4394a05e5599684cc0763a7f4b88e144"
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
