+++
title = "Add \"Confidential\" mark to a LaTeX footer"
author = ["Yoshio Shimano"]
date = 2019-04-07
lastmod = 2019-04-07T14:33:46+09:00
tags = ["LaTeX"]
categories = ["LaTeX"]
type = "post"
draft = false
+++

<div class="ox-hugo-toc toc">
<div></div>

<div class="heading">Table of Contents</div>

- [Define `ConfidentialLevel` variable](#define-confidentiallevel-variable)
- [Change a LaTeX footer](#change-a-latex-footer)

</div>
<!--endtoc-->

Let' add "Confidential" mark to a LaTeX footer.


## Define `ConfidentialLevel` variable {#define-confidentiallevel-variable}

First, we define tha variable `ConfidentialLevel` to
show this

{{< figure src="/ox-hugo/latex-confidential-sample.png" >}}

{{< codeblock caption="<a id=\"code-snippet--define-confidentaill-level\"></a><a href=\"#code-snippet--define-confidentaill-level\">Code Snippet 1</a>: Define ConfidentialLevel" >}}
```latex
\global\let\@ConfidentialLevel\@empty
\def\ConfidentialLevel#1{\gdef\@ConfidentialLevel{#1}}
```
{{< /codeblock>}}

Define this variable in a LaTeX document preamble like this:

{{< codeblock caption="" >}}
```latex
\ConfidentialLevel{Confidential}
```
{{< /codeblock>}}

In a Org-mode document, define like this:

{{< codeblock caption="" >}}
```org
#+LATEX_HEADER: \ConfidentialLevel{Confidential}
```
{{< /codeblock>}}

Chagen it to anything you like.
If not defined, it will not be displayed.


## Change a LaTeX footer {#change-a-latex-footer}

Next, to change a LaTeX fotter,
we use `fancyhdr` package and tcolorbox package:

{{< codeblock caption="<a id=\"code-snippet--change-header-and-footer\"></a><a href=\"#code-snippet--change-header-and-footer\">Code Snippet 2</a>: Change a LaTeX header and footer" >}}
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
\rfoot{
    \ifx\@ConfidentialLevel\@empty
    \else
      \tcbox[colback=white,colframe=red,size=small,on line]{
        \textcolor{red}{\sffamily \bfseries {\@ConfidentialLevel}}
    }\fi%
  }
\cfoot{\thepage}% print the page number in tha center of the footer
```
{{< /codeblock>}}

In a LaTeX documet, this will be typeset:

{{< figure src="/ox-hugo/latex-header-footer-sample.png" caption="Figure 1: Sample of LaTeX" >}}

the centre of a footer
: a page numer

the right side of a footer
: "Confidential" mark
