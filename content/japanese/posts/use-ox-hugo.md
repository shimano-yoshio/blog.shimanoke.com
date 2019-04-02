+++
title = "ox-hugo を使う"
author = ["Yoshio Shimano"]
date = 2019-03-31
lastmod = 2019-04-02T12:42:51+09:00
tags = ["Hugo", "ox-hugo"]
categories = ["Hugo"]
type = "post"
draft = false
+++

<style>
  .ox-hugo-toc ul {
    list-style: none;
  }
</style>
<div class="ox-hugo-toc toc">
<div></div>

<div class="heading">&#30446;&#27425;</div>

- <span class="section-num">1</span> [ox-hugo の中で LaTeX の数式への参照を使う](#ox-hugo-の中で-latex-の数式への参照を使う)
- <span class="section-num">2</span> [ox-hugo が出力する目次を Summary の中に出力させない](#ox-hugo-が出力する目次を-summary-の中に出力させない)
    - <span class="section-num">2.1</span> [ファイルのコピー](#ファイルのコピー)
    - <span class="section-num">2.2</span> [テーマの中での使用方法](#テーマの中での使用方法)

</div>
<!--endtoc-->



## <span class="section-num">1</span> ox-hugo の中で LaTeX の数式への参照を使う {#ox-hugo-の中で-latex-の数式への参照を使う}

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

参照してみます:お

\begin{equation}
\label{eq:02}
\y = ax + b
\end{equation}

ここで式(\ref{eq:01})を参照します。


## <span class="section-num">2</span> ox-hugo が出力する目次を Summary の中に出力させない {#ox-hugo-が出力する目次を-summary-の中に出力させない}

ox-hugo が出力される目次が、 Summary の中に
表示されてしまいます。
それを防ぐための方法です。


### <span class="section-num">2.1</span> ファイルのコピー {#ファイルのコピー}

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


### <span class="section-num">2.2</span> テーマの中での使用方法 {#テーマの中での使用方法}

次のようにして、 Summary を埋め込むテンプレートの中で
使ってください:

{{< codeblock caption="ソースコード 4: テーマの中での使用方法" >}}
```html
{{ partial "summary_minus_toc.html" . }}
```
{{< /codeblock>}}
