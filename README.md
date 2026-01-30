Got it — you want a professional-style `README.md` for the **Carbonteq Dotfiles Repository**, reflecting your file structure, purpose, and automation logic with **Chezmoi**.  
Here’s a polished and GitHub‑ready draft, styled like official open‑source dotfile repos (e.g. `thoughtbot/dotfiles`, `mathiasbynens/dotfiles`, and Crisp or Carbon roles).

***

# 🧩 Carbonteq Dotfiles

> ⚙️ Seamless developer environment automation across macOS and Linux, powered by **Chezmoi**, **Mise**, and **Rust‑driven toolchains**.



***

### 🌱 About Dotfiles

Dotfiles are configuration files that define how your development environment behaves — your shell, tools, editors, and utilities.  
By managing them centrally, you can **replicate the same setup across any machine** with one command.  

At Carbonteq, our dotfiles automate:

- Installing core developer tools and shells  
- Setting up cloud, Docker, and CLI utilities  
- Bootstrapping terminal‑based UIs and modern dev environments  
- Applying OS‑specific logic for macOS (`darwin`) and Linux (`ubuntu`/`noble`)  

***

## 📁 Repository Structure

```bash
~/.local/share/chezmoi
├── .chezmoiscripts
│   ├── darwin
│   │   ├── run_onchange_before_00-install-brew-bundles.sh.tmpl
│   │   └── run_onchange_after_10-install-shell.sh.tmpl
│   ├── linux
│   │   ├── run_onchange_before_00-install-system-deps.sh.tmpl
│   │   ├── run_onchange_after_10-install-docker.sh.tmpl
│   │   ├── run_onchange_after_20-install-browsers.sh.tmpl
│   │   ├── run_onchange_after_30-install-dev-gui.sh.tmpl
│   │   ├── run_onchange_after_40-install-cloud-tools.sh.tmpl
│   │   └── run_onchange_after_50-install-shells.sh.tmpl
│   └── shared
│       ├── run_onchange_after_10-install-mise-runtimes.sh.tmpl
│       ├── run_onchange_after_20-install-rust-tools.sh.tmpl
│       └── run_onchange_after_30-install-tui.sh.tmpl
├── .chezmoitemplates
│   └── scripts_library.sh
├── dot_gitconfig
├── dot_gitconfig.local
├── dot_gitignore_global
├── dot_zshrc
```

Each script category automates installation of system tools, language runtimes, and terminal frameworks using `chezmoi` change triggers.

***

## 🔧 Tools Installed Automatically

Includes environment‑wide setup for:

**Core Tools**
- pnpm, bun, node (LTS)  
- docker, google‑cloud‑sdk, cloudflare tunnel  
- github‑cli, mise (version management)

**Shells & Terminals**
- fish, nushell, zsh  
- alacritty, starship, atuin, zellij

**CLI Utilities**
- ripgrep, fd, bat, eza, zoxide, xh  
- gitui, dust, dua, hyperfine, delta, tokei  
- just, mask, mprocs, fselect, kondo, bob‑nvim, espanso

**TUI Tools**
- gum, charm, presenterm, wiki‑tui, rusty‑man

**Apps**
- Zed, Mattermost, Chrome  
- Google Cloud SDK, Cloudflared

***

## 🚀 Getting Started with Chezmoi

Chezmoi is a dotfile manager that ensures your configuration stays consistent across machines.

### 1. Install Chezmoi
```bash
# Linux
sh -c "$(curl -fsLS get.chezmoi.io)"

# macOS (via Homebrew)
brew install chezmoi
```

### 2. Initialize from this repo
```bash
chezmoi init carbonteq
```

### 3. Apply your setup
```bash
chezmoi apply
```

Chezmoi will automatically detect your OS and execute the related `.chezmoiscripts`.

***

## 🧭 Common Chezmoi Commands

| Command | Description |
|----------|-------------|
| `chezmoi init <repo>` | Clone and initialize dotfiles from a Git repo |
| `chezmoi apply` | Apply and sync all dotfiles to your system |
| `chezmoi diff` | Show what changes will be made |
| `chezmoi edit <file>` | Edit a managed file |
| `chezmoi add <path>` | Add a new file to dotfile management |
| `chezmoi re-add` | Re-scan and add local changes |
| `chezmoi update` | Pull and apply updates from remote |

***

## 🧱 How It Works

Chezmoi runs **on‑change scripts**:
- `before` scripts handle system or dependency bootstrap.
- `after` scripts install apps, shells, and tools.
- Shared scripts (in `.chezmoiscripts/shared`) install language runtimes and Rust‑based toolchains.

This ensures idempotent, cross‑platform automation. Each run will **skip already‑installed** tools and only install missing ones.

***

## ✨ Preview

Here’s a preview of what happens during installation:

  
*(Replace with actual repo GIF once ready.)*

***

## 📚 References

- [Chezmoi Official Docs](https://www.chezmoi.io/user-guide/)
- [Mise Runtime Manager](https://mise.jdx.dev/)
- [Charmbracelet TUI Ecosystem](https://charm.sh/)
- [Rust Tooling](https://www.rust-lang.org/tools)

***

Would you like this README exported in **Markdown with GitHub badges and colorized section headings** (for example, adding 🧩 badges for “Setup”, “Tools”, etc.) or keep it cleaner and minimal for internal developer use?
