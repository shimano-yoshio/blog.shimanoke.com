+++
title = "LaTeX の emph を蛍光ペンでひいたようなスタイルにする"
author = ["島野 善雄"]
date = 2019-04-05
expiryDate = 2019-04-06T00:00:00+09:00
lastmod = 2019-04-05T16:32:10+09:00
tags = ["LaTeX"]
categories = ["LaTeX"]
type = "post"
draft = false
thumbnail = "images/org-to-hugo.svg"
+++

最近の HTML でみかけるように、 LaTeX での強調強調の文が
蛍光マーカーで線を引かれたようにします。
LaTeX の `\emph` コマンドを再定義します。

日本語
: ゴシック太字

欧文
: イタリック太字

塗り
: 黄色で、文字の半分まで

というようになるように、 `\emph` コマンドを変更します。

`uline--.sty` を使います。
`uline--.sty` は標準パッケージではないので、

-   [GitHub - doraTeX/breakfbox](https://github.com/doraTeX/breakfbox)

からダウンロードしてください。

`emph` コマンドの再定義方法です:

{{< codeblock caption="<a id=\"code-snippet--redefine-emph\"></a><a href=\"#code-snippet--redefine-emph\">ソースコード 1</a>: <code>emph</code> コマンドの再定義" >}}
```latex
\usepackage[usetype1]{uline--}

\renewcommand{\emph}[1]{%
{\sffamily\bfseries\itshape%
  \uline[
    background,
    color={[rgb]{1,1,0.0}},
    width=0.8em,position=1pt]{#1}}}
```
{{< /codeblock>}}

これを使うとこの Org-mode は:

{{< codeblock caption="<a id=\"code-snippet--chaged-emph-example\"></a><a href=\"#code-snippet--chaged-emph-example\">ソースコード 2</a>: 強調の例" >}}
```org
/強調の行です。 This is emph/ 。うまくいくかな？
```
{{< /codeblock>}}

このように LaTeX へ変換されます:

{{< codeblock caption="" >}}
```latex
\emph{強調の行です。 This is emph} 。うまくいくかな？
```
{{< /codeblock>}}

これは LaTeX で次のようにタイプセットされます:

{{< figure src="/ox-hugo/latex-emph-sample.png" caption="&#22259;1:  LaTeX での例" >}}
