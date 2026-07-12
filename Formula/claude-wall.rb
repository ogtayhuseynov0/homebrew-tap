class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.9.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.6/claude-wall-macos-arm64"
      sha256 "475d662c8bf78c880d20005966443d13d9623ad554b4ab5264afeaecf670196b"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.6/claude-wall-macos-amd64"
      sha256 "4d35c9ab0f56d1606fe389f5e4e16aedafc50472f368f496d07277c28f9f12d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.6/claude-wall-linux-arm64"
      sha256 "baa1b2e0a76d55a85a4a921b2c1124b5d97aba2ffe4c39d58675ef73694ed735"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.6/claude-wall-linux-amd64"
      sha256 "0b33a253faae2141ab06c994b77ddbecad5e71dc08364a86eddeaaa05c51a45b"
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
