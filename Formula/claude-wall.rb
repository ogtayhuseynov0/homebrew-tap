class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.0/claude-wall-macos-arm64"
      sha256 "155013e804bfad62937f2188c5b39a27ff57c77356e384afe396644bd7434483"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.0/claude-wall-macos-amd64"
      sha256 "a37cf963cf273da25c27cb828377c798fed4b1354e54fd8449d6509ee44bd0fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.0/claude-wall-linux-arm64"
      sha256 "924ad834da98c817ae4020357e2d1e8a1732b2e82cf38d9ba3b1aa57a5eefc07"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.0/claude-wall-linux-amd64"
      sha256 "4e309c528790c2659bb96c53bb9681965bfe382149a502b93562206af3e513ba"
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
