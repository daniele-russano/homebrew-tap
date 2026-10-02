class Ccsm < Formula
  desc "Claude Code Session Manager: elenca, cerca e cestina le sessioni locali"
  homepage "https://github.com/daniele-russano/homebrew-tap"
  version "0.1.7"

  on_arm do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.7/ccsm-darwin-arm64.tar.gz"
    sha256 "45ddce05687ed72b2252a337c67f2541fb4d8ac3f514e0aab67e9956612a507c"
  end
  on_intel do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.7/ccsm-darwin-x64.tar.gz"
    sha256 "cf31d976cf410609a0bb849dfd2663fbb4782544268988ac85d464192eb29933"
  end

  depends_on :macos

  def install
    bin.install "ccsm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccsm --version")
  end
end
