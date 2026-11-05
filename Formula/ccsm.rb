class Ccsm < Formula
  desc "Claude Code Session Manager: elenca, cerca e cestina le sessioni locali"
  homepage "https://github.com/daniele-russano/homebrew-tap"
  version "0.1.13"

  on_arm do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.13/ccsm-darwin-arm64.tar.gz"
    sha256 "07c22121c751453363572081f3467cf69c72fd51857d913a5342ef6a6aaa7ad4"
  end
  on_intel do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.13/ccsm-darwin-x64.tar.gz"
    sha256 "e815aa4176cf9b01532ab9273ed42f9a51afb6092943a8a70f296aa72f792e60"
  end

  depends_on :macos

  def install
    bin.install "ccsm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccsm --version")
  end
end
