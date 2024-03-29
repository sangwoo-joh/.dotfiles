# .dotfiles

 :house: My personal `.dotfiles`.

## How to install

 Just run `./install {target}`.

 If you want to control the granularity of installations, set
 `{target}` correctly. You can see the full list with `./install
 --help`.

## Status

### OS Support

 | OS | Status | Description
 | --- | :---: | --- |
 | macOS ( :apple: ) | :heavy_check_mark: | macOS 11+
 | Debian Linux (:penguin:) | :heavy_check_mark: | Any systems based on Ubuntu 20.04+ |
 | Other *nix Systems | :x: | Not sure I'm going to use them |

## Supported Targets

 | Target | Status | Description |
 | --- | :---: | --- |
 | configurations | :heavy_check_mark: | :house: Personal configurations incuding zsh, tmux, git, nvim. |
 | emacs | :heavy_check_mark: | :unicorn: You should use Emacs. I'm serious. |
 | ocaml | :heavy_check_mark: | :camel: My favourite programming language. |
 | packages | :heavy_check_mark: | :floppy_disk: Packages that I'm familiar with. |
 | cargo | :heavy_check_mark: | :crab: Some alternatives for built-in binaries. |
 | font | :heavy_check_mark: | :black_nib: [D2coding](https://github.com/naver/d2codingfont) and [powerline](https://github.com/powerline/fonts). |

## Alerts
 - `zsh` is NOT INSTALLED by this installer, even though `./install config` sets
   up some rc files for `zsh`. This is because I also use WSL2 *without* `zsh`.
   So if you want to use my `zsh` configurations correctly, you should install
   `zsh` by yourself and change `zsh` as default shell via `chsh -s $(which
   zsh)`.
