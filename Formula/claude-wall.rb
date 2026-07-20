class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.9.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.7/claude-wall-macos-arm64"
      sha256 "6690067bdf56acc534f05802bfac424bc3dbab5107e5acd984077aed392cdc92"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.7/claude-wall-macos-amd64"
      sha256 "7aa80e63f8f44665d4c62e905a5f438fa844d1b25d90cc8cd70bd74772d1636f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.7/claude-wall-linux-arm64"
      sha256 "d5ca9d5892f3aa93b25387c67da6a7fecbc0d3c90e2ac90df4808a463f2e93c3"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.7/claude-wall-linux-amd64"
      sha256 "8916c1ea31614899505971bdebaf29ae59d6daf4305959d0ac19c9dc8b56b705"
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
