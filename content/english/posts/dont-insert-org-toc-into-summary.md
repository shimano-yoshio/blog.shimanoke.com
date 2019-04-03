+++
title = "Do not put TOC in Summary"
author = ["Yoshio Shimano"]
date = 2019-04-03
lastmod = 2019-04-03T20:55:37+09:00
tags = ["Hugo", "ox-hugo"]
categories = ["Hugo", "ox-hugo"]
type = "post"
draft = false
thumbnail = "images/org-to-hugo.svg"
+++

By default, The TOC generated by ox-hugo is
inserted into "Summary" in Hugo.

This is how to prebent it
(Taken from ox-hugo test site).


## Copy summary\_minus\_toc.html {#copy-summary-minus-toc-dot-html}

Copy  [`summary_minus_toc.html`](https://github.com/kaushalmodi/hugo-bare-min-theme/blob/master/layouts/partials/summary%5Fminus%5Ftoc.html)
from this site.

-   [`summary_minus_toc.html`](https://github.com/kaushalmodi/hugo-bare-min-theme/blob/master/layouts/partials/summary%5Fminus%5Ftoc.html)

`summary_minus_toc.html` looks like this:

{{< codeblock caption="<a id=\"code-snippet--list: summary-minus-toc\"></a><a href=\"#code-snippet--list: summary-minus-toc\">Code Snippet 1</a>: layouts/partials/summary_minus_toc.html" >}}
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

I modified some code as below so that
raw HTML codes are not shown.

{{< codeblock caption="Code Snippet 2: Modified summary_minus_toc.html" >}}
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

I changed this:

{{< codeblock caption="" >}}
```html
{{- $summary_raw | markdownify | truncate 300 -}}
```
{{< /codeblock>}}

to:

{{< codeblock caption="" >}}
```html
{{- $summary_raw | markdownify | plainify | truncate 300 -}}
```
{{< /codeblock>}}

This works as follows:

-   If `#+DESCRIPTION:` exitst, it will be used.
-   If ox-hugo has made a TOC (if class `ox-hugo-toc` exists).
    delte it, make "Summary".


## How to use summary\_minus\_toc.html {#how-to-use-summary-minus-toc-dot-html}

In a template containig "Summary",
use this code:

{{< codeblock caption="Code Snippet 3: How to use summary_minus_toc.html" >}}
```html
{{ partial "summary_minus_toc.html" . }}
```
{{< /codeblock>}}