class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.4.1/claude-wall-macos-arm64"
      sha256 "3eb0e342764ca3a6084953fe0d27f1bc59c8eb42bbf7b3505febe76ffed1d3c7"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.4.1/claude-wall-macos-amd64"
      sha256 "364ad83cf29b20b73c113ec986de9224a75d7a5045b83d8dc975d2ed4b7e1747"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.4.1/claude-wall-linux-arm64"
      sha256 "b0718c659f9d2e232caf39a9d8cb40a8fa5941fec6ed05e308f531dbbe0b10f3"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.4.1/claude-wall-linux-amd64"
      sha256 "463c81c75d353a8911f61499b4b90e4fd3259c8e8b3700a9ad7ec925ca1e32e6"
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
