# GitConfig - Organizational Base

## Purpose

Standard org-wide Git configuration.

* Safe defaults for editor, diff/merge tools, aliases, and cross-platform usage.
* Personal identity and workflow overrides via `~/.gitconfig.local`.

---

## Base Configuration

### Editor

```ini
[core]
editor = code --wait
autocrlf = input
ignorecase = false
excludesfile = ~/.gitignore_global
```

### Default Branch

```ini
[init]
defaultBranch = main
```

### Push

```ini
[push]
default = current
autoSetupRemote = true
```

### Color

```ini
[color]
ui = auto
```

### Diff / Merge

```ini
[diff]
tool = vscode
renames = copies

[merge]
tool = vscode
conflictstyle = zdiff3
```

### Local Overrides

```ini
[include]
path = ~/.gitconfig.local
```

---

## Aliases

| Alias  | Command                                                                                                                       | Notes                          |
| ------ | ----------------------------------------------------------------------------------------------------------------------------- | ------------------------------ |
| `st`   | `status`                                                                                                                      | Git status                     |
| `co`   | `checkout`                                                                                                                    | Branch/file checkout           |
| `br`   | `branch`                                                                                                                      | Branch list/manage             |
| `cp`   | `cherry-pick`                                                                                                                 | Apply commit to current branch |
| `up`   | `pull --rebase --autostash`                                                                                                   | Optional workflow; use alias   |
| `last` | `log -1 HEAD`                                                                                                                 | Show last commit               |
| `lg`   | `log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit` | Graph view for PRs             |

---

## Notes

* Do **not** set personal name/email here. Use `~/.gitconfig.local`.
* Safe defaults only; history-changing settings are optional via aliases.
* Aliases provide recommended workflow without enforcing history rewrites.

