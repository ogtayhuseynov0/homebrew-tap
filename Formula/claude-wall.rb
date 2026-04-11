class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.9.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.3/claude-wall-macos-arm64"
      sha256 "716b0dce2dc2920c0c2b2ca92df72f31e4a4d0bb254d5b90ed5ee1d462ddfa57"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.3/claude-wall-macos-amd64"
      sha256 "5bd2526ea1b06f1dfd53ebdba81be53daea4cc8458a692851eed15511ba03af0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.3/claude-wall-linux-arm64"
      sha256 "36f5dd9b7ee353ff48565a60dd5339ac38a3e06e7e0f950702e1b900eba1abdc"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.3/claude-wall-linux-amd64"
      sha256 "0562a86066fd650d5d8288dd952144fe7881dd30c9034e41814966706099e3cf"
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
