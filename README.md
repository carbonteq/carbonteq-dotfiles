# 🧩 Carbonteq Dotfiles

> ⚙️ Setup your developer environment across **macOS** and **Linux**, powered by **Chezmoi**.

---

### 🌱 About

Dotfiles define how your development environment behaves — your shell, editors, tools, and utilities.
With Carbonteq Dotfiles, you can **replicate the same setup across any machine** with just one command.

These dotfiles automate:

* Core developer tools and shell installation
* Cloud, Docker, and CLI utilities setup
* Terminal-based UIs and modern dev environments
* OS-specific logic for macOS (`darwin`) and Linux (`ubuntu` / `noble`)

---

![Demo GIF](./demo.gif)

**Note:** Already-installed tools are skipped during setup.

---

## 🚀 Getting Started

### 1. Install Chezmoi

```bash
# Linux
snap install chezmoi --classic

# macOS (via Homebrew)
brew install chezmoi
```

### 2. Initialize from this repo

```bash
# via HTTPS
chezmoi init https://github.com/carbonteq/carbonteq-dotfiles.git

# via SSH
chezmoi init git@github.com:carbonteq/carbonteq-dotfiles.git
```

### 3. Apply your setup

```bash
# Pull latest changes and apply automatically
chezmoi update

# Only apply existing local dotfiles to your machine
chezmoi apply
```

Chezmoi will detect your OS and execute the relevant `.chezmoiscripts`.

---

### 👤 Git Identity Setup (Automated)

During the initial setup, a script will automatically prompt you for your **Full Name** and **Work Email**. This creates your local identity file: `~/.gitconfig.local`.


**Need to change your name/email later?**
Simply edit the local file directly: `nano ~/.gitconfig.local`

---

### 🔄 How Dotfiles Work

```
          +-------------------------------+
          |  Carbonteq Dotfiles Repo      |
          |  (GitHub / GitLab remote)    |
          +---------------+---------------+
                          |
                          | 1. Initial Pull / Clone
                          |    (chezmoi init)
                          v
          +-------------------------------+
          |      Local Chezmoi State      |
          | (~/.local/share/chezmoi)     |
          +---------------+---------------+
                          |
          +---------------+---------------+
          |                               |
          | 2a. Apply Dotfiles             |
          |     (chezmoi apply)            |
          |     - Copies dotfiles from     |
          |       local state to your      |
          |       home directory (~/.bashrc, ~/.config, etc.) |
          |                               |
          | 2b. Update & Auto-Apply       |
          |     (chezmoi update)           |
          |     - Pulls latest changes     |
          |       from the remote repo     |
          |     - Updates local state      |
          |     - Automatically applies    |
          |       dotfiles to your system  |
          +---------------+---------------+
                          |
                          v
          +-------------------------------+
          |     Local Machine (~HOME)      |
          | - ~/.bashrc / ~/.zshrc         |
          | - ~/.config / Terminal setup   |
          | - Dev & CLI tools setup        |
          +-------------------------------+
```

**Key Commands:**

* `chezmoi apply` → Apply dotfiles from your local Chezmoi state to your machine.
* `chezmoi update` → Pull the latest Carbonteq dotfiles from the remote repo **and automatically apply them**.

---

## 🧭 Common Chezmoi Commands

| Command               | Description                                        |
| --------------------- | -------------------------------------------------- |
| `chezmoi init <repo>` | Clone and initialize dotfiles from a Git repo      |
| `chezmoi apply`       | Apply all dotfiles from local state to your system |
| `chezmoi diff`        | Show what changes will be made                     |
| `chezmoi edit <file>` | Edit a managed file                                |
| `chezmoi add <path>`  | Add a new file to dotfile management               |
| `chezmoi re-add`      | Re-scan and add local changes                      |
| `chezmoi update`      | Pull latest changes from remote and auto-apply     |

---

## 🔧 Tools Installed Automatically

**Core Tools**

* pnpm, bun, node (LTS)
* docker, Google Cloud SDK, Cloudflared
* GitHub CLI, Mise runtime manager

**Shells & Terminals**

* fish, nushell, zsh
* alacritty, starship, atuin, zellij

**CLI Utilities**

* ripgrep, fd, bat, eza, zoxide, xh
* gitui, dust, dua, hyperfine, delta, tokei
* just, mask, mprocs, fselect, kondo, bob-nvim, espanso

