class Swiftenv < Formula
  desc "Swift version manager"
  homepage "https://github.com/rhx/swiftenv"
  url "https://github.com/rhx/swiftenv/archive/1.4.0.tar.gz"
  sha256 "8688f23d8da47f8f4be44dab574b0d7416014127116d56ac6ce8b7af0589187f"
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
