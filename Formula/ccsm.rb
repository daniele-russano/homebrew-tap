class Ccsm < Formula
  desc "Claude Code Session Manager: elenca, cerca e cestina le sessioni locali"
  homepage "https://github.com/daniele-russano/homebrew-tap"
  version "0.1.15"

  on_arm do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.15/ccsm-darwin-arm64.tar.gz"
    sha256 "13b889c746b7df320da3b5583d472992377bb9cfb8e0766664bb3a2f7f5f164c"
  end
  on_intel do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.15/ccsm-darwin-x64.tar.gz"
    sha256 "ea7e2b59d4265b8ff7728d2bbf179d1260f248c4de11e5deca928918ecb36c81"
  end

  depends_on :macos

  def install
    bin.install "ccsm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccsm --version")
  end
end
