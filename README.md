# homebrew-cast-routines

Homebrew tap for [cast-routines](https://github.com/ek33450505/cast-routines) — schedule autonomous Claude Code routines via YAML + cron.

## Install

```bash
brew tap ek33450505/cast-routines
brew install cast-routines
bash "$(brew --prefix cast-routines)/install.sh"
```

`install.sh` is idempotent — copies the runner, DB helper, CLI, and starter routine YAMLs into `~/.claude/`. Safe to re-run.

## Uninstall

```bash
bash "$(brew --prefix cast-routines)/uninstall.sh"
brew uninstall cast-routines
brew untap ek33450505/cast-routines
```

## See also

- [cast-routines](https://github.com/ek33450505/cast-routines) — source repo
- [claude-agent-team](https://github.com/ek33450505/claude-agent-team) — full CAST framework
- [The full CAST ecosystem](https://github.com/ek33450505/claude-agent-team#the-cast-ecosystem)
