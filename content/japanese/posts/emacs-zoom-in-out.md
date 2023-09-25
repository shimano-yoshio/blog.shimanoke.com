+++
title = "Epacemacs でテキストのズームイン/ズームアウト"
author = ["島野 善雄"]
date = 2023-09-25T09:51:00+09:00
lastmod = 2023-09-25T09:51:35+09:00
tags = ["Emacs"]
categories = ["Ubuntu"]
type = "post"
draft = false
+++

<div class="ox-hugo-toc toc has-section-numbers">

<div class="heading">&#30446;&#27425;</div>

- <span class="section-num">1</span> [目的](#目的)
- <span class="section-num">2</span> [設定](#設定)
- <span class="section-num">3</span> [使用方法](#使用方法)
- <span class="section-num">4</span> [結論](#結論)

</div>
<!--endtoc-->

このドキュメントでは、Emacs の中でテキストの
ズームイン/ズームアウトする方法を説明します。


## <span class="section-num">1</span> 目的 {#目的}

Emacs でキーバインディングを設定して、
テキストのズームイン/ズームアウトを簡単に行ないます。


## <span class="section-num">2</span> 設定 {#設定}

次を Emacs の初期化ファイルに入れます:

```emacs-lisp
;; Zoom in
 (define-key global-map (kbd "C-+") 'text-scale-increase)

 ;; Zoom out
 (define-key global-map (kbd "C--") 'text-scale-decrease)
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 1:</span>
  Emacs でズームイン/ズームアウトを行なう
</div>


## <span class="section-num">3</span> 使用方法 {#使用方法}

次のキーバインディングでテキストのズームイン/ズームアウトを
行なうことができます。Emacs の中のどこからでも使用できます。

`Ctl + "+"`
: テキストのズームイン

`Ctl + "shift" + -"`
: テキストのズームアウト

このキーバインディングはよく使われているようで、
VSCode や qterminal でも使用することができます。


## <span class="section-num">4</span> 結論 {#結論}

上で設定したるキーバインディングを使うと、
次のキーを使って Emacs のテキストのズームイン/ズームアウトを
行なうことができます。

`Ctl + "+"`
: テキストのズームイン

`Ctl + "shift" + -"`
: テキストのズームアウト
