class Ccsm < Formula
  desc "Claude Code Session Manager: elenca, cerca e cestina le sessioni locali"
  homepage "https://github.com/daniele-russano/homebrew-tap"
  version "0.1.10"

  on_arm do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.10/ccsm-darwin-arm64.tar.gz"
    sha256 "3ebe43d2487feeb5eb09dcec6d11530ab0c187bc5fb607c8a2595d70e0776dc9"
  end
  on_intel do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.10/ccsm-darwin-x64.tar.gz"
    sha256 "b62ecf94b74c8c3ea51d1ed769d78147c0f0fe57103d07d51159666aab322b3e"
  end

  depends_on :macos

  def install
    bin.install "ccsm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccsm --version")
  end
end
