+++
title = "Emacs Tips"
author = ["島野 善雄"]
date = 2023-08-31T00:00:00+09:00
lastmod = 2023-09-10T12:16:10+09:00
tags = ["Emacs"]
categories = ["Ubuntu"]
type = "post"
draft = false
+++

<div class="ox-hugo-toc toc">

<div class="heading">&#30446;&#27425;</div>

- [Emacs についてコツ](#emacs-についてコツ)
    - [Ubuntu MATE で複数の Emacs ディストリビューションを動かす](#install-emacs-on-ubuntu)
        - [目的](#目的)
        - [今回の目標のイメージ](#今回の目標のイメージ)
        - [環境](#環境)
        - [Ubuntu MATE への Emacs のインストール](#ubuntu-mate-への-emacs-のインストール)
        - [Chemacs を使って複数の Emacs をたちあげる](#chemacs-を使って複数の-emacs-をたちあげる)
            - [今回使用するディレクトリ](#今回使用するディレクトリ)
            - [chemacs のインストール](#chemacs-のインストール)
            - [Spacemacs のインストール](#spacemacs-のインストール)
                - [`~/EmacsDist` ディレクトリの作成](#emacsdist-ディレクトリの作成)
                - [Spacemacs のレポジトリのクローン](#spacemacs-のレポジトリのクローン)
                - [`~/.spacemacs.d` ディレクトリの作成](#dot-spacemacs-dot-d-ディレクトリの作成)
            - [Doom Emacs のインストール](#doom-emacs-のインストール)
                - [Doom Emacs のレポジトリをクローン](#doom-emacs-のレポジトリをクローン)
                - [`doom install` の実行](#doom-install-の実行)
                - [、=doom sync= の実行](#doom-sync-の実行)
            - [chemacs の設定](#chemacs-の設定)
                - [`~/.emacs-profiles.el`](#dot-emacs-profiles-dot-el)
                - [`~/.emacs-profile`](#dot-emacs-profile)
            - [chemacs の使いかた](#chemacs-の使いかた)
        - [結論](#結論)
    - ["muhenkan" （無変換）キーを `evil-escape` に割り当てる(Spacemacs)](#bind-muhenkan-to-evil-escape)
    - [<span class="org-todo todo TODO">TODO</span> Spacemacs を起動/設定する](#fist-spacemacs-startup)
        - [Spacemacs の起動](#spacemacs-の起動)
        - [モードの選択](#モードの選択)
        - [ディストリビューションの選択肢](#ディストリビューションの選択肢)
        - [パッケージのインストール](#パッケージのインストール)
        - [Spacemacs の終了のしかた](#spacemacs-の終了のしかた)
        - [次は](#次は)
        - [<span class="org-todo todo TODO">TODO</span> Spacemacs で Rust を編集する](#spacemacs-で-rust-を編集する)
        - [目的](#目的)
        - [環境](#環境)
        - [Rust の Ubuntu MATE 23.04 へのインストール](#rust-の-ubuntu-mate-23-dot-04-へのインストール)
        - [便利なツールのインストール](#便利なツールのインストール)
        - [結論](#結論)
    - [<span class="org-todo todo TODO">TODO</span> Spacemacs で画面のズームイン/ズームアウト](#spacemacs-で画面のズームイン-ズームアウト)
        - [目的](#目的)
        - [設定](#設定)
        - [使用方法](#使用方法)
        - [結論](#結論)
    - [<span class="org-todo todo TODO">TODO</span> Spacemacs のフォント設定](#spacemacs-のフォント設定)
    - [<span class="org-todo todo TODO">TODO</span> ox-hugo 用のテンプレートを作る](#ox-hugo-用のテンプレートを作る)
    - [<span class="org-todo todo TODO">TODO</span> Org-mode で ox-hugo 用のテンプレートを作る](#org-mode-で-ox-hugo-用のテンプレートを作る)
    - [<span class="org-todo todo TODO">TODO</span> ブラウザから Org-mode へリンクをコピーする](#ブラウザから-org-mode-へリンクをコピーする)
    - [<span class="org-todo todo TODO">TODO</span> doom-themes を使う](#doom-themes-を使う)
    - [<span class="org-todo todo TODO">TODO</span> Emacs でロックファイルを作らないようにする](#emacs-でロックファイルを作らないようにする)
    - [<span class="org-todo todo TODO">TODO</span> doom-modeline を使う](#doom-modeline-を使う)

</div>
<!--endtoc-->



## Emacs についてコツ {#emacs-についてコツ}


### Ubuntu MATE で複数の Emacs ディストリビューションを動かす {#install-emacs-on-ubuntu}


#### 目的 {#目的}

Ubuntu MATE 23.04 に Emacs をインストールする方法を説明します。

また、[chemacs2](https://github.com/plexus/chemacs2) を使って複数の Emacs を同時に動かせるようにします。

以下のツールを使います。

[chemacs2](https://github.com/plexus/chemacs2)
: Emacs のバージョンスッチャー

[Spacemacs](https://www.spacemacs.org/)
: 人気のある Emacs のディストリビューション

[doomemacs](https://github.com/doomemacs/doomemacs)
: これも人気のある Emacs のディストリビューション


#### 今回の目標のイメージ {#今回の目標のイメージ}

今回の設定を行なうと下図のように Spacemacs と
Doom Emacs を同時に動かすことができます。

{{< figure src="/ox-hugo/spaceemacs-and-doom.png" alt="Spacemacs と Doom Emacs を同時に動かす" caption="<span class=\"figure-number\">&#22259;1:  </span>Spacemacs と Doom Emacs を同時に動かす" width="50%" >}}


#### 環境 {#環境}

今回 Emacs をインストールする環境です。

Guest OS
: [Ubuntu MATE](https://ubuntu-mate.org/) 23.04

Host OS
: Windowd 11 Professional

VM 環境: [VirtualBox](https://www.virtualbox.org/) 7.0.100


#### Ubuntu MATE への Emacs のインストール {#ubuntu-mate-への-emacs-のインストール}

Ubuntu MATE へ Emacs のインストールするには次のようにします。

```sh
sudo apt -y install emacs emacs-gtk
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 1:</span>
  Ubuntu MATE へのEmacsのインストール
</div>

Emacs のバージョンを確認します:

```sh
emacs --version
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 2:</span>
  Emacsのバージョン確認
</div>

```text
GNU Emacs 28.2
Copyright (C) 2022 Free Software Foundation, Inc.
GNU Emacs comes with ABSOLUTELY NO WARRANTY.
You may redistribute copies of GNU Emacs
under the terms of the GNU General Public License.
For more information about these matters, see the file named COPYING.
```

以上で Emacs 自体のインストールは終了です。


#### Chemacs を使って複数の Emacs をたちあげる {#chemacs-を使って複数の-emacs-をたちあげる}

複数の Emacs の異なるディストリビューション、
異なるバージョンを動かしたいことがあります。
そのために私は [chemacs2](https://github.com/plexus/chemacs2) を使っていあます。

今回は次の 2 つの Emacs のディストリビューションを
動かします。

-   [Spacemacs](https://www.spacemacs.org/)
-   [doomemacs](https://github.com/doomemacs/doomemacs)

[chemacs2](https://github.com/plexus/chemacs2) の詳細は以下をごらんください。

-   [plexus/chemacs2: Emacs version switcher, improved](https://github.com/plexus/chemacs2)


##### 今回使用するディレクトリ {#今回使用するディレクトリ}

今回使うディレクトリの説明です。
「[chemacs の設定](#chemacs-の設定)」で重要になります。

`~/.emacs.d`
: chemacs 用のファイルがはいります

`~/EmacsDist`
: 複数の Emacs のディレクトリを置くディレクトリ

`~/EmacsDist/Spacemacs`
: Spqcemacs のディレクトリ

`~/EmacsDist/DoomEmacs`
: Doom Emacs のディレクトリ

`~/.spacemacs.d`
: Spacemacs 用の設定がはいるディレクトリ

`=~/.doom.d`
: Doom Emacs 用の設定がはいるディレクトリ


##### chemacs のインストール {#chemacs-のインストール}

[chemacs2](https://github.com/plexus/chemacs2) をインストールします。
ターミナルンから次を順番に実行してください

```sh
# .emacs ファイルの退避
[ -f ~/.emacs ] && mv ~/.emacs ~/.emacs.bak
# .emacs.d ディレクトリの退避
[ -d ~/.emacs.d ] && mv ~/.emacs.d ~/.emacs.default
# Chemacs のインストール
git clone https://github.com/plexus/chemacs2.git ~/.emacs.d
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 3:</span>
  chemacs のインストール
</div>

既存の Emacs 設定があった場合には、次のように退避されます:

-   _~_.emacs/ → _~_.emacs.bak/
-   _~_.emacs.d/ → _~_.emacs.defaulta/

以上で chemacs のインストールは終了です。


##### Spacemacs のインストール {#spacemacs-のインストール}

今回使用するディレクトリは次のとおりです。

`~/EmacsDist/Spacemacs`
: Spqcemacs のディレクトリ

`~/EmacsDist/DoomEmacs`
: Doom Emacs のディレクトリ


###### `~/EmacsDist` ディレクトリの作成 {#emacsdist-ディレクトリの作成}

各種 Emacs のディストリビューションを格納するディレクトリを作成します

```sh
mkdir ~/EmacsDist
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 4:</span>
  各種Emacsのディストリビューションを格納するディレクトリno作成
</div>


###### Spacemacs のレポジトリのクローン {#spacemacs-のレポジトリのクローン}

Spacemacs のレポジトリをクローンします。

```sh
cd ~/EmacsDist
git clone https://github.com/syl20bnr/spacemacs ~/EmacsDist/Spacemacs
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 5:</span>
  Spacemacsのレポジトリのクローン
</div>

"develop" ブランチをチェックアウトします
必要ないかもしれません。

```sh
cd Spacemacs
git checkout develop
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 6:</span>
  "develop" ブランチのチェックアウト
</div>


###### `~/.spacemacs.d` ディレクトリの作成 {#dot-spacemacs-dot-d-ディレクトリの作成}

Spacemacs の設定ファイルを格納する
`~/.spacemacs.d` ディレクトリを作成します。

```sh
mkdir ~/.spacemacs.d
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 7:</span>
  <code>~/.spacemacs.d</code> ディレクトリの作成
</div>

以上で Spacemacs のインストールは終了です。


##### Doom Emacs のインストール {#doom-emacs-のインストール}

doom Emacs をインストールします。
使用されるディレクトリです。

`~/.spacemacs.d`
: Spacemacs 用の設定がはいるディレクトリ

`=~/.doom.d`
: Doom Emacs 用の設定がはいるディレクトリ

<!--listend-->

`~/.spacemacs.d`
: Spacemacs 用の設定がはいるディレクトリ

`=~/.doom.d`
: Doom Emacs 用の設定がはいるディレクトリ
    （doom instal で自動的に作成されます）


###### Doom Emacs のレポジトリをクローン {#doom-emacs-のレポジトリをクローン}

Doom Emacs のレポジトリをクローンします:
すぐに終わります。

```sh
cd ~/EmacsDist
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/EmacsDist/DoomEmacs
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 8:</span>
  Doom Emacs のレポジトリをクローン
</div>


###### `doom install` の実行 {#doom-install-の実行}

次に Doom Emacs をインストールします。
結構時間がかかります。
途中で質問がでるので "y" と入力します。

`~/.doom.d` という、設定ファイルを格納するフォルダが作成されます。

```sh
~/EmacsDist/DoomEmacs/bin/doom install
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 9:</span>
  doom installの実行
</div>

```text
Installing Doom Emacs!

✓ Created ~/.doom.d/
  - Creating ~/.doom.d/init.el
  ✓ Done!
  - Creating ~/.doom.d/config.el
  ✓ Done!
  - Creating ~/.doom.d/packages.el
  ✓ Done!
Generate an envvar file? (see `doom help env` for details) (y or n) y
# y と入力します

> Generating envvars file
  ✓ Generated ~/EmacsDist/DoomEmacs/.local/env
Installing plugins
> Installing straight...
...省略

Download and install all-the-icon's fonts? (y or n) Please answer y or n.  Download and install all-the-icon's fonts? (y or n) Please answer y or n.  Download and install all-the-icon's fonts? (y or n) y
# y と入力します
✓  Finished! Doom is ready to go!

But before you doom yourself, here are some things you should know:

1. Don't forget to run 'doom sync', then restart Emacs, after modifying init.el
   or packages.el in ~/.config/doom.

   This command ensures needed packages are installed, orphaned packages are
   removed, and your autoloads/cache files are up to date. When in doubt, run
   'doom sync'!

2. If something goes wrong, run `doom doctor`. It diagnoses common issues with
   your environment and setup, and may offer clues about what is wrong.

3. Use 'doom upgrade' to update Doom. Doing it any other way will require
   additional steps. Run 'doom help upgrade' to understand those extra steps.

4. Access Doom's documentation from within Emacs via 'SPC h d h' or 'C-h d h'
   (or 'M-x doom/help')

Have fun!

✓ Finished in 9m 48s
```


###### 、=doom sync= の実行 {#doom-sync-の実行}

上の出力に書いてあるとおり、=doom sync= を実行します。

```sh
~/EmacsDist/DoomEmacs/bin/doom sync
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 10:</span>
  doom sync の実行
</div>

```text
> Synchronizing "default" profile...
  > Regenerating envvars file
    ✓ Generated ~/EmacsDist/DoomEmacs/.local/env
  > Installing packages...
    - No packages need to be installed
  > (Re)building packages...
    - No packages need rebuilding
  > Purging orphaned packages (for the emperor)...
    - Skipping builds
    - Skipping elpa packages
    - Skipping repos
    - Skipping regrafting
    - Skipping native bytecode
  > (Re)building profile in /home/shimano/EmacsDist/DoomEmacs/.local/etc/@/...
    > Deleting old init files...
    > Generating 4 init files...
    > Byte-compiling ~/EmacsDist/DoomEmacs/.local/etc/@init.28.el...
    ✓ Built init.28.elc
  - Restart Emacs or use 'M-x doom/reload' for changes to take effect
```

以上で Doom Emacs のインストールが終了しました。


##### chemacs の設定 {#chemacs-の設定}


###### `~/.emacs-profiles.el` {#dot-emacs-profiles-dot-el}

`~/.emacs-profiles.el` を作成し、
次のように入力します。

```elisp
(("spacemacs" . ((user-emacs-directory . "~/EmacsDist/Spacemacs")
                 (env . (("SPACEMACSDIR" . "~/.spacemacs.d")))))

 ("doom" . ((user-emacs-directory . "~/EmacsDist/DoomEmacs")
            (env . (("DOOMDIR" . "~/.doom.d"))))))
```

以下パラメータの説明です。

-   spacemacs
    -   **user-emacs-directory :** `~/EmacsDist/Spacemacs` は Spacemacs のレポジトリを
        クローンしたディレクトリです
    -   **SPACEMACSDIR:** `~/.spacemacs.d` は Spacemacs の設定ファイルがあるディレクトリです。

ー doom

user-emacs-directory
: `"~/EmacsDist/DoomEmacs` は Doom Emacs のレポジトリを
    クローンしたディレクトリでう。
    -   **DOOMDIR:** `~/.doom.d` は Doom Emacs の設定ファイルがあるディレクトリです


###### `~/.emacs-profile` {#dot-emacs-profile}

`~/.emacs-profile` を作成し、次のように入力します。

```sh
spacemacs
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 11:</span>
  <code>~/.emacs-profile</code>
</div>

"spacemacs" は `~/.emacs-profiles.el` の中で指定した
エントリーの名前です。ここで指定したものが "emacs" 単体で
起動したときに使用されます。

以上で chemacs の設定は終了です。


##### chemacs の使いかた {#chemacs-の使いかた}

Spacemacs を起動するには次のようにします.

```sh
emacs --with-profile spacemacs
# または
emacs
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 12:</span>
  Spacemacsを起動する
</div>

Doom Emacs を立ち上げるには次のようにします。

```sh
emacs --with-profile doom
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 13:</span>
  Doom Emacsを立ち上げる
</div>


#### 結論 {#結論}

今回は  [chemacs2](https://github.com/plexus/chemacs2)  を使って、
Ubuntu 上で Spacemacs と Doom Emaccs を動かす
方法を紹介しました。

Spacemacs の使いかた/設定については別の機械に紹介します。


### "muhenkan" （無変換）キーを `evil-escape` に割り当てる(Spacemacs) {#bind-muhenkan-to-evil-escape}

Spacemacs の vim と hybrid の編集モードでは、
"ESC" キーを頻繁に叩きます。

しかし "ESC" キーはホームポジションからはるか遠くにあります。
そこで "ESC" を別のキーにヮリアテます。

日本語 106 キーボードでは、私が使っていない
キーがいくつかあります。

{{< figure src="/ox-hugo/japanese-keyboad.jpg" alt="日本語 106 キーボード" caption="<span class=\"figure-number\">&#22259;2:  </span>日本語 106 キーボード" width="50%" >}}

よって "muhenkan" （無変換）キー （スペースバーの左）を
=evil-escape" に割り当てます。
これで "muhenkan" キーを叩くことと "ESC" キーを
叩くことが同じになりまう

これを Emacs のコンフィギュレーションに追加してください:

```emacs-lisp
(define-key global-map (kbd "<muhenkan>") 'evil-escape)
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 14:</span>
  Bind "muhenkan" key to =evil-escape"
</div>

日本語 106 キーボードを使ったいない場合には、
"&lt;muhenkan&gt;" を別の使ったいないキーで置き換えてください。

以上です。 Emacs を楽しんでください!


### <span class="org-todo todo TODO">TODO</span> Spacemacs を起動/設定する {#fist-spacemacs-startup}

ここでは Spacemacs を初めて起動する
方法を説明します。

Emacs と Spacemacs のインストールが
おわっていない場合には、
「[Ubuntu MATE で複数の Emacs ディストリビューションを動かす •](https://blog.shimanoke.com/ja/posts/install-emacs-on-ubuntu/)」を
参考にしてインストールしておいてください。


#### Spacemacs の起動 {#spacemacs-の起動}

「[Ubuntu MATE で複数の Emacs ディストリビューションを動かす •](https://blog.shimanoke.com/ja/posts/install-emacs-on-ubuntu/)」を
使って Spacemacs を設定している場合は
次のコマンドで Spacemacs を起動することができます

```text
emacs --with-profile spacemacs
```

または

```text
emacs
```

で起動します。


#### モードの選択 {#モードの選択}

Spacemacs を最初に立ち上げると、
編集モードを何にするかと質問されます。
編集喪には "vim", "hybrid", "emacs" の
3 種類があります。それぞれの特徴は次のとおりです。

vim
: Vil/Vim ユーザーであれば、これを選択するとよいでしょう。

emacs
: Emacs ユーザーで、Vim のキーバインディングを使いたくないかたは
    これを選択してください。お勧めはしません。

hybrid
: 最初は選択できません。
    Emacs ユーザーであればこれを選択すると良いかもしれません。
    Vim のキーバインディングに加えて、Emacs のキーバインディングも
    使ううことができます。私はこれを使っています。

ここでは "vim" を選択します。
"h" と入力して "Return" を押します。

{{< figure src="/ox-hugo/spacemacs-ask-edit-mode.png" caption="<span class=\"figure-number\">&#22259;3:  </span>Spacemacs の編集モードの選択" >}}


#### ディストリビューションの選択肢 {#ディストリビューションの選択肢}

次に、どのディストリビューションを使うかが
質問されます。
矢印キーを使って、 "spacemacs" を選択してください。

{{< figure src="/ox-hugo/spacemacs-akk-didt.png" caption="<span class=\"figure-number\">&#22259;4:  </span>ディストリビューションの選択" >}}


#### パッケージのインストール {#パッケージのインストール}

ディストリビューションの選択肢が終了したらあ、
自動的に必要な Emacs のパッケージがインストールされます。
しばらくお待ちください。


#### Spacemacs の終了のしかた {#spacemacs-の終了のしかた}

Spacemacs を終了するには次をうちます。

```text
=space q q=
```

`space q` とタイプしたら
Spacemacs の終了メニューが出るので、
"q" を押して終了します。

{{< figure src="/ox-hugo/spaceemacs-quit-menu.png" caption="<span class=\"figure-number\">&#22259;5:  </span>Spacemacs の終了メニュー" >}}

または編集モードが hybrid か emacs のかたは
`Ctl-+x Ctl+c` が使えます。


#### 次は {#次は}

次の記事では、Spacemacs のカスタマイズに
ついて説明します。


#### <span class="org-todo todo TODO">TODO</span> Spacemacs で Rust を編集する {#spacemacs-で-rust-を編集する}


#### 目的 {#目的}


#### 環境 {#環境}


#### Rust の Ubuntu MATE 23.04 へのインストール {#rust-の-ubuntu-mate-23-dot-04-へのインストール}


#### 便利なツールのインストール {#便利なツールのインストール}


#### 結論 {#結論}


### <span class="org-todo todo TODO">TODO</span> Spacemacs で画面のズームイン/ズームアウト {#spacemacs-で画面のズームイン-ズームアウト}


#### 目的 {#目的}


#### 設定 {#設定}


#### 使用方法 {#使用方法}

`Ctln+ "-"`
: 画面のズームアウト

`Ctln+ "shift" + -"`
: 画面のズームイン

このキーバインディングはよく使われているようで、
VSCode や qterminal でも使用することができます。


#### 結論 {#結論}


### <span class="org-todo todo TODO">TODO</span> Spacemacs のフォント設定 {#spacemacs-のフォント設定}


### <span class="org-todo todo TODO">TODO</span> ox-hugo 用のテンプレートを作る {#ox-hugo-用のテンプレートを作る}


### <span class="org-todo todo TODO">TODO</span> Org-mode で ox-hugo 用のテンプレートを作る {#org-mode-で-ox-hugo-用のテンプレートを作る}


### <span class="org-todo todo TODO">TODO</span> ブラウザから Org-mode へリンクをコピーする {#ブラウザから-org-mode-へリンクをコピーする}


### <span class="org-todo todo TODO">TODO</span> doom-themes を使う {#doom-themes-を使う}

-   [hlissner/emacs-doom-themes: An opinionated pack of modern color-themes](https://github.com/hlissner/emacs-doom-themes)

<!--listend-->

```emacs-lisp
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
;; (load-theme 'doom-one t)
(load-theme 'doom-dracula t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
;; (doom-themes-neotree-config)
;; or for treemacs users
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)
```


### <span class="org-todo todo TODO">TODO</span> Emacs でロックファイルを作らないようにする {#emacs-でロックファイルを作らないようにする}

```text
(setq create-lockfiles nil)
```


### <span class="org-todo todo TODO">TODO</span> doom-modeline を使う {#doom-modeline-を使う}

-   [seagle0128/doom-modeline: A fancy and fast mode-line inspired by minimalism design.](https://github.com/seagle0128/doom-modeline)

To use doom-modeline, change `dotspacemacs-mode-line-theme`
in `init.el` to this:

```emacs-lisp
dotspacemacs-mode-line-theme '(doom)
```

doom-modeline needs all-the-icons fonts
(- [domtronn/all-the-icons.el: A utility package to collect various Icon Fonts and propertize them within Emacs.](https://github.com/domtronn/all-the-icons.el))

To install these fonts, run this in Spacemacs:

```emacs-lisp
all-the-icons-install-fonts
```

Or, if you can't get fonts, run this in a terminal:

```sh
git clone https://github.com/domtronn/all-the-icons.el.git
cp all-the-icons.el/fonts/all-the-icons.ttf all-the-icons.el/fonts/file-icons.ttf all-the-icons.el/fonts/fontawesome.ttf all-the-icons.el/fonts/material-design-icons.ttf all-the-icons.el/fonts/octicons.ttf all-the-icons.el/fonts/weathericons.ttf ~/.fonts
all-the-icons.el
fc-cache -f -v
```

Then, restart Spacemacs (`SPC q r`).
