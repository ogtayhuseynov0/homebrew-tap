class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.6.0/claude-wall-macos-arm64"
      sha256 "6e651d8c6deff3d3cf2909d19bb39a3bd2a52e532852d7bd05a191b0838d56d7"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.6.0/claude-wall-macos-amd64"
      sha256 "68b2626cd7429d60ca611227014bdf7f9d3815b5aa9962023fef26607bd08d84"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.6.0/claude-wall-linux-arm64"
      sha256 "e5f91681198e4550c47f0db4d72987439619a5ccb5ffcb1b7454581fbff219ab"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.6.0/claude-wall-linux-amd64"
      sha256 "56043e1cf581391894deece8d00e8725af2f6769542064658df4909be08e645c"
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
