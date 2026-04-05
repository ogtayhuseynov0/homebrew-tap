class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.9.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.2/claude-wall-macos-arm64"
      sha256 "434c1769b804ccbcb00372c4faadb0bd17f6c0287259050a887cd1002c107a96"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.2/claude-wall-macos-amd64"
      sha256 "e5fbabc5e6438276b25a12a3bcb2e3a3685a0222b0998a09a153dd8322aa4303"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.2/claude-wall-linux-arm64"
      sha256 "3db4a2887f20e864be032567023bf5873484094bb3dcffe11697d25bf9801aa2"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.2/claude-wall-linux-amd64"
      sha256 "db7734ea31857bcac43b7ca30453f137bcd68295f0333e1c4cd699a8df7987f6"
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
