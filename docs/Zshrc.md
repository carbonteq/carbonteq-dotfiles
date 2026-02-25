# ZshRC - Organizational Base

## Purpose

Standardized Zsh environment for org developers.

* Safe defaults for history, plugins, environment, aliases, prompt.
* Personal overrides via `~/.zshrc.local`.

---

## History Settings

```bash id="hx8q3v"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
```

* Large, shared, duplicate-free history
* Useful for auditability and session continuity

---

## Plugins

```bash id="dtxp1q"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
```

* Minimal, performant set
* Git helpers, autosuggestions, syntax highlighting

---

## Environment Variables

```bash id="z4er8v"
export EDITOR='nvim'
export PATH="$HOME/.local/bin:$PATH"
export LANG=en_US.UTF-8
export ORG_NAME="{{ .org_name | default "YourOrg" }}"
{{ if .use_secrets }}export AWS_PROFILE="{{ .aws_profile }}"{{ end }}
```

* Standard editor and PATH
* UTF-8 locale
* Org and optional secrets support

---

## Git Aliases

| Alias  | Command                              |
| ------ | ------------------------------------ |
| `g`    | git                                  |
| `ga`   | git add                              |
| `gc`   | git commit -v                        |
| `gp`   | git push                             |
| `gl`   | git pull --rebase                    |
| `gst`  | git status                           |
| `gd`   | git diff                             |
| `glog` | git log --oneline --graph --decorate |

---

## General Productivity Aliases

```bash id="u4hzxv"
alias ls='ls -G'
alias ll='ls -lAh'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
```

---

## DevOps Shortcuts

```bash id="n2jhdv"
alias k='kubectl'
alias tf='terraform'
alias docker-clean='docker system prune -f'
```

---

## Project Environment Hook

```bash id="g9tr2v"
eval "$(direnv hook zsh)"
```

* Automates per-project environment variables

---

## Prompt

```bash id="h1kq3v"
PROMPT='%F{green}%n@%m%f %F{blue}%~%f %F{red}$(git_prompt_info)%f %F{white}❯%f '
```

* Shows user, host, current directory, Git status, and exit code

---

## Local Overrides

```bash id="x4t9qv"
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
```

* Allows personal tweaks without changing org defaults

