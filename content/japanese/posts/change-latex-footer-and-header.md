+++
title = "LaTeX ページのヘッダーとフッターの変更"
author = ["島野 善雄"]
date = 2019-04-06
lastmod = 2019-04-06T06:51:27+09:00
tags = ["LaTeX"]
categories = ["LaTeX"]
type = "post"
draft = false
+++

<div class="ox-hugo-toc toc">
<div></div>

<div class="heading">&#30446;&#27425;</div>

- [ConfidentialLevel の定義](#confidentiallevel-の定義)
- [`fancyhdr` パッケージを使った、ヘッダーとフッターを変更](#fancyhdr-パッケージを使った-ヘッダーとフッターを変更)

</div>
<!--endtoc-->

LaTeX ページのヘッダーとフッターを変更します。


## ConfidentialLevel の定義 {#confidentiallevel-の定義}

まず、これを出力するための変数 `ConfidentialLevel` を定義します:

{{< figure src="/ox-hugo/latex-confidential-sample.png" >}}

{{< codeblock caption="<a id=\"code-snippet--define-confidentaill-level\"></a><a href=\"#code-snippet--define-confidentaill-level\">ソースコード 1</a>: ConfidentialLevel の定義" >}}
```latex
\global\let\@ConfidentialLevel\@empty
\def\ConfidentialLevel#1{\gdef\@ConfidentialLevel{#1}}
```
{{< /codeblock>}}

LaTeX 文書のプリアンブルの中で、次のように定義してください。

{{< codeblock caption="" >}}
```latex
\ConfidentialLevel{Confidential}
```
{{< /codeblock>}}

Org-mode の場合は次のようにします:

{{< codeblock caption="" >}}
```org
#+LATEX_HEADER: \ConfidentialLevel{Confidential}
```
{{< /codeblock>}}

これは定義されていなければ出力されません。


## `fancyhdr` パッケージを使った、ヘッダーとフッターを変更 {#fancyhdr-パッケージを使った-ヘッダーとフッターを変更}

次に `fancyhdr` パッケージを使って、ヘッダーとフッターを変更します。

{{< codeblock caption="<a id=\"code-snippet--change-header-and-footer\"></a><a href=\"#code-snippet--change-header-and-footer\">ソースコード 2</a>: ヘッダーとフッターの変更" >}}
```latex
\usepackage{tcolorbox}
\tcbuselibrary{breakable,skins,raster,listings}
\tcbuselibrary{external}
\setlength{\footskip}{10truemm}
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\lhead{\rightmark}{}
\rhead{}{\leftmark}
\rfoot{% フッター右側に「部外秘」を出力
    \ifx\@ConfidentialLevel\@empty
    \else
      \tcbox[colback=white,colframe=red,size=small,on line]{
        \textcolor{red}{\sffamily \bfseries {\@ConfidentialLevel}}
    }\fi%
  }
\cfoot{\thepage}% フッター中央にページ番号を出力
```
{{< /codeblock>}}

これがタイプセットされます:

{{< figure src="/ox-hugo/latex-header-footer-sample.png" caption="&#22259;1:  LaTeX でのタイプセットの例" >}}
