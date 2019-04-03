+++
title = "ox-hugo が出力する目次を Summary の中に出力させない"
author = ["Yoshio Shimano"]
date = 2019-04-02
lastmod = 2019-04-03T14:18:51+09:00
tags = ["Hugo", "ox-hugo"]
categories = ["Hugo", "ox-hugo"]
type = "post"
draft = false
thumbnail = "images/org-to-hugo.svg"
+++

ox-hugo が出力される目次が、 Summary の中に
表示されてしまいます。
それを防ぐための方法です。


## ファイルのコピー {#ファイルのコピー}

-   [`summary_minus_toc.html`](https://github.com/kaushalmodi/hugo-bare-min-theme/blob/master/layouts/partials/summary%5Fminus%5Ftoc.html)

から、テーマの `layouts/partials` ディレクトリへコピーします。
`summary_minus_toc.html` はこのような内容です:

{{< codeblock caption="<a id=\"code-snippet--list: summary-minus-toc\"></a><a href=\"#code-snippet--list: summary-minus-toc\">ソースコード 1</a>: layouts/partials/summary_minus_toc.html" >}}
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

{{< codeblock caption="ソースコード 2: 変更した summary_minus_toc.html" >}}
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


## テーマの中での使用方法 {#テーマの中での使用方法}

次のようにして、 Summary を埋め込むテンプレートの中で
使ってください:

{{< codeblock caption="ソースコード 3: テーマの中での使用方法" >}}
```html
{{ partial "summary_minus_toc.html" . }}
```
{{< /codeblock>}}
