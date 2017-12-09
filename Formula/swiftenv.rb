class Swiftenv < Formula
  desc "Swift version manager"
  homepage "https://github.com/rhx/swiftenv"
  url "https://github.com/rhx/swiftenv/archive/1.4.1.tar.gz"
  sha256 "2b96332db0de8bf17e35021c3feaac26e1e62b9bbc09f074a47716321b178b11"
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
