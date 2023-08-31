+++
title = "LaTeX のプログラムリストを tcolorbox を使って出力する"
author = ["島野 善雄"]
date = 2019-04-09
lastmod = 2023-08-31T08:57:55+09:00
tags = ["LaTeX"]
categories = ["LaTeX"]
type = "post"
draft = false
+++

<div class="ox-hugo-toc toc has-section-numbers">

<div class="heading">&#30446;&#27425;</div>

- <span class="section-num">1</span> [tcolorbox の設定](#tcolorbox-の設定)
- <span class="section-num">2</span> [programlist 環境](#programlist-環境)
- <span class="section-num">3</span> [programlist 環境の例](#programlist-環境の例)
- <span class="section-num">4</span> [Org-mode から programlist 環境を使う](#org-mode-から-programlist-環境を使う)
    - <span class="section-num">4.1</span> [programlist 環境を使うための Org-mode の設定](#programlist-環境を使うための-org-mode-の設定)
    - <span class="section-num">4.2</span> [mystyle.sty の作成](#mystyle-dot-sty-の作成)
    - <span class="section-num">4.3</span> [Org-mode のファイルの設定](#org-mode-のファイルの設定)

</div>
<!--endtoc-->

tcolorbox パッケージを使うと、
箱にはいった環境を比較的簡単に作ることができます
tcolorbox のドキュメントを見るには次のコマンドを使用してください:
いろいろな例がのっています（英文です）。

```sh
texdoc tcolorbox
```

ここでは tcolorbox を使った、プログラムリストの表示を
紹介します。


## <span class="section-num">1</span> tcolorbox の設定 {#tcolorbox-の設定}

まず tcolorbox の設定を行ないます:


## <span class="section-num">2</span> programlist 環境 {#programlist-環境}

プログラムリストを出力する programlist 環境を
作成します。


## <span class="section-num">3</span> programlist 環境の例 {#programlist-環境の例}

programlist 環境は
このようにして使います（Org-mode のマニュアルからの例）:

このように出力されます:

{{< figure src="/ox-hugo/programlit-example1.png" caption="<span class=\"figure-number\">&#22259;1:  </span>programlist 環境の出力例" >}}


## <span class="section-num">4</span> Org-mode から programlist 環境を使う {#org-mode-から-programlist-環境を使う}

この programlist 環境を、 Org-mode の LaTeX エクスポートから
使う設定です。


### <span class="section-num">4.1</span> programlist 環境を使うための Org-mode の設定 {#programlist-環境を使うための-org-mode-の設定}

Org-mode の `src` ブロックを LaTeX の
programlist 環境に変換するための設定です。

次のものを Emacs の初期化ファイルに入れてください:

```emacs-lisp
(setq org-latex-custom-lang-environments
      '(
        (c "\\begin{programlist}[label={%l}]{c}{: %c}%s\\end{programlist}")
        (ditaa "\\begin{programlist}[label={%l}]{text}{: %c}%s\\end{programlist}")
        (emacs-lisp "\\begin{programlist}[label={%l}]{lisp}{: %c}%s\\end{programlist}")
        (ruby "\\begin{programlist}[label={%l}]{ruby}{: %c}%s\\end{programlist}")
        (latex "\\begin{programlist}[label={%l}]{latex}{: %c}%s\\end{programlist}")
        (lua "\\begin{programlist}[label={%l}]{lua}{: %c}%s\\end{programlist}")
        (java "\\begin{programlist}[label={%l}]{java}{: %c}%s\\end{programlist}")
        (javascript "\\begin{programlist}[label={%l}]{javascript}{: %c}%s\\end{programlist}")
        (json "\\begin{programlist}[label={%l}]{json}{: %c}%s\\end{programlist}")
        (plantuml "\\begin{programlist}[label={%l}]{text}{: %c}%s\\end{programlist}")
        (maxima "\\begin{programlist}[label={%l}]{text}{: %c}%s\\end{programlist}")
        (ipython "\\begin{programlist}[label={%l}]{python}{: %c}%s\\end{programlist}")
        (python "\\begin{programlist}[label={%l}]{python}{: %c}%s\\end{programlist}")
        (perl "\\begin{programlist}[label={%l}]{perl}{: %c}%s\\end{programlist}")
        (html "\\begin{programlist}[label={%l}]{html}{: %c}%s\\end{programlist}")
        (org "\\begin{programlist}[label={%l}]{text}{: %c}%s\\end{programlist}")
        (typescript "\\begin{programlist}[label={%l}]{typescript}{: %c}%s\\end{programlist}")
        (scss "\\begin{programlist}[label={%l}]{scss}{: %c}%s\\end{programlist}")
        (sh "\\begin{programlist}[label={%l}]{shell}{: %c}%s\\end{programlist}")
        (shellinput "\\begin{shellinput}[%c]%s\\end{shellinput}")
        (shelloutput "\\begin{shelloutput}[%c]%s\\end{shelloutput}")
        ))
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 1:</span>
  ソースコードの LaTeX 環境への変換
</div>

必用であれば言語を追加してください。


### <span class="section-num">4.2</span> mystyle.sty の作成 {#mystyle-dot-sty-の作成}

Org-mode のファイルの中で programlist の設定を書くのは
面倒くさいので、
定義を格納する `mystyle.sty` を
次の内容で作成します。


### <span class="section-num">4.3</span> Org-mode のファイルの設定 {#org-mode-のファイルの設定}

次に Org-mode のファイルの設定です。

```org
# ドキュメントクラスの指定
#+LATEX_CLASS: jsbook
# ドキュメントクラスのオプションの指定
#+LATEX_CLASS_OPTIONS: [dvipdfmx,a4j,uplatex,openany]
# カスタムスタイルの読み込み
#+LATEX_HEADER: \usepackage{mystyle}
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 2:</span>
  Org-mode のファイルの設定
</div>

以上で色つきの箱にはいったプログラムリストが
Org-mode から LaTeX にエクスポートされるはずです。
