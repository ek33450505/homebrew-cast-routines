class CastRoutines < Formula
  desc "Schedule autonomous Claude Code routines via YAML + cron"
  homepage "https://github.com/ek33450505/cast-routines"
  url "https://github.com/ek33450505/cast-routines/archive/refs/tags/v0.1.1.tar.gz"
  version "0.1.1"
  sha256 "200670580cf973cbe34aac8936742e87d3b89e4d28ed7bd44f01b388f0115104"
  license "MIT"

  depends_on "python@3.12"

  def install
    prefix.install "install.sh"
    prefix.install "uninstall.sh"
    prefix.install "VERSION"
    prefix.install "README.md"
    prefix.install "LICENSE"
    (prefix/"bin").install Dir["bin/*"]
    (prefix/"scripts").install Dir["scripts/*"]
    (prefix/"routines").install Dir["routines/*"]

    # Symlink the CLI into HOMEBREW_PREFIX/bin so it's on PATH after brew install
    bin.install_symlink prefix/"bin/cast-routines"
  end

  def caveats
    <<~EOS
      cast-routines files are staged at #{prefix}.

      To complete installation (copies helpers + starter routines into ~/.claude/):
        bash #{prefix}/install.sh

      PyYAML is required at runtime:
        pip3 install pyyaml

      To uninstall:
        bash #{prefix}/uninstall.sh

      See: https://github.com/ek33450505/cast-routines
    EOS
  end

  test do
    assert_predicate prefix/"install.sh",       :exist?
    assert_predicate prefix/"bin/cast-routines", :exist?
    assert_match "cast-routines", shell_output("#{bin}/cast-routines version 2>&1")
  end
end
