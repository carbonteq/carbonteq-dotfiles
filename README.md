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

## 📂 Repository Structure

The repo structure is organized for cross-platform setup and automation.  
For a detailed overview, see [RepositoryStructure.md](./docs/RepositoryStructure.md).

## 📄 Dotfiles & Aliases

Carbonteq dotfiles provide a **standardized development environment** for all team members:

* `dot_gitconfig` → Org-wide Git defaults
* `dot_gitconfig.local` → Your personal Git identity
* `dot_zshrc` → Zsh environment, history, plugins, and shortcuts

All aliases and shell productivity shortcuts are **documented in the `docs` folder**:

* [`docs/GitConfig.md`](./docs/GitConfig.md) — Git aliases
* [`docs/Zshrc.md`](./docs/Zshrc.md) — Shell aliases and shortcuts

> ⚡ For personal tweaks or custom aliases, use `~/.gitconfig.local` and `~/.zshrc.local`.

---


## 📚 References

* [Chezmoi Official Docs](https://www.chezmoi.io/user-guide/)
* [Mise Runtime Manager](https://mise.jdx.dev/)
* [Charmbracelet TUI Ecosystem](https://charm.sh/)
* [Rust Tooling](https://www.rust-lang.org/tools)

