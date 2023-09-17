+++
title = "Ubuntu MATE 23.04 で画面をズームイン/ズームアウトする"
author = ["島野 善雄"]
date = 2023-09-17T16:53:00+09:00
lastmod = 2023-09-17T16:53:07+09:00
tags = ["Ubuntu", """
  "Ubuntu
  """, """
  MATE"
  """]
categories = ["Ubuntu"]
type = "post"
draft = false
+++

<div class="ox-hugo-toc toc has-section-numbers">

<div class="heading">&#30446;&#27425;</div>

- <span class="section-num">1</span> [必要なパッケージのインストール](#必要なパッケージのインストール)
- <span class="section-num">2</span> [ズームイン/ズームアウトの設定](#ズームイン-ズームアウトの設定)
    - <span class="section-num">2.1</span> [Commpiz の中でウインドウマネージャを変更する](#commpiz-の中でウインドウマネージャを変更する)
    - <span class="section-num">2.2</span> [ズームのセットアップ](#ズームのセットアップ)
- <span class="section-num">3</span> [結論](#結論)
- <span class="section-num">4</span> [参考文献](#参考文献)

</div>
<!--endtoc-->

スクリーンキャストで画面の細かい部分を説明するときに、
画面をズームできると便利です。

ここでは Ubuntu MATE 23.04 で
画面をズームイン/ズームアウトする方法を
説明します。


## <span class="section-num">1</span> 必要なパッケージのインストール {#必要なパッケージのインストール}

次を使って、必要なパッケージをインスします。

```sh
sudo apt -y install compiz compizconfig-settings-manager compiz-plugins
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 1:</span>
  必要なパッケージのインストール
</div>


## <span class="section-num">2</span> ズームイン/ズームアウトの設定 {#ズームイン-ズームアウトの設定}

必要なパッケージがインストールされた、
ズームイン/ズームアウトの設定を行ないます。


### <span class="section-num">2.1</span> Commpiz の中でウインドウマネージャを変更する {#commpiz-の中でウインドウマネージャを変更する}

まず、使用するウインドウマネージャを
変更します:

1.  "MATE Tweak" を開きます
2.  "Windowls" を選択します
3.  "Window Manager" の中で
    "Commpiz" を選択します

{{< figure src="/ox-hugo/mate-tweak-select-winmngr.png" caption="<span class=\"figure-number\">&#22259;1:  </span>\"Commpiz\" を選択する" width="50%" >}}


### <span class="section-num">2.2</span> ズームのセットアップ {#ズームのセットアップ}

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


## <span class="section-num">3</span> 結論 {#結論}

以上の設定を使うと、
Ubuntu 上でスクリーンの拡大/縮小ができるようになります。

ズームイン
: "Windows" + セミコロン

ズームアウト
: "Windows" + "=" キー


## <span class="section-num">4</span> 参考文献 {#参考文献}

-   <https://learnubuntumate.weebly.com/enable-magnification.html>
