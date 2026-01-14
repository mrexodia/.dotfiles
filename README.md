# macos

Update/create `~/.zshrc`:

```sh
source ~/.dotfiles/zshrc
source ~/.dotfiles/macos
```

Applications:

- [Karabiner Elements](https://karabiner-elements.pqrs.org/): `.config/karabiner/karabiner.json`
- [OpenSuperWhisper](https://github.com/Starmel/OpenSuperWhisper)
- [Obsidian](https://obsidian.md/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Firefox](https://www.firefox.com/en-US/browsers/desktop/)
- [iTerm2](https://iterm2.com/)
- [Mouseless](https://mouseless.click/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Multipass](https://canonical.com/multipass/install)
- [Syncthing](https://github.com/syncthing/syncthing-macos/releases)
- [Workflowy](https://workflowy.com/download/)
- [Sublime Merge](https://www.sublimemerge.com/)
- [Claude](https://claude.ai/download)
- [LM Studio](https://lmstudio.ai/)
- [Discord](https://discord.com/download)
- [RustDesk](https://rustdesk.com/)
- [Bitwarden](https://apps.apple.com/pl/app/bitwarden/id1352778147?mt=12)
- [AdGuard for Safari](https://apps.apple.com/pl/app/adguard-for-safari/id1440147259?mt=12)
- [Wireguard](https://apps.apple.com/pl/app/wireguard/id1451685025?mt=12)
- [AltTab](https://alt-tab-macos.netlify.app/)
- [Stats](https://github.com/exelban/stats)
- [OpenInTerminal](https://github.com/Ji4n1ng/OpenInTerminal)
- [Keka](https://www.keka.io/en/)
- [Spokenly](https://spokenly.app/)

[Homebrew](https://brew.sh/) packages:

```sh
brew install gh ripgrep uv node
```

# Git

Git aliases (`git config --global --edit`):

```
[alias]
    s = status
    f = fetch
    r = remote -v
    ci = !git add . && git commit --amend --no-edit --no-verify
    force = push -f
[interactive-rebase-tool]
    inputmoveselectiondown=k
    inputmoveselectionup=i
```

```sh
cargo install --git https://github.com/MitMaro/git-interactive-rebase-tool
git config --global sequence.editor interactive-rebase-tool
```

Git commit message hooks:

```sh
git config --global core.hookspath ~/.git-hooks
```
