autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
# RPROMPT=$RPROMPT'${vcs_info_msg_0_}' 
PROMPT='%{${fg[white]}%}[%n@localhost %10c] (%D{%Y/%m/%f} %D{%T}) ${vcs_info_msg_0_} %{${fg[red]}%}%(?..[%?] )%{${reset_color}%}
$ '
# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

# 補完機能を有効にする
fpath=(/usr/local/share/zsh-completions $fpath)
source <(kubectl completion zsh)
autoload -Uz compinit
compinit -u

# alias
alias ls='ls -G -F'
alias la='ls -a'
alias ll='ls -al'
alias ssh='ssh -A'
alias vi='vim'
alias d='docker'
alias dc='docker-compose'
alias kc='kubectl'
alias ldconfig='sudo update_dyld_shared_cache'
alias ..="cd .."
alias ...="cd ../.."
# git alias
# check with ~/.gitconfig
alias gst='git st' # status
alias gco='git co' # checkout
alias gcm='git cm' # commit
alias gad='git ad' # add
alias gdf='git df' # df
alias glo='git lo' # log
alias gbr='git br' # branch
alias gpu='git pu' # push
alias gpl='git pl' # pull

# setopt
# ディレクトリ名の入力のみで移動する 
setopt auto_cd 
# コマンドのスペルを訂正する
setopt correct          
# ヒストリに実行時間も保存する
setopt extended_history  
# 直前と同じコマンドはヒストリに追加しない
setopt hist_ignore_dups   

export LSCOLORS="hxxxxxxxxxxxxxxxxxxxxx"

# do 'ls' after doing 'cd'
cd ()
{
	builtin cd "$@" && ls
}

# for nvm
[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh
# nvm use default
npm_dir=${NVM_PATH}_modules
export NODE_PATH=$npm_dir

# for gem
export PATH=$PATH:$HOME/.gem/ruby/2.5.0/bin

# for nginx
export LUAJIT_LIB="`brew --cellar luajit`/2.0.5/lib"
export LUAJIT_INC="`brew --cellar luajit`/2.0.5/include/luajit-2.0"

# for golang
export GOROOT="/usr/local/go"
export GOPATH="$HOME/Documents/dev/go"
export GOBIN="$GOPATH/bin"
export PATH="/usr/local/go/bin:$GOBIN:$PATH"
export GO15VENDOREXPERIMENT=1
export GO111MODULE=on

plugins=(git cf brew osx kubectl)
