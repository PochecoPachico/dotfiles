# dotfilesの環境設定(2016年7月24日更新)

備忘録  
Mac，Ubuntu，Arch Linuxでうまく動くはず

## clone方法  
ホームディレクトリで  
`git clone https://proteanFrog@bitbucket.org/proteanFrog/dotfiles .dotfiles`  
を実行する
## 必須
### 1. install.shを実行する  
実行するとgit submoduleでNeoBundleがインストールされ，以下の設定ファイルのシンボリックリンクが作成される

```
.zshrc  
.tmux.conf  
.vimrc  
.vimrc_light  
.vim  
```  
.vimrc_lightは軽量版のvimの設定ファイルで必要最低限だと思われる設定が記述されている  

### 2. vimprocコンパイル
vimを起動し，NeoBundleInstallを実行してから以下のコマンドを実行する  
```sh
cd ~/.dotfiles/.vim/bundle/vimproc
make
```

### 3. pyenvのインストール
OSによって異なるので調べてください…  
参考サイト: [Qiita | データサイエンティストを目指す人のpython環境構築 2016](http://qiita.com/y__sama/items/5b62d31cb7e6ed50f02c)  
インストールしなくてもエラーは出ないけど…

### 4. silversearcherインストール
Mac  
`brew install the_silver_searcher`  
Ubuntu  
`sudo apt-get install silversearcher-ag`  
基本的にOSのパッケージ管理で入れられるみたい  

### 5. pecoのインストール
pecoをインストールする前にgoを入れる必要があります  
Macはbrewでインストールできます  
`brew install go`  
Linuxは公式からtarを落としてきてgoをインストール  
次にpecoのインストール  
`go get github.com/peco/peco/cmd/peco`  

## 任意
必要であればUbuntu mono powerlineをインストール  
`git clone https://github.com/powerline/fonts`

カラースキームはsolarizedにしたほうが見栄えが良くなります

あとgitbucket用の公開鍵をパスワード無しで作ったほうがいいかも

## 注意
tmuxのバージョンは2.0以上でないとうまく設定が反映されないみたい
