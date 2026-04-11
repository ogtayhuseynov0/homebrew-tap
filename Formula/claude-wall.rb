class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.9.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.4/claude-wall-macos-arm64"
      sha256 "276dd1edaa82928af6b5410167d0d219e639767819cdb7ecd0dbacf13a727f5d"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.4/claude-wall-macos-amd64"
      sha256 "5588d7a95d7d185322dffb720a4df9aa754dd51370660bb316cb3e464692a0de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.4/claude-wall-linux-arm64"
      sha256 "96ce9aa77eb5707003644f9247ae6db18a7210706c1b12eacf66837af639875f"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.4/claude-wall-linux-amd64"
      sha256 "6a4aa75bb077373d823e3e4519ec8959dc0aacd160592d3f560bc6b5119a353c"
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
