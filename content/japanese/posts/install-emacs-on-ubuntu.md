+++
title = "Ubuntu MATE で複数の Emacs ディストリビューションを動かす"
author = ["島野 善雄"]
date = 2023-09-06T00:00:00+09:00
lastmod = 2023-09-10T10:22:01+09:00
tags = ["Emacs"]
categories = ["Ubuntu"]
type = "post"
draft = false
+++

<div class="ox-hugo-toc toc has-section-numbers">

<div class="heading">&#30446;&#27425;</div>

- <span class="section-num">1</span> [目的](#目的)
- <span class="section-num">2</span> [今回の目標のイメージ](#今回の目標のイメージ)
- <span class="section-num">3</span> [環境](#環境)
- <span class="section-num">4</span> [Ubuntu MATE への Emacs のインストール](#ubuntu-mate-への-emacs-のインストール)
- <span class="section-num">5</span> [Chemacs を使って複数の Emacs をたちあげる](#chemacs-を使って複数の-emacs-をたちあげる)
    - <span class="section-num">5.1</span> [今回使用するディレクトリ](#今回使用するディレクトリ)
    - <span class="section-num">5.2</span> [chemacs のインストール](#chemacs-のインストール)
    - <span class="section-num">5.3</span> [Spacemacs のインストール](#spacemacs-のインストール)
        - <span class="section-num">5.3.1</span> [`~/EmacsDist` ディレクトリの作成](#emacsdist-ディレクトリの作成)
        - <span class="section-num">5.3.2</span> [Spacemacs のレポジトリのクローン](#spacemacs-のレポジトリのクローン)
        - <span class="section-num">5.3.3</span> [`~/.spacemacs.d` ディレクトリの作成](#dot-spacemacs-dot-d-ディレクトリの作成)
    - <span class="section-num">5.4</span> [Doom Emacs のインストール](#doom-emacs-のインストール)
        - <span class="section-num">5.4.1</span> [Doom Emacs のレポジトリをクローン](#doom-emacs-のレポジトリをクローン)
        - <span class="section-num">5.4.2</span> [`doom install` の実行](#doom-install-の実行)
        - <span class="section-num">5.4.3</span> [、=doom sync= の実行](#doom-sync-の実行)
    - <span class="section-num">5.5</span> [chemacs の設定](#chemacs-の設定)
        - <span class="section-num">5.5.1</span> [`~/.emacs-profiles.el`](#dot-emacs-profiles-dot-el)
        - <span class="section-num">5.5.2</span> [`~/.emacs-profile`](#dot-emacs-profile)
    - <span class="section-num">5.6</span> [chemacs の使いかた](#chemacs-の使いかた)
- <span class="section-num">6</span> [結論](#結論)

</div>
<!--endtoc-->


## <span class="section-num">1</span> 目的 {#目的}

Ubuntu MATE 23.04 に Emacs をインストールする方法を説明します。

また、[chemacs2](https://github.com/plexus/chemacs2) を使って複数の Emacs を同時に動かせるようにします。

以下のツールを使います。

[chemacs2](https://github.com/plexus/chemacs2)
: Emacs のバージョンスッチャー

[Spacemacs](https://www.spacemacs.org/)
: 人気のある Emacs のディストリビューション

[doomemacs](https://github.com/doomemacs/doomemacs)
: これも人気のある Emacs のディストリビューション


## <span class="section-num">2</span> 今回の目標のイメージ {#今回の目標のイメージ}

今回の設定を行なうと下図のように Spacemacs と
Doom Emacs を同時に動かすことができます。

{{< figure src="/ox-hugo/spaceemacs-and-doom.png" alt="Spacemacs と Doom Emacs を同時に動かす" caption="<span class=\"figure-number\">&#22259;1:  </span>Spacemacs と Doom Emacs を同時に動かす" width="50%" >}}


## <span class="section-num">3</span> 環境 {#環境}

今回 Emacs をインストールする環境です。

Guest OS
: [Ubuntu MATE](https://ubuntu-mate.org/) 23.04

Host OS
: Windowd 11 Professional

VM 環境: [VirtualBox](https://www.virtualbox.org/) 7.0.100


## <span class="section-num">4</span> Ubuntu MATE への Emacs のインストール {#ubuntu-mate-への-emacs-のインストール}

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


## <span class="section-num">5</span> Chemacs を使って複数の Emacs をたちあげる {#chemacs-を使って複数の-emacs-をたちあげる}

複数の Emacs の異なるディストリビューション、
異なるバージョンを動かしたいことがあります。
そのために私は [chemacs2](https://github.com/plexus/chemacs2) を使っていあます。

今回は次の 2 つの Emacs のディストリビューションを
動かします。

-   [Spacemacs](https://www.spacemacs.org/)
-   [doomemacs](https://github.com/doomemacs/doomemacs)

[chemacs2](https://github.com/plexus/chemacs2) の詳細は以下をごらんください。

-   [plexus/chemacs2: Emacs version switcher, improved](https://github.com/plexus/chemacs2)


### <span class="section-num">5.1</span> 今回使用するディレクトリ {#今回使用するディレクトリ}

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


### <span class="section-num">5.2</span> chemacs のインストール {#chemacs-のインストール}

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


### <span class="section-num">5.3</span> Spacemacs のインストール {#spacemacs-のインストール}

今回使用するディレクトリは次のとおりです。

`~/EmacsDist/Spacemacs`
: Spqcemacs のディレクトリ

`~/EmacsDist/DoomEmacs`
: Doom Emacs のディレクトリ


#### <span class="section-num">5.3.1</span> `~/EmacsDist` ディレクトリの作成 {#emacsdist-ディレクトリの作成}

各種 Emacs のディストリビューションを格納するディレクトリを作成します

```sh
mkdir ~/EmacsDist
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 4:</span>
  各種Emacsのディストリビューションを格納するディレクトリno作成
</div>


#### <span class="section-num">5.3.2</span> Spacemacs のレポジトリのクローン {#spacemacs-のレポジトリのクローン}

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


#### <span class="section-num">5.3.3</span> `~/.spacemacs.d` ディレクトリの作成 {#dot-spacemacs-dot-d-ディレクトリの作成}

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


### <span class="section-num">5.4</span> Doom Emacs のインストール {#doom-emacs-のインストール}

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


#### <span class="section-num">5.4.1</span> Doom Emacs のレポジトリをクローン {#doom-emacs-のレポジトリをクローン}

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


#### <span class="section-num">5.4.2</span> `doom install` の実行 {#doom-install-の実行}

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


#### <span class="section-num">5.4.3</span> 、=doom sync= の実行 {#doom-sync-の実行}

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


### <span class="section-num">5.5</span> chemacs の設定 {#chemacs-の設定}


#### <span class="section-num">5.5.1</span> `~/.emacs-profiles.el` {#dot-emacs-profiles-dot-el}

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


#### <span class="section-num">5.5.2</span> `~/.emacs-profile` {#dot-emacs-profile}

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


### <span class="section-num">5.6</span> chemacs の使いかた {#chemacs-の使いかた}

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


## <span class="section-num">6</span> 結論 {#結論}

今回は  [chemacs2](https://github.com/plexus/chemacs2)  を使って、
Ubuntu 上で Spacemacs と Doom Emaccs を動かす
方法を紹介しました。

Spacemacs の使いかた/設定については別の機械に紹介します。
