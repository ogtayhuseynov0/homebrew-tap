class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.3.0/claude-wall-macos-arm64"
      sha256 "68328d29735a7474b6902710c9d7a98ad96175ffb343bbbe4cf8f0588830d907"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.3.0/claude-wall-macos-amd64"
      sha256 "d56c3420d5de2681deb2faca101a94a384e10857ced8b6220badac45d83b3105"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.3.0/claude-wall-linux-arm64"
      sha256 "58efbb03987152bb0fa44b22259cff8bb77227e3a5968494c465626c95a1354e"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.3.0/claude-wall-linux-amd64"
      sha256 "0c2dc0496e2e7137054a9f25ea5b8e6e9479edb8e55ac56cfeecb8ff7f74f59e"
    end
  end

  depends_on "tmux"

  def install
    binary = Dir["claude-wall-*"].first || "claude-wall"
    bin.install binary => "claude-wall"
  end

  def post_install
    ohai "Run 'claude-wall init' to install Claude Code hooks"
    ohai "Then 'claude-wall' to launch the dashboard"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/claude-wall --help 2>&1", 1)
  end
end
