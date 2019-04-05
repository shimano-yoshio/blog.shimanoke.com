+++
title = "From Org-mode marukup to Markdown"
author = ["Yoshio Shimano"]
date = 2019-04-05
lastmod = 2019-04-05T14:05:46+09:00
tags = ["Hugo", "ox-hugo"]
categories = ["Hugo", "ox-hugo"]
type = "post"
draft = false
thumbnail = "images/org-to-hugo.svg"
+++

Here are how ox-hugo convert markups (like bold, mono)
in Org to Markdown.

{{< table class="w3-table-all w3-card-4" caption="Table: 1: From Org-mode to Markdown">}}
| Org                | Markdown                                         | HTML                                     |
|--------------------|--------------------------------------------------|------------------------------------------|
| `*bold*`           | `**bold**`                                       | **bold**                                 |
| `/italics/`        | `_italics_`                                      | _italics_                                |
| `=monospace=`      | `` `monospace` ``                                | `monospace`                              |
| `~key-binding~`    | `` `key-binding` ``                              | <kbd>key-binding</kbd>                   |
|                    | - if `org-hugo-use-code-for-kbd`  nil [Default]  |                                          |
| `~key-binding~`    | `<kbd>key-binding</kbd>`                         |                                          |
|                    | - if `org-hugo-use-code-for-kbd` is not nil      |                                          |
|                    | - To render `<kbd>` tag, needs **CSS**           |                                          |
| `+strike-through+` | `~~strike-through~~`                             | ~~strike-through~~                       |
| `_underline_`      | `<span class = "underline">underline</span>`     | <span class="underline">underline</span> |
|                    | - to render this as underline, **CSS** is needed |                                          |
{{< /table >}}

I have set
`org-hugo-use-code-for-kbd` to `t` :

{{< codeblock caption="Code Snippet 1: Use &lt;kbd&gt; for key-binding" >}}
```emacs-lisp
(setq org-hugo-use-code-for-kbd t)
```
{{< /codeblock>}}

And add CSS styles like this:

{{< codeblock caption="" >}}
```css
kbd {
    padding: 0.2rem 0.4rem;
    font-size: 87.5%;
    color: #fff;
    background-color: #212529;
    border-radius: 0.2rem;
}

.underline{
    text-decoration: underline;
}
```
{{< /codeblock>}}
