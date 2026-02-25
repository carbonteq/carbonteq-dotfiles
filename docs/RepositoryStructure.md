# Repository Structure

Carbonteq dotfiles are organized for **clarity, cross-platform support, and automation**.

```
.
├── demo.gif                  # Demo GIF of setup
├── docs                      # Detailed alias and shell docs
│   ├── GitConfig.md          # Git aliases reference
│   └── Zshrc.md              # Zsh aliases & shortcuts reference
├── dot_gitconfig             # Org-wide Git defaults
├── dot_gitignore_global      # Global Git ignore rules
├── dot_zshrc                 # Standardized Zsh environment
├── mprocs.log                # Logs from dotfile scripts
└── README.md                 # Main project README

.chezmoiscripts/              # OS-specific & shared scripts
├── darwin                    # macOS installation scripts
├── gitsetup                  # Git identity setup scripts
├── linux                     # Linux installation scripts
├── shared                    # Cross-platform helper scripts
└── windows                   # Windows installation scripts


~/.local/share/chezmoi
├── .chezmoiscripts
│   ├── darwin
│   │   ├── run_onchange_before_00-install-brew-bundles.sh.tmpl
│   │   └── run_onchange_after_10-install-shell.sh.tmpl
│   ├── gitsetup
│   │   ├── run_once_before_setup-git-identity.ps1.tmpl
│   │   └── run_once_before_setup-git-identity.sh.tmpl
│   ├── linux
│   │   ├── run_onchange_before_00-install-system-deps.sh.tmpl
│   │   ├── run_onchange_after_10-install-docker.sh.tmpl
│   │   ├── run_onchange_after_20-install-browsers.sh.tmpl
│   │   ├── run_onchange_after_30-install-dev-gui.sh.tmpl
│   │   ├── run_onchange_after_40-install-cloud-tools.sh.tmpl
│   │   └── run_onchange_after_50-install-shells.sh.tmpl
│   ├── shared
│   │   ├── run_onchange_after_10-install-mise-runtimes.sh.tmpl
│   │   ├── run_onchange_after_20-install-rust-tools.sh.tmpl
│   │   └── run_onchange_after_30-install-tui.sh.tmpl
│   └── windows
│       └── run_onchange_before_install-packages.ps1.tmpl
├── .chezmoitemplates
│   └── scripts_library.sh
├── demo.gif
├── docs
│   ├── GitConfig.md
│   └── Zshrc.md
├── dot_gitconfig
├── dot_gitconfig.local
├── dot_gitignore_global
├── dot_zshrc
├── mprocs.log
└── README.md
```

* Scripts are categorized by OS (`darwin`, `linux`, `windows`) and shared cross-platform helpers.
* Scripts are executed in **alphabetical order** by default.
* `run_onchange_before` and `run_onchange_after` are special chezmoi keywords:

  * `run_onchange` → executed only on first run or when changes are detected
  * `before` → runs **before** dotfiles are copied
  * `after` → runs **after** dotfiles are applied
* Numeric prefixes (`00, 10, 20…`) define **execution order within a category**.

> Dotfiles (`dot_gitconfig`, `dot_zshrc`, etc.) and templates are applied automatically to the home directory during `chezmoi apply`.

