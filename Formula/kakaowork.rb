# Template for Formula/kakaowork.rb in lxxjs/homebrew-tap. scripts/release.sh fills in
# https://github.com/lxxjs/kakaowork/releases/download/v0.1.1/lxxjs-kakaowork-0.1.1.tgz and b199417b6a72b3b8616b5c89561408aa3c63f1d2a7c2be3abf3e28619ba9edc9 and pushes it; edit this file, not the one in the tap.
class Kakaowork < Formula
  desc "KakaoTalk for macOS in your terminal, with a Claude Code-style UI"
  homepage "https://github.com/lxxjs/kakaowork"
  url "https://github.com/lxxjs/kakaowork/releases/download/v0.1.1/lxxjs-kakaowork-0.1.1.tgz"
  sha256 "b199417b6a72b3b8616b5c89561408aa3c63f1d2a7c2be3abf3e28619ba9edc9"
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
