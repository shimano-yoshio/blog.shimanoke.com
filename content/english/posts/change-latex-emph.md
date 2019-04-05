+++
title = "Change LaTeX emph with line marker style"
author = ["Yoshio Shimano"]
date = 2019-04-05T06:40:00+09:00
expiryDate = 2019-04-06T00:00:00+09:00
lastmod = 2019-04-06T07:08:52+09:00
tags = ["LaTeX"]
categories = ["LaTeX"]
type = "post"
draft = false
thumbnail = "images/org-to-hugo.svg"
+++

Lets change LaTeX emph command to look with line markers.

We redefine LaTeX `\emph` like this.

Japanese
: Gothic, Bold

Other
: Italic, Bold

Maker
: Yellow

We use `uline--.sty`.
Because `uline--.sty` is not a standar LaTeX style,
please download from this site:

-   [GitHub - doraTeX/breakfbox](https://github.com/doraTeX/breakfbox)

This howo to redefine the `emph` command:

{{< codeblock caption="<a id=\"code-snippet--redefine-emph\"></a><a href=\"#code-snippet--redefine-emph\">Code Snippet 1</a>: Redefine <code>emph</code>" >}}
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

With this, this Org-mode snippet:

{{< codeblock caption="<a id=\"code-snippet--chaged-emph-example\"></a><a href=\"#code-snippet--chaged-emph-example\">Code Snippet 2</a>: 強調の例" >}}
```org
/強調の行です。 This is emph/ 。うまくいくかな？
```
{{< /codeblock>}}

converts to LaTeX like this:

{{< codeblock caption="" >}}
```latex
\emph{強調の行です。 This is emph} 。うまくいくかな？
```
{{< /codeblock>}}

This will be typese in LaTeX like this:

{{< figure src="/ox-hugo/latex-emph-sample.png" caption="Figure 1: LaTeX Sample" >}}
