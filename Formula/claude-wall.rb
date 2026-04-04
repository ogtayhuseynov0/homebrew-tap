class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.1/claude-wall-macos-arm64"
      sha256 "3c61917264549bbf20b1a7e4afe525a88cf9e4c8df9049b8bca4b80ab2628b92"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.1/claude-wall-macos-amd64"
      sha256 "c47402d33ff0a01e3b8193347ea4b5236984832d4e3b09f0590728f205df7360"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.1/claude-wall-linux-arm64"
      sha256 "f5ba4a8cdd0e131153a0d2a04c8b7094cb5463989ea9a966cdbeb7e607a85112"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.1/claude-wall-linux-amd64"
      sha256 "d62475149d5165fb2206b06a40120f29568afb40cd60635beb3012a9da05494e"
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
