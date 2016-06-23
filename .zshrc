#license : MIT
# http://mollifier.mit-license.org/

#色設定
if [[ $TERM = xterm ]]; then
	TERM=xterm-256color
fi

# 環境変数
export LANG=ja_JP.UTF-8

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

eval "$(pyenv init -)"
# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
PROMPT="%{${fg[yellow]}%}[%n@%m]%{${reset_color}%} %~
%# "

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# 補完
autoload -Uz compinit
compinit

# 訂正
setopt correct

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


# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
	    LANG=en_US.UTF-8 vcs_info
	        RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
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

alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i -v'
alias cp='cp -i -v'
alias mv='mv -i -v'
alias chmod='chmod -v'

alias mkdir='mkdir -p'

alias vi='vim -u NONE --noplugin'
alias lvi="vim -u $HOME/.vimrc_light"

# OS毎にalias変更
case ${OSTYPE} in
	darwin*)
		# mac
		alias webdir="cd /Applications/MAMP/htdocs/"
		# brew実行時のPATH
		export BREW_EXECUTE_PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin:/Users/shioura/bin:

		alias brew="env PATH=$BREW_EXECUTE_PATH brew "
		# gVim
		alias gvim="open -a MacVim"
				;;
	linux*)
		# linux
		;;
esac

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
	# Mac
	alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
	# Linux
	alias -g C='| xsel --input --clipboard'
fi

# OS別の設定
case ${OSTYPE} in
    darwin*)
      # Mac
	    export CLICOLOR=1
	    alias ls='ls -G -F'
			# goの設定
			export GOROOT=/usr/local/opt/go/libexec
			export GOPATH=$HOME
			export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
			function peco-select-history() {
				local tac
				if which tac > /dev/null; then
        			tac="tac"
				else
						tac="tail -r"
				fi
				BUFFER=$(\history -n 1 | \
					eval $tac | \
					peco --query "$LBUFFER")
				CURSOR=$#BUFFER
				zle clear-screen
			}
			zle -N peco-select-history
			bindkey '^r' peco-select-history
	    ;;
    linux*)
	    # Linux
	    alias ls='ls -F --color=auto'
			# goの設定
			export GOROOT=/usr/local/go
			export GOPATH=$HOME/go
			# ssh接続した時にローカルの環境変数がリモートに送信されるのでその対処
			export LC_ALL=en_US.UTF-8
			export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
			peco-select-history() {
				declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
				READLINE_LINE="$l"
				READLINE_POINT=${#l}
			}
			# bindkey -x '"\C-r": peco-select-history'
			zle -N peco-select-history
			bindkey '^r' peco-select-history
	    ;;
esac

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
