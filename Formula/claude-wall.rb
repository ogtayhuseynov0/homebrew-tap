class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.11.1/claude-wall-macos-arm64"
      sha256 "112fc9d5b78d1c1cf27236d08530d6607ed39e4f7c7a1ad35c1afc76d4089059"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.11.1/claude-wall-macos-amd64"
      sha256 "f8b72ffb943e01a96e031e46da2529c1ab279f7cb928e3f09954b3af9735fd33"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.11.1/claude-wall-linux-arm64"
      sha256 "aff852085ab53c1a72834f124435b170784ab2bd724216e91b3bd1e0814863b7"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.11.1/claude-wall-linux-amd64"
      sha256 "9f2ecbe50d4846cbe6a4100715fac29eb8f6bd25d0d301991b3e521019e04a3e"
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
