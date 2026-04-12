class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.9.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.5/claude-wall-macos-arm64"
      sha256 "7e991bdaa2e76c25f038975320a19ea8de3f26e0549ed5b169f152260f8573e0"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.5/claude-wall-macos-amd64"
      sha256 "68a17673b54eefe9edda1f7bd6f724dd09ae6b5cfc6b2c8866c8d28dfbff915d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.5/claude-wall-linux-arm64"
      sha256 "40ba82f923303828961c9528e78ac1f54f4ae0a66c5a82ca7165834edfb135ff"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.5/claude-wall-linux-amd64"
      sha256 "43ad07405873cd1066d8c7f12e5878b8bafd3018f701a111832474ad2631dd42"
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
