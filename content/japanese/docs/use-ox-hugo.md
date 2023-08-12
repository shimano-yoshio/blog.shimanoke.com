+++
title = "ox-hugo を使う"
author = ["Yoshio Shimano"]
date = 2019-03-31
lastmod = 2019-04-03T14:30:15+09:00
tags = ["Hugo", "ox-hugo"]
categories = ["Hugo", "ox-hugo"]
type = "post"
draft = false
thumbnail = "images/org-to-hugo.svg"
+++

<div class="ox-hugo-toc toc">
<div></div>

<div class="heading">&#30446;&#27425;</div>

- [ox-hugo の中で LaTeX の数式への参照を使う](#ox-hugo-の中で-latex-の数式への参照を使う)
- [目次の制御](#目次の制御)
- [Details と summary](#details-と-summary)

</div>
<!--endtoc-->



## ox-hugo の中で LaTeX の数式への参照を使う {#ox-hugo-の中で-latex-の数式への参照を使う}

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


## 目次の制御 {#目次の制御}


### ox-hugo が出力する目次を Summary の中に出力させない {#ox-hugo-が出力する目次を-summary-の中に出力させない}

ox-hugo が出力される目次が、 Summary の中に
表示されてしまいます。
それを防ぐための方法です。


#### ファイルのコピー {#ファイルのコピー}

-   [`summary_minus_toc.html`](https://github.com/kaushalmodi/hugo-bare-min-theme/blob/master/layouts/partials/summary%5Fminus%5Ftoc.html)

から、テーマの `layouts/partials` ディレクトリへコピーします。
`summary_minus_toc.html` はこのような内容です:

{{< codeblock caption="<a id=\"code-snippet--list: summary-minus-toc\"></a><a href=\"#code-snippet--list: summary-minus-toc\">ソースコード 2</a>: layouts/partials/summary_minus_toc.html" >}}
```html
{{- with .Description -}}
    {{- . | markdownify | printf "<p>%s</p>" | safeHTML -}}
{{- else -}}
    {{- $summary_has_org_toc := substr .Content 0 30 | findRE "[\".]ox-hugo-toc" -}}
    {{- if $summary_has_org_toc -}}
        {{- $content_splits := split .RawContent "<!--endtoc-->" -}} <!-- Need to use .RawContent as we will be parsing for 'more' comment later. -->
        <!-- If Org TOC is present, the special comment endtoc would also be present.
             In that case, output only the part *after* that comment as Summary. -->
        {{- $summary_raw := index $content_splits 1 -}}
        {{- $summary_splits := split $summary_raw "<!--more-->" -}}
        {{- if eq (len $summary_splits) 2 -}}
            {{- index $summary_splits 0 | markdownify -}}
        {{- else -}}
            {{- $summary_raw | markdownify | truncate 300 -}}
        {{- end -}}
    {{- else -}}
        <!-- Print the whole Summary if endtoc special comment is not found. -->
        {{- .Summary |  printf "<p>%s</p>" | safeHTML -}}
    {{- end -}}
{{- end -}}
```
{{< /codeblock>}}

生の HTML が出るのは嫌なので、少し改造します:

{{< codeblock caption="ソースコード 3: 変更した summary_minus_toc.html" >}}
```html
{{- with .Description -}}
    {{- . | markdownify | printf "<p>%s</p>" | safeHTML -}}
{{- else -}}
    {{- $summary_has_org_toc := substr .Content 0 30 | findRE "[\".]ox-hugo-toc" -}}
    {{- if $summary_has_org_toc -}}
        {{- $content_splits := split .RawContent "<!--endtoc-->" -}} <!-- Need to use .RawContent as we will be parsing for 'more' comment later. -->
        <!-- If Org TOC is present, the special comment endtoc would also be present.
             In that case, output only the part *after* that comment as Summary. -->
        {{- $summary_raw := index $content_splits 1 -}}
        {{- $summary_splits := split $summary_raw "<!--more-->" -}}
        {{- if eq (len $summary_splits) 2 -}}
            {{- index $summary_splits 0 | markdownify -}}
        {{- else -}}
            {{- $summary_raw | markdownify | plainify | truncate 300 -}}
        {{- end -}}
    {{- else -}}
        <!-- Print the whole Summary if endtoc special comment is not found. -->
        {{- .Summary |  printf "<p>%s</p>" | safeHTML -}}
    {{- end -}}
{{- end -}}
```
{{< /codeblock>}}

{{< codeblock caption="" >}}
```html
{{- $summary_raw | markdownify | truncate 300 -}}
```
{{< /codeblock>}}

を

{{< codeblock caption="" >}}
```html
{{- $summary_raw | markdownify | plainify | truncate 300 -}}
```
{{< /codeblock>}}

に変更しただけです。

これはこのように動きます:

-   `#+DESCRIPTION:` があれば、それが使われます
-   ox-hugo が目次を作成していたら（=ox-hugo-toc= というクラスがあれば）、
    それを削除し、 Summary とします。


#### テーマの中での使用方法 {#テーマの中での使用方法}

次のようにして、 Summary を埋め込むテンプレートの中で
使ってください:

{{< codeblock caption="ソースコード 4: テーマの中での使用方法" >}}
```html
{{ partial "summary_minus_toc.html" . }}
```
{{< /codeblock>}}


### ox-hugo に目次を作成させないようにする {#ox-hugo-に目次を作成させないようにする}

ox-hugo はデフォルトで目次を生成します。
それを止めるには、  `org-hugo-export-with-toc` を `nil` に設定します。
また、 `org-html-use-infojs` が `t` だと、 **常に** 目次が
出力されてしまうので、 `nil` に設定しておきます。

{{< codeblock caption="<a id=\"code-snippet--disable-ox-hugo-generated-toc\"></a><a href=\"#code-snippet--disable-ox-hugo-generated-toc\">ソースコード 5</a>: ox-hugo に目次を作成させないようにする" >}}
```emacs-lisp
(setq org-hugo-export-with-toc nil)
(setq org-html-use-infojs nil)
```
{{< /codeblock>}}

各サブツリーで次のようにすると、目次は出力されません:

{{< codeblock caption="" >}}
```org
:EXPORT_OPTIONS: toc:nil
```
{{< /codeblock>}}

各サブツリーで次のようにすると、目次が出力されます:

{{< codeblock caption="" >}}
```org
:EXPORT_OPTIONS: toc:t
```
{{< /codeblock>}}

もしくは、次のようにすると、指定したレベルまでの目次が出ます:

{{< codeblock caption="" >}}
```org
:EXPORT_OPTIONS: toc:1
```
{{< /codeblock>}}


## Details と summary {#details-と-summary}

<details>
<p class="details">ox-hugo を使って Details と Summary を書く方法です。
</p>
</details>

{{< codeblock caption="" >}}
```org
#+begin_details
#+begin_summary
これは Summary
#+end_summary
これは detail
#+end_details
```
{{< /codeblock>}}

<details>
<summary>
これは Summary
</summary>
<p class="details">

これは detail
</p>
</details>
