+++
title = "スクリーン上にキーストロークを表示する (Ubuntu 23.04)"
author = ["島野 善雄"]
date = 2023-09-03T00:00:00+09:00
lastmod = 2023-09-03T12:39:10+09:00
tags = ["Ubuntu", """
  "Ubuntu
  """, """
  MATE"
  """]
categories = ["Ubuntu"]
type = "post"
draft = true
+++

<div class="ox-hugo-toc toc has-section-numbers">

<div class="heading">&#30446;&#27425;</div>

- <span class="section-num">1</span> [環境](#環境)
- <span class="section-num">2</span> [screenkey のインストール](#screenkey-のインストール)
- <span class="section-num">3</span> [Screnkye をはじめる](#screnkye-をはじめる)

</div>
<!--endtoc-->

ときどき、プレゼンテーションの間のように、
キーストロークを画面に表示したいことがあります。

このために、私は [screenkey](https://www.thregr.org/wavexx/software/screenkey/) を使っていあます。

-   [Screencast your keys.](https://www.thregr.org/wavexx/software/screenkey/)

この記事では、
Screenkey のインストール/セットアップ方法を示します。


## <span class="section-num">1</span> 環境 {#環境}

-   OS: Ubuntu Mate 23.04 on VirtualBox] on Windows 11.


## <span class="section-num">2</span> screenkey のインストール {#screenkey-のインストール}

Screenky を Ubuntu にインストールするには、
これをターミナルの中でタイプします:

```sh
sudo apt -y install screenkey
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 1:</span>
  Install Screenkye
</div>


## <span class="section-num">3</span> Screnkye をはじめる {#screnkye-をはじめる}

次に
screenkey をターミナルからはじめます:

```sh
screenkey
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 2:</span>
  Start Screenkey
</div>

その後で screenkey アイコンが
メインメニュー上に表示されます:

{{< figure src="/ox-hugo/screenshot-menu.png" alt="Screenkye Icon on Main Menu" caption="<span class=\"figure-number\">&#22259;1:  </span>Screenkye のアイコン" width="50%" >}}

"Preferences" を選択して、
自分の好みに設定してください。

{{< figure src="/ox-hugo/screenky-prefs.png" alt="Screenkey の設定" caption="<span class=\"figure-number\">&#22259;2:  </span>Screenkey の設定" width="50%" >}}

... そうすると、キーストロークがスクリーン上に
表示されることがわかります。

{{< figure src="/ox-hugo/screenkye.gif" caption="<span class=\"figure-number\">&#22259;3:  </span>Screenkey の動いている様子" width="50%" >}}
