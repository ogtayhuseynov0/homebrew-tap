class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.7.0/claude-wall-macos-arm64"
      sha256 "2a59d16dd9d80676a1346102c8c66444c2384deab0e226218ce472cd2d6aa868"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.7.0/claude-wall-macos-amd64"
      sha256 "3cc11ebcf74cc3823aec9374666f74f5733cb46cd83e863f5a5821cabe50684a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.7.0/claude-wall-linux-arm64"
      sha256 "91d52ea37a430046ec356c349e1819d973fdc8b54c0e088c6a5fee25c0728d5f"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.7.0/claude-wall-linux-amd64"
      sha256 "9c819a4a6052642c467870a24f05d36db271043cd19674af94b11f20262ee630"
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
