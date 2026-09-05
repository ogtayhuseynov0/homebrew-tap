class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.9.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.8/claude-wall-macos-arm64"
      sha256 "db96b6b068d76823e43882c8a64aab3ff51576a519ce7a5c0695acc1c938cf1d"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.8/claude-wall-macos-amd64"
      sha256 "e22b3454bcb461137adcf8b556fd834ccf5cbcf901cdcace3e1b706eba56037b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.8/claude-wall-linux-arm64"
      sha256 "147244a48f144ec87fbac65e01de7438136cd1b269adfff044cad030a28e9ed8"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.9.8/claude-wall-linux-amd64"
      sha256 "35df206230b5bc1dcc5a4076392b6d1c361de8aeeaa20ba45f7fb3cca571d8c8"
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
