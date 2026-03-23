class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.4.0/claude-wall-macos-arm64"
      sha256 "025c2dad97440753bf7de6933d0d5c8a5b5d296dc40871cb781c90238ea5e7b5"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.4.0/claude-wall-macos-amd64"
      sha256 "58fc4d7da79c72e862573c4e015f56119b68b2e5faf4b0456221387e7dd51a35"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.4.0/claude-wall-linux-arm64"
      sha256 "7676c6f8ff703ac665afd67b48e2fa8cdf1187697f1012f7d0552f4b2455ca2f"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.4.0/claude-wall-linux-amd64"
      sha256 "1b221d616a260d24384415d99d847bf5954e12155b6c88cc20a1f87c0c2e8470"
    end
  end

  depends_on "tmux"

  def install
    binary = Dir["claude-wall-*"].first || "claude-wall"
    bin.install binary => "claude-wall"
  end

  def post_install
    ohai "Run 'claude-wall init' to install hooks + start dashboard"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/claude-wall help 2>&1", 1)
  end
end
