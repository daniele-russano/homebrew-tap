class Ccsm < Formula
  desc "Claude Code Session Manager: elenca, cerca e cestina le sessioni locali"
  homepage "https://github.com/daniele-russano/homebrew-tap"
  version "0.1.8"

  on_arm do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.8/ccsm-darwin-arm64.tar.gz"
    sha256 "6dd47442352b4de9255fcbd57cef7ce6cddb04fbbfbc8699e18e2c1ad8d9576e"
  end
  on_intel do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.8/ccsm-darwin-x64.tar.gz"
    sha256 "2556719150a3b5dfaad2b3d22ecbf5b12aeb5eb70bd956ad66aac78a174afa1c"
  end

  depends_on :macos

  def install
    bin.install "ccsm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccsm --version")
  end
end
