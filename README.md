# dotfiles

備忘録  
Mac，Ubuntu，Arch Linuxでうまく動くはず

## 設定方法  
ホームディレクトリで  
`git clone https://github.com/PochecoPachico/dotfiles.git .dotfiles`  
を実行し，`setup.sh`を実行する
実行すると以下の設定ファイルのシンボリックリンクが作成される

```
.zshrc  
.tmux.conf  
.vimrc  
.vimrc_light  
.vim  
```  
.vimrc_lightは軽量版のvimの設定ファイルで必要最低限だと思われる設定が記述されている  

### 任意

####  pyenvのインストール
OSによって異なるので調べてください…  
参考サイト: [Qiita | データサイエンティストを目指す人のpython環境構築 2016](http://qiita.com/y__sama/items/5b62d31cb7e6ed50f02c)  
インストールしなくてもエラーは出ないけど…

#### silversearcherインストール
Mac  
`brew install the_silver_searcher`  
Ubuntu  
`sudo apt-get install silversearcher-ag`  
基本的にOSのパッケージ管理で入れられるみたい  

