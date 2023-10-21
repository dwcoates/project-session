# Installation

Just install with your favorite package manager using this GitHub repository (e.g., adding `{dwcoates/project-session}` to your package manager intialization list) and add the following to your Lua configuration:

```lua
require('project-session')
```

# Usage

`project-session` will automatically save your session on a per-project basis, where whether the current working directory is in a git repository. Each project can have exactly one session. If you want to disable this at runtime, you can launch Neovim with the `no-save-session` arugment:

```bash
$ nvim -- no-save-session
```

The session data is saved to `/path/to/parent/of/.git/directory/.nvim-session.vim`

A session can be cleared -- forcefully deleting all buffers and updating the session file -- with `:ClearSession`.

To automatically start Neovim with the session if possible, you can use [nvim_git.sh](./bash/nvim-git.sh), which supports custom `nvim` scripts (e.g., `lvim`). You can also use this to add an alias to your shell, for example, by adding to your `.zshrc` (replacing the path):

```zsh
alias v=/path/to/nvim-git.sh 
```
