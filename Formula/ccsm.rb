class Ccsm < Formula
  desc "Claude Code Session Manager: elenca, cerca e cestina le sessioni locali"
  homepage "https://github.com/daniele-russano/homebrew-tap"
  version "0.1.11"

  on_arm do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.11/ccsm-darwin-arm64.tar.gz"
    sha256 "f2cb1a871c734922abbaa4128ee89d467425537f49680a1e203830edd0b5d518"
  end
  on_intel do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.11/ccsm-darwin-x64.tar.gz"
    sha256 "d8edcc7f6de93dab3ab19c7e06c123cea95b9d47d1ad9a52c48923d518c63ecc"
  end

  depends_on :macos

  def install
    bin.install "ccsm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccsm --version")
  end
end
