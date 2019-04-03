+++
title = "ox-hugo の中で LaTeX の数式への参照を使う"
author = ["Yoshio Shimano"]
date = 2019-04-02
lastmod = 2019-04-03T20:31:37+09:00
tags = ["Hugo", "ox-hugo"]
categories = ["Hugo", "ox-hugo"]
type = "post"
draft = false
thumbnail = "images/org-to-hugo.svg"
+++

ox-hugo の中で LaTeX の数式を書いて、それを参照することができるはずですが、
そのままでは動きません。

{{< codeblock caption="" >}}
```org
\begin{equation}
\label{eq:01}
\y = ax + b
\end{equation}
```
{{< /codeblock>}}

と書くと、次が出力されます:

\begin{equation}
\label{eq:01}
\y = ax + b
\end{equation}

ここで式(\ref{eq:02})を参照します。
以下の設定をしない場合は式(\ref{eq:02})を参照できません。

`static/mathjax-config.js` を次の内容で作成してください
（ox-hugo の test からコピーしました）:

{{< codeblock caption="ソースコード 1: static/mathjax-config.js" >}}
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

これを Javasctipt を使うテンプレートの中で呼びだします:

{{< codeblock caption="" >}}
```html
<script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-MML-AM_CHTML' async></script>
<script src="{{ "mathjax-config.js" | absURL }}"></script>
```
{{< /codeblock>}}

参照してみます:

\begin{equation}
\label{eq:02}
\y = ax + b
\end{equation}

ここで式(\ref{eq:01})を参照します。
