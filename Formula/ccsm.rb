class Ccsm < Formula
  desc "Claude Code Session Manager: elenca, cerca e cestina le sessioni locali"
  homepage "https://github.com/daniele-russano/homebrew-tap"
  version "0.1.3"

  on_arm do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.3/ccsm-darwin-arm64.tar.gz"
    sha256 "7aa510580fa22bd75396b4e1738c3d4b9f373613a46fc16a198acaa6a508f0b0"
  end
  on_intel do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.3/ccsm-darwin-x64.tar.gz"
    sha256 "fae79d4aed43c5c2c3a7609ed734211ce8f0721419c696418babd4618b53eb77"
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
