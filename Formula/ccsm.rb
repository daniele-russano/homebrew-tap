class Ccsm < Formula
  desc "Claude Code Session Manager: elenca, cerca e cestina le sessioni locali"
  homepage "https://github.com/daniele-russano/homebrew-tap"
  version "0.1.16"

  on_arm do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.16/ccsm-darwin-arm64.tar.gz"
    sha256 "ddac2aa208a807f9cd3ce45e88191d01910988c8feb211993e025283fee3cd7b"
  end
  on_intel do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.16/ccsm-darwin-x64.tar.gz"
    sha256 "a46567a48f4497d26118382f0b846c492338f70d2446a8fb0405cc96fd4802e3"
  end

  depends_on :macos

  def install
    bin.install "ccsm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccsm --version")
  end
end
