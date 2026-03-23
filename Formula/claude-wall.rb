class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.3.0/claude-wall-macos-arm64"
      sha256 "4b70d00d8af60ba9791f17f88d97fcb31e62b293773916384d1d592db6f52ba2"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.3.0/claude-wall-macos-amd64"
      sha256 "f9e609874346f3400310161e79d106266bc8050e874be324b2d7b68018bab047"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.3.0/claude-wall-linux-arm64"
      sha256 "cab91e8dd380290fd725b589e5bfacdfa4c91ed89c4fe719fa10625c680875cb"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.3.0/claude-wall-linux-amd64"
      sha256 "59de8fe434e095bda408d439265bd50406df982724a075bbda67cecbda2246da"
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
