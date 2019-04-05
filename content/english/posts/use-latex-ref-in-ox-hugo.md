+++
title = "Reference to LaTeX math in ox-hugo"
author = ["Yoshio Shimano"]
date = 2019-04-02
lastmod = 2019-04-06T06:35:17+09:00
tags = ["Hugo", "ox-hugo"]
categories = ["Hugo", "ox-hugo"]
type = "post"
draft = false
thumbnail = "images/org-to-hugo.svg"
+++

In Org-mode, you can reference LaTeX math, with `\ref{eq:1}`,
but in ox-hugo it does not work by default.

This math sinippet:

{{< codeblock caption="" >}}
```org
\begin{equation}
\label{eq:01}
y = ax + b
\end{equation}
```
{{< /codeblock>}}

this puroduces this:

\begin{equation}
\label{eq:01}
y = ax + b
\end{equation}

Here I referece Eq. \ref{eq:02} (`Eq(\ref{eq:02}`).
Without the settings below, this reference does not work.

Make `static/mathjax-config.js` as follows
(take from ox-hugo's test site):

{{< codeblock caption="Code Snippet 1: static/mathjax-config.js" >}}
```javascript
window.MathJax = {
    displayAlign: "center",
    displayIndent: "0em",
    "HTML-CSS": { scale: 100,
                  linebreaks: { automatic: "false" },
                  webFont: "TeX"
                },
    SVG: {scale: 100,
          linebreaks: { automatic: "false" },
          font: "TeX"},
    NativeMML: {scale: 100},
    TeX: { equationNumbers: {autoNumber: "AMS"},
           MultLineWidth: "85%",
           TagSide: "right",
           TagIndent: ".8em"
         }
};
```
{{< /codeblock>}}

And call it from a template which calls Javasctipt
(like layouts/partial/header.html):

{{< codeblock caption="" >}}
```html
<script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-MML-AM_CHTML' async></script>
<script src="{{ "mathjax-config.js" | absURL }}"></script>
```
{{< /codeblock>}}

Lets' reference some equations.

{{< codeblock caption="" >}}
```org
\begin{equation}
\label{eq:02}
y = ax + b
\end{equation}
```
{{< /codeblock>}}

\begin{equation}
\label{eq:02}
\y = ax + b
\end{equation}

Here, referencing Eq. \ref{eq:01}.
