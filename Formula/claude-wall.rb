class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.2.0/claude-wall-macos-arm64"
      sha256 "ad1784daa15ced2c6837ad7f5348def37723ebb14f8eb9431ffdd77d2fd3ca78"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.2.0/claude-wall-macos-amd64"
      sha256 "e15e25208d15e5b88a6c277b732eb676bbb6c6ae943e8adb78ff0cf2e32bdc61"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.2.0/claude-wall-linux-arm64"
      sha256 "4c2d136d2b48acb13c56a789c9bce4c74adf45ffd3eb6368caffcffb0aa3233c"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.2.0/claude-wall-linux-amd64"
      sha256 "4c2d136d2b48acb13c56a789c9bce4c74adf45ffd3eb6368caffcffb0aa3233c"
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
