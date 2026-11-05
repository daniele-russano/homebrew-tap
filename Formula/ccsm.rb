class Ccsm < Formula
  desc "Claude Code Session Manager: elenca, cerca e cestina le sessioni locali"
  homepage "https://github.com/daniele-russano/homebrew-tap"
  version "0.1.12"

  on_arm do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.12/ccsm-darwin-arm64.tar.gz"
    sha256 "9d48b7bb5e77b29b86af36019b716f9c18e25583f210a435fba06d9ca07c89b7"
  end
  on_intel do
    url "https://github.com/daniele-russano/homebrew-tap/releases/download/v0.1.12/ccsm-darwin-x64.tar.gz"
    sha256 "d6a9c40d9e21aced272715746c11d6a637beb60839809c78a71132bedb0f7378"
  end

  depends_on :macos

  def install
    bin.install "ccsm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccsm --version")
  end
end
