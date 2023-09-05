+++
title = "ripgrep （Rust で作られた grep ）を使う"
author = ["島野 善雄"]
date = 2023-09-05T15:32:00+09:00
lastmod = 2023-09-05T15:32:10+09:00
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

- <span class="section-num">1</span> [Ubuntu MATE 23.04 への ripgrep インストール](#ubuntu-mate-23-dot-04-への-ripgrep-インストール)
- <span class="section-num">2</span> [ripgrep の使いかた](#ripgrep-の使いかた)
- <span class="section-num">3</span> [結論](#結論)

</div>
<!--endtoc-->

ripgrep は Rust で作られた grep です。
次のような特徴があります。

-   マルチスレッドで動くので速い
-   grep よりも短かくコマンドを書くことができる

詳しくは以下をごらんください。

-   [BurntSushi/ripgrep: ripgrep recursively searches directories for a regex pattern while respecting your gitignore](https://github.com/BurntSushi/ripgrep)


## <span class="section-num">1</span> Ubuntu MATE 23.04 への ripgrep インストール {#ubuntu-mate-23-dot-04-への-ripgrep-インストール}

Ubuntu MATE 23.04 に ripgrep をインストールするには
次のようにします:

```sh
sudo apt-get install ripgrep
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 1:</span>
  Ubuntu への ripgrep のインストール
</div>


## <span class="section-num">2</span> ripgrep の使いかた {#ripgrep-の使いかた}

ripgrep を使ってカレントディレクトリを "hoge" に対して再起動に検索するには
次のようにします。

```sh
rg hoge
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 2:</span>
  ripgrep を使ってカレントディレクトリを "hoge" に対して再起動に検索
</div>

"rg" は ripgrep の実行ファイル名です。

これは次のようにして grep を使った場合と同様です:

```sh
grep -r hoge *
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 3:</span>
  grep を使ってカレントディレクトリを "hoge" に対して再起動に検索
</div>

ただし、 ripgrep のほうがずっと速く、
コマンドが短か、
出力が読みやすいです。

もちろん日本語も検索できます

```sh
rg カレントディレクトリ
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 4:</span>
  ripgrep で日本語を検索
</div>

このように出力されます:

```text
Ubuntu-Mate.org
63:ripgrep を使ってカレントディレクトリを "hoge" に対して再起動に検索するには
66:#+caption: ripgrep を使ってカレントディレクトリを "hoge" に対して再起動に検索
75:#+caption: ripgrep を使ってカレントディレクトリを "hoge" に対して再起動に検
```


## <span class="section-num">3</span> 結論 {#結論}

grep のかわりに ripgrep を使いましょう。
