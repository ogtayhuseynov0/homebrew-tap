class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.5.0/claude-wall-macos-arm64"
      sha256 "541d09686849982c7c189567e6227996e6a53c404fd40616de315d52b35c0d36"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.5.0/claude-wall-macos-amd64"
      sha256 "088281b9017a42e81a114bea1333fc585a1341625af5284e95408054c5a2192b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.5.0/claude-wall-linux-arm64"
      sha256 "e03e1a9bb4b519d238ec25abf7eb622ad61110a910847382f0d205540ef14134"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.5.0/claude-wall-linux-amd64"
      sha256 "67a4f9670164b020863d2cd0b182154e3990197c32aab1233b490d347aee2b39"
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
