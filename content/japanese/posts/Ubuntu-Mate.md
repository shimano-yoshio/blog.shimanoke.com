+++
title = "Ubuntu Mate Tips"
author = ["島野 善雄"]
date = 2023-08-31T00:00:00+09:00
lastmod = 2023-09-17T16:50:57+09:00
tags = ["Ubuntu", """
  "Ubuntu
  """, """
  MATE"
  """]
categories = ["Ubuntu"]
type = "post"
draft = false
+++

<div class="ox-hugo-toc toc">

<div class="heading">&#30446;&#27425;</div>

- [Ubuntu のコツ](#ubuntu-のコツ)
    - [Ubuntu:Terminal](#ubuntu-terminal)
        - [<span class="org-todo todo TODO">TODO</span> peco の色を変更する](#peco-の色を変更する)
        - [<span class="org-todo todo TODO">TODO</span> ターミナルンの見栄えをよくするために PowerLine を使う](#ターミナルンの見栄えをよくするために-powerline-を使う)
        - [<span class="org-todo todo TODO">TODO</span> git の diff 出力を見やすくするためいのん delta を使う](#git-の-diff-出力を見やすくするためいのん-delta-を使う)
        - [<span class="org-todo todo TODO">TODO</span> bat を使ってファイルの中身を見る （less の代用）](#bat-を使ってファイルの中身を見る-less-の代用)
    - [<code>[1/2]</code> Ubuntu:Video](#ubuntu-video)
        - [<span class="org-todo todo TODO">TODO</span> How to take a screenshot on Ubunbu MATE 23.040a](#how-to-take-a-screenshot-on-ubunbu-mate-23-dot-040a)
    - [Ubuntu:GUI](#ubuntu-gui)
        - [<span class="org-todo todo TODO">TODO</span> Ubuntu MATE 23.04 で画面をズームイン/ズームアウトする](#howto-zoomin-in^mate)
            - [必要なパッケージのインストール](#必要なパッケージのインストール)
            - [ズームイン/ズームアウトの設定](#ズームイン-ズームアウトの設定)
                - [Commpiz の中でウインドウマネージャを変更する](#commpiz-の中でウインドウマネージャを変更する)
                - [ズームのセットアップ](#ズームのセットアップ)
            - [結論](#結論)
            - [参考文献](#参考文献)
        - [<span class="org-todo todo TODO">TODO</span> Ubuntu Mate でメニューなどのフォントを微調整する方法](#ubuntu-mate-でメニューなどのフォントを微調整する方法)
        - [<span class="org-todo todo TODO">TODO</span> ラウンチャ Albert を Ubuntu で使う](#use-alert)
            - [インストールした環境](#インストールした環境)
            - [Albert のインストール](#albert-のインストール)
            - [Albert を使う](#albert-を使う)
    - [<span class="org-todo todo TODO">TODO</span> Ubuntu Mate 23.04 上で UIM を使う](#ubuntu-mate-23-dot-04-上で-uim-を使う)
        - [参考文献](#参考文献)
    - [<span class="org-todo todo TODO">TODO</span> Ubuntu での情報取得あれこれ](#ubuntu-での情報取得あれこれ)
        - [インストールされているパッケージの一覧を得る](#インストールされているパッケージの一覧を得る)
        - [カーネル情報](#カーネル情報)
        - [OS のリリース情報](#os-のリリース情報)
        - [CPU 情報](#cpu-情報)
        - [ディスク情報](#ディスク情報)
        - [ディスクのマウント情報](#ディスクのマウント情報)

</div>
<!--endtoc-->



## Ubuntu のコツ {#ubuntu-のコツ}


### Ubuntu:Terminal {#ubuntu-terminal}


#### <span class="org-todo todo TODO">TODO</span> peco の色を変更する {#peco-の色を変更する}

-   [pecoのkeymapと色を変更 - rochefort's blog](https://rochefort.hatenablog.com/entry/2015/12/10/210000)


#### <span class="org-todo todo TODO">TODO</span> ターミナルンの見栄えをよくするために PowerLine を使う {#ターミナルンの見栄えをよくするために-powerline-を使う}


#### <span class="org-todo todo TODO">TODO</span> git の diff 出力を見やすくするためいのん delta を使う {#git-の-diff-出力を見やすくするためいのん-delta-を使う}


#### <span class="org-todo todo TODO">TODO</span> bat を使ってファイルの中身を見る （less の代用） {#bat-を使ってファイルの中身を見る-less-の代用}


### <code>[1/2]</code> Ubuntu:Video {#ubuntu-video}


#### <span class="org-todo todo TODO">TODO</span> How to take a screenshot on Ubunbu MATE 23.040a {#how-to-take-a-screenshot-on-ubunbu-mate-23-dot-040a}


### Ubuntu:GUI {#ubuntu-gui}


#### <span class="org-todo todo TODO">TODO</span> Ubuntu MATE 23.04 で画面をズームイン/ズームアウトする {#howto-zoomin-in^mate}

スクリーンキャストで画面の細かい部分を説明するときに、
画面をズームできると便利です。

ここでは Ubuntu MATE 23.04 で
画面をズームイン/ズームアウトする方法を
説明します。


##### 必要なパッケージのインストール {#必要なパッケージのインストール}

次を使って、必要なパッケージをインスします。

```sh
sudo apt -y install compiz compizconfig-settings-manager compiz-plugins
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 1:</span>
  必要なパッケージのインストール
</div>


##### ズームイン/ズームアウトの設定 {#ズームイン-ズームアウトの設定}

必要なパッケージがインストールされた、
ズームイン/ズームアウトの設定を行ないます。


###### Commpiz の中でウインドウマネージャを変更する {#commpiz-の中でウインドウマネージャを変更する}

まず、使用するウインドウマネージャを
変更します:

1.  "MATE Tweak" を開きます
2.  "Windowls" を選択します
3.  "Window Manager" の中で
    "Commpiz" を選択します

{{< figure src="/ox-hugo/mate-tweak-select-winmngr.png" caption="<span class=\"figure-number\">&#22259;1:  </span>\"Commpiz\" を選択する" width="50%" >}}


###### ズームのセットアップ {#ズームのセットアップ}

次にキーを次のようにセットアップします

-   ズームイン : &lt;super&gt;semicolon
    （Windows キー　＋　セミコロン）
-   ズームアウト : &lt;super&gt;equal
    （Windows キー + "=" キー）

`<super>` キーは。 "Widodws" キーです。

まず「Control Center」を開きあます。

```text
mate-control-center
```

次に 「CompizConfig Settings Manager」を
クリックします。

{{< figure src="/ox-hugo/select-compiz-from-ctl-ctr.png" caption="<span class=\"figure-number\">&#22259;2:  </span>「CompizConfig Settings Manager」を表示する" width="50%" >}}

次に
「CompizConfig Settings Manager」の
中で、
「Zoom In key」と
「Zoom Out  key」を次のように設定します。

{{< figure src="/ox-hugo/mate-zoom-settings.png" caption="<span class=\"figure-number\">&#22259;3:  </span>ズームイン/ズームアウトの設定" width="50%" >}}

これでズームイン/ズームアウトを設定することができました。


##### 結論 {#結論}

以上の設定を使うと、
Ubuntu 上でスクリーンの拡大/縮小ができるようになります。

ズームイン
: "Windows" + セミコロン

ズームアウト
: "Windows" + "=" キー


##### 参考文献 {#参考文献}

-   <https://learnubuntumate.weebly.com/enable-magnification.html>


#### <span class="org-todo todo TODO">TODO</span> Ubuntu Mate でメニューなどのフォントを微調整する方法 {#ubuntu-mate-でメニューなどのフォントを微調整する方法}

「コントロールセンター」→ 「ルック &amp; フィール」→ 「外観」

で、「フォント」タブを選択し、「詳細」を選択

DPI 数の数値をあげます。


#### <span class="org-todo todo TODO">TODO</span> ラウンチャ Albert を Ubuntu で使う {#use-alert}

-   [Albert - Installing](https://albertlauncher.github.io/installing/)


##### インストールした環境 {#インストールした環境}

-   OS : Ubuntu MATE 23.04 on VirtualBox on Windowss 11


##### Albert のインストール {#albert-のインストール}

次のようにして Albert をインストールします。
詳しくは以下をごらんください。

-   [パッケージのインストール: home:manuelschneid3r / albert-master](https://software.opensuse.org/download.html?project=home%3Amanuelschneid3r&package=albert-master)

<!--listend-->

```sh
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_23.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_23.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null
sudo apt update
sudo apt install albert-master
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 2:</span>
  Albert のインストール
</div>


##### Albert を使う {#albert-を使う}


### <span class="org-todo todo TODO">TODO</span> Ubuntu Mate 23.04 上で UIM を使う {#ubuntu-mate-23-dot-04-上で-uim-を使う}

```text
sudo apt install uim uim-data uim-plugins uim-xim
sudo apt install uim-mozc
sudo apt install uim-skk
```

`~/.zshrc`

```text
export XMODIFIERS=@im=uim
export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
```

~/.Xresources

```text
Emacs*UseXIM: false
```


#### 参考文献 {#参考文献}

-   [Ubuntu 18.04で日本語, 韓国語混在入力: uim-mozc, byeoru - 風来坊@真幸福知](https://whoraibo.hatenablog.com/entry/2021/02/23/222612)


### <span class="org-todo todo TODO">TODO</span> Ubuntu での情報取得あれこれ {#ubuntu-での情報取得あれこれ}


#### インストールされているパッケージの一覧を得る {#インストールされているパッケージの一覧を得る}

```sh
apt list
```


#### カーネル情報 {#カーネル情報}

```sh
uname -a
```


#### OS のリリース情報 {#os-のリリース情報}

```sh
cat /etc/os-release
```


#### CPU 情報 {#cpu-情報}

```sh
cpuinfo
```

```sh
cat /proc/cpuinfo
```


#### ディスク情報 {#ディスク情報}

```sh
df -h
```


#### ディスクのマウント情報 {#ディスクのマウント情報}

```sh
df -h
```
