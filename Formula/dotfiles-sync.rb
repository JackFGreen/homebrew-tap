class DotfilesSync < Formula
  desc "Dotfiles bidirectional sync tool with age encryption support"
  homepage "https://github.com/JackFGreen/dotfiles-sync"
  url "https://github.com/JackFGreen/dotfiles-sync/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "dab5de18b0a4bad63a25912848f992e5d8ea09e7a4d580a5e007c28562372eec"
  license "MIT"

  depends_on "age" => :optional

  def install
    bin.install "bin/dotfiles-sync"
    lib.install "lib/core.sh"
    pkgshare.install "dotfiles-sync.conf.example"
  end

  def caveats
    <<~EOS
      To use dotfiles-sync, add the following to your shell profile:
        export PATH="#{bin}:$PATH"

      Example config file available at:
        #{pkgshare}/dotfiles-sync.conf.example
    EOS
  end

  test do
    assert_match "dotfiles-sync", shell_output("#{bin}/dotfiles-sync --help")
  end
end
