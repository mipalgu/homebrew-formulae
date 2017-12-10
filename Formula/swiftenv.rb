class Swiftenv < Formula
  desc "Swift version manager"
  homepage "https://github.com/rhx/swiftenv"
  url "https://github.com/rhx/swiftenv/archive/1.4.2.tar.gz"
  sha256 "ab19ae8b5a9fc5073d82f9aa0682b4bad21858f6ba313def13dc706ce4b4f019"
  head "https://github.com/rhx/swiftenv.git"

  def install
    prefix.install Dir["*"]
  end

  def caveats; <<-EOS.undent
    To use Homebrew's directories rather than ~/.swiftenv add to your profile:
      export SWIFTENV_ROOT=#{var}/swiftenv

    To enable shims, add the following to your profile:
      if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
EOS
  end

  test do
    shell_output("eval \"$(#{bin}swiftenv init -)\" && swiftenv versions")
  end
end
