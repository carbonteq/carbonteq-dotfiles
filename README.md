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

## 🚀 Getting Started

### 1. Install Chezmoi

```bash
# Linux
sudo apt install chezmoi --classic

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

## 🧱 How It Works

* **On-change scripts**:

  * `before` scripts run before dotfiles are copied.
  * `after` scripts run after dotfiles are applied.
* **Shared scripts** install language runtimes and Rust-based toolchains.

This ensures **idempotent, cross-platform automation**. Already-installed tools are skipped.

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

Each script category automates installation of system tools, language runtimes, and terminal frameworks using Chezmoi change triggers.

---

## 📚 References

* [Chezmoi Official Docs](https://www.chezmoi.io/user-guide/)
* [Mise Runtime Manager](https://mise.jdx.dev/)
* [Charmbracelet TUI Ecosystem](https://charm.sh/)
* [Rust Tooling](https://www.rust-lang.org/tools)

