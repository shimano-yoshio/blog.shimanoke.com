+++
title = "Ubuntu でスクリーンキャストを録画し、GIF に保存する (peek)"
author = ["島野 善雄"]
date = 2023-09-16T10:38:00+09:00
lastmod = 2023-09-16T10:38:26+09:00
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

- <span class="section-num">1</span> [peek のインストール](#peek-のインストール)
- <span class="section-num">2</span> [peek を使ってみる](#peek-を使ってみる)
- <span class="section-num">3</span> [結論](#結論)
- <span class="section-num">4</span> [参考文献](#参考文献)

</div>
<!--endtoc-->

Linux で画面を動画としてキャプチャしたい場合には、
「[OBS](https://obsproject.com/)」を使うことが一般的ですが、
もっと御気軽に画面を録画し、 GIF アニメーションとして
保存したいことがあります。

私はこのにめに peek を使っています

-   [phw/peek: Simple animated GIF screen recorder with an easy to use interface](https://github.com/phw/peek)

この文書では peek のインストール方法と使いかたを説明します。


## <span class="section-num">1</span> peek のインストール {#peek-のインストール}

Ubuntu に peek をインストールします。
次をターミナルの中で実行してください。

```sh
sudo apt update
sudo apt install peek
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 1:</span>
  peek のインストール
</div>

peek のバージョンを確認します

```sh
/usr/bin/peek --version
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 2:</span>
  peek のバージョン確認
</div>

```text
Peek 1.5.1
```

バージョン番号が出力されたら peek のインストールは成功です。


## <span class="section-num">2</span> peek を使ってみる {#peek-を使ってみる}

ターミナルから次のコマンドを入力して、
peek をたちあげます。

```sh
peek
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 3:</span>
  peek の起動
</div>

すると次のような画面になるので、タイトルを右クリックし、
「Resize」をクリックして、録画したい領域を選択します。

{{< figure src="/ox-hugo/peek-select-area.png" alt="peek の画面" caption="<span class=\"figure-number\">&#22259;1:  </span>peek の画面" width="50%" >}}

録画する領域が選択できたら、右上の「Record as GIF」をクリックして、
録画を開始します。

すると 「Record as GIF」ボタンが 「Stop」に変化します。

{{< figure src="/ox-hugo/peek-in-recording.png" alt="peek で録画中" caption="<span class=\"figure-number\">&#22259;2:  </span>peek で録画中" width="50%" >}}

録画を終了するには「Stop」ボタンを押してください。
ファイルを保存するダイアログが出ます。
デフォルトの保存先は 「=~/Videos=」です。
これは peek の設定で変更することができます。

以下に例を示します。ターミナルの操作であれば、問題なく録画されています。

{{< figure src="/ox-hugo/screenkye.gif" caption="<span class=\"figure-number\">&#22259;3:  </span>peek での録画の例" width="50%" >}}

ちなみにこのファイルのサイズは 150 KByte ほどです。


## <span class="section-num">3</span> 結論 {#結論}

OBS と peek の使いわけです。

-   OBS::
    -   YouTube などに綺麗なビデオをアップロードするため
    -   ストリーミング配信を行なうため
-   peek::
    -   ブログなどに気軽に動画を入れるため


## <span class="section-num">4</span> 参考文献 {#参考文献}

-   [phw/peek: Simple animated GIF screen recorder with an easy to use interface](https://github.com/phw/peek)
