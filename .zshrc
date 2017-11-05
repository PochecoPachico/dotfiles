# インクリメンタル検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

#色設定
if [[ $TERM = xterm ]]; then
	TERM=xterm-256color
fi

# 環境変数
export LANG=ja_JP.UTF-8
export LC_ALL=en_US.UTF-8

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

# 自作シェルスクリプト
export PATH=$HOME/.dotfiles/bin:$PATH

if test -e "$PYENV_ROOT/bin/pyenv" || test -e "$PYENV_ROOT/shims";  then
	eval "$(pyenv init -)"
fi

# For rbenv
if which rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# For dinghy
if which dinghy > /dev/null 2>&1; then
  eval "$(dinghy shellinit)"
fi

# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
# ?: 直前のコマンドの返り値
# 失敗したら色を赤くする

# sshで接続されている時は[REMOTE]と赤文字で表示されるようにする

if [ ${SSH_CLIENT:-undefined} = "undefined" ] && [ ${SSH_CONECTION:-undefined} = "undefined" ]; then
    REMOTE_PROMPT=""
  else
    REMOTE_PROMPT="%F{red}[REMOTE]%f"
fi

USER_NAME="%n"
HOST_NAME="%m"
CURRENT_DIR="%~"
INPUT_SIGN="%(?,$,%F{red}$%f)"

function zle-line-init zle-keymap-select {
  PROMPT="%F{yellow}[${USER_NAME}@${HOST_NAME}]%f${REMOTE_PROMPT} %F{green}${CURRENT_DIR}%f 
${INPUT_SIGN} "
  RPROMPT="${vcs_info_msg_0_}"
  zle reset-prompt
}

# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{208}*%f"
zstyle ':vcs_info:git:*' unstagedstr "%F{196}+%f"
zstyle ':vcs_info:*' formats '%c%u%F{165}[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}[%b %a]%f%c%u'

# プロンプトが表示されるたびに実行される
precmd () { vcs_info }
setopt prompt_subst

# vcs_infoが生成した情報を表示する
RPROMPT="${vcs_info_msg_0_}"

zle -N zle-line-init
zle -N zle-keymap-select

# 単語の区切り文字の指定
autoload -Uz select-word-style
select-word-style default

# 単語区切り
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# 補完
autoload -Uz compinit
compinit

# 候補ハイライト
zstyle ':completion:*:default' menu select=1

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# オプション
setopt correct
setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt ignore_eof
setopt interactive_comments
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
setopt extended_glob

# ls色設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# エイリアス
source ~/.dotfiles/.zsh_aliases