**TUI Tools**

* gum, charm, presenterm, wiki-tui, rusty-man

**Apps**

* Zed, Mattermost, Chrome, Apidog, Anytype

---

## 📁 Repository Structure

```bash
~/.local/share/chezmoi
├── .chezmoiscripts
│   ├── darwin
│   │   ├── run_onchange_before_00-install-brew-bundles.sh.tmpl
│   │   └── run_onchange_after_10-install-shell.sh.tmpl
│   ├── linux
│   │   ├── run_onchange_before_00-install-system-deps.sh.tmpl
│   │   ├── run_onchange_after_10-install-docker.sh.tmpl
│   │   ├── run_onchange_after_20-install-browsers.sh.tmpl
│   │   ├── run_onchange_after_30-install-dev-gui.sh.tmpl
│   │   ├── run_onchange_after_40-install-cloud-tools.sh.tmpl
│   │   └── run_onchange_after_50-install-shells.sh.tmpl
│   └── shared
│       ├── run_onchange_after_10-install-mise-runtimes.sh.tmpl
│       ├── run_onchange_after_20-install-rust-tools.sh.tmpl
│       └── run_onchange_after_30-install-tui.sh.tmpl
├── .chezmoitemplates
│   └── scripts_library.sh
├── dot_gitconfig
├── dot_gitconfig.local
├── dot_gitignore_global
├── dot_zshrc
```

* The script are categorized by OS, and chezmoi run it in alphabetical order. 
* `run_onchange_before` and `run_onchange_after` are reserved keywords in chezmoi and are explained below. The numerical numbering after it ( `00, 10, 20, 30...`) defines the order of execution.
   
   * `run_onchange` scripts run only first time and when it detects any new changes.
   * `before` scripts run before dotfiles are copied.
   * `after` scripts run after dotfiles are applied.

---

## 📄 Dotfiles Breifly Explained

This repository manages a small, opinionated set of dotfiles designed for **consistency, safety, and productivity** across all Carbonteq developer machines.

### `dot_gitconfig`

Provides **organization-wide Git defaults** such as editor configuration, pull/rebase behavior, aliases, diff/merge tooling, and standardized branch conventions.
⚠️ **Do not edit this file** — it is shared across all developers. Personal identity is intentionally excluded and loaded separately from `~/.gitconfig.local`.

### `dot_gitconfig.local`

Holds your **personal Git identity** (`name` and `email`). This file is unique per developer and never committed to the repository.
You **must replace the placeholder values** after setup to ensure commits are correctly attributed.

### `dot_gitignore_global`

Defines **global ignore rules** applied to all Git repositories on your machine.
It filters out OS files (`.DS_Store`, `Thumbs.db`), editor artifacts (`.vscode/`, `.idea/`), and common environment folders (`node_modules/`, `.venv/`, `.terraform/`) so they never appear in `git status`.

### `dot_zshrc`

Sets up a **standardized Carbonteq shell environment** using Zsh.
It configures history behavior, plugins, environment variables, Git helpers, DevOps shortcuts, and a clean prompt. A local override layer (`~/.zshrc.local`) is supported for personal tweaks without breaking the shared setup.

## ⚡ Aliases & Productivity Shortcuts

The provided aliases are designed to **reduce keystrokes**, **standardize workflows**, and **speed up daily development tasks**.

* **Git aliases** (`g`, `ga`, `gc`, `gp`, `gl`, `gst`, `gd`, `glog`) cover the most common actions with short, memorable commands.
* **Navigation aliases** (`..`, `...`, `ll`) make filesystem movement faster.
* **DevOps shortcuts** (`k`, `tf`, `docker-clean`) reflect common platform and infrastructure workflows.
* All aliases are intentionally **minimal and predictable** — you should be able to guess them without memorization.

If you need custom aliases, add them to `~/.zshrc.local` to keep the shared configuration clean and update-safe.


---



## 📚 References

* [Chezmoi Official Docs](https://www.chezmoi.io/user-guide/)
* [Mise Runtime Manager](https://mise.jdx.dev/)
* [Charmbracelet TUI Ecosystem](https://charm.sh/)
* [Rust Tooling](https://www.rust-lang.org/tools)

