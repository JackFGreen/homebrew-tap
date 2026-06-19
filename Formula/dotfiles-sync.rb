class DotfilesSync < Formula
  desc "Dotfiles bidirectional sync tool with age encryption support"
  homepage "https://github.com/JackFGreen/dotfiles-sync"
  url "https://github.com/JackFGreen/dotfiles-sync/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b6bb181b608ee3687aff73449ae9cccf9da9ae284e897d7f7e259efadbcf15ed"
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
