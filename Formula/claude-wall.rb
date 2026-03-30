class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.7.1/claude-wall-macos-arm64"
      sha256 "e61ae318ca7b79575bdf9b338d663a4412d5975724e0e0491f28b05effa648bd"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.7.1/claude-wall-macos-amd64"
      sha256 "105a69e7b46ee697660e915e1c164d46174232f33c536a3c7cc8cb1f431e91d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.7.1/claude-wall-linux-arm64"
      sha256 "8a79cfc26bb6f62e91eeab44a3151e4b1a92d6d20481f07ca3facd89d2ee6ae8"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.7.1/claude-wall-linux-amd64"
      sha256 "137740dfc26e3adf74d363aabcbcc3ca9d5abbf609f8dc2e6da30752ef3bcfa7"
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
