class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.10.0/claude-wall-macos-arm64"
      sha256 "c7e7841da4ba2801cf0b3152eff9920405c89a6681595fdba089ab6540766829"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.10.0/claude-wall-macos-amd64"
      sha256 "1155f3eed1ffc4ff116165d4a416e015e24e9432a778e73da55d9e742c9b2ef1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.10.0/claude-wall-linux-arm64"
      sha256 "1dc3deb670d2cd7df8c470a34aab8618d89bc64eae5af3d84390f18d40e5f14c"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.10.0/claude-wall-linux-amd64"
      sha256 "c2dcc5eeae140d291473cbf69c7b80f111d31869a8ecf5361628b71f64616ed6"
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
