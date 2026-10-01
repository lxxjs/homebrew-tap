# Template for Formula/kakaowork.rb in lxxjs/homebrew-tap. scripts/release.sh fills in
# https://github.com/lxxjs/kakaowork/releases/download/v0.1.2/lxxjs-kakaowork-0.1.2.tgz and ea5a4d97a77d6d7a5a01666bde0d2a94269254838df5ac3711b80651e8378817 and pushes it; edit this file, not the one in the tap.
class Kakaowork < Formula
  desc "KakaoTalk for macOS in your terminal, with a Claude Code-style UI"
  homepage "https://github.com/lxxjs/kakaowork"
  url "https://github.com/lxxjs/kakaowork/releases/download/v0.1.2/lxxjs-kakaowork-0.1.2.tgz"
  sha256 "ea5a4d97a77d6d7a5a01666bde0d2a94269254838df5ac3711b80651e8378817"
  license "MIT"

  depends_on :macos
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  def caveats
    <<~EOS
      kakaowork drives the KakaoTalk app through the Accessibility API.
      On first run, allow your terminal app in:
        System Settings → Privacy & Security → Accessibility
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kakaowork --version")
  end
end
