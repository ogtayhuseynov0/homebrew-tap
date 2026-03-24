class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.5.1/claude-wall-macos-arm64"
      sha256 "93783dfad915da251b023951543091cf78f3cd086ffdf7f8c3b753510a090208"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.5.1/claude-wall-macos-amd64"
      sha256 "0c1dbcec12e3d9483a676bbc05f3b328ce21b121ca8f9b1b2f65c1b43efcbfe6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.5.1/claude-wall-linux-arm64"
      sha256 "1cb5c13710555d14c221003591b82ce73b4b5c1b211fddb75ca6927d12ec9362"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.5.1/claude-wall-linux-amd64"
      sha256 "be0e2cb2a038038673094378f47a92f0a0505902c95e025ee937a41ddfb3a168"
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
