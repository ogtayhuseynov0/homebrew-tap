class ClaudeWall < Formula
  desc "Mission control for Claude Code — monitor all your AI coding agents"
  homepage "https://github.com/ogtayhuseynov0/claude-wall"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.1.0/claude-wall-macos-arm64"
      sha256 "addbb6d72c7bb5b23fac067d99a6d22f650a7c6d0b73e517ce6fdef676dc04ea"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.1.0/claude-wall-macos-amd64"
      sha256 "4df6bbf357edf1e6872acd534a5462dba5e3859ab9e00db0df1af26fe1664a36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.1.0/claude-wall-linux-arm64"
      sha256 "093ec45ef1bec381b3b18ae709ec88e3a1857c31334fe247d8459e30d7363116"
    else
      url "https://github.com/ogtayhuseynov0/claude-wall/releases/download/v0.1.0/claude-wall-linux-amd64"
      sha256 "6ac2867a19edc7160938c0a8064a71b4ce7f06c7db7cf2354e54eaab28123259"
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
