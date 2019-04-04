+++
title = "Org-mode から Markdownへのマークアップの変換"
author = ["Yoshio Shimano"]
date = 2019-04-04
lastmod = 2019-04-04T16:22:15+09:00
tags = ["Hugo", "ox-hugo", "CSS"]
categories = ["Hugo", "ox-hugo"]
type = "post"
draft = false
thumbnail = "images/org-to-hugo.svg"
+++

ox-hugo の中で、
強調や等幅などのマークアップが、 Org-mode から Markdown へ変更される方法です。

{{< table class="w3-table-all w3-card-4" caption="&#34920;: 1: Org-mode から Markdownへのマークアップの変換">}}
| Org                | Markdown                                          | HTML                                        |
|--------------------|---------------------------------------------------|---------------------------------------------|
| `*bold*`           | `**bold**`                                        | **bold ボールド**                           |
| `/italics/`        | `_italics_`                                       | _italics イタリック_                        |
| `=monospace=`      | `` `monospace` ``                                 | `monospace 等幅`                            |
| `~key-binding~`    | `` `key-binding` ``                               | <kbd>key-binding キーバインディング</kbd>   |
|                    | - `org-hugo-use-code-for-kbd` が nil であれば[デフォルト] |                                             |
| `~key-binding~`    | `<kbd>key-binding</kbd>`                          |                                             |
|                    | - `org-hugo-use-code-for-kbd` nil でなければ      |                                             |
|                    | - `<kbd>` タグを特別にレンダリングするには **CSS** が必用 |                                             |
| `+strike-through+` | `~~strike-through~~`                              | ~~strike-through 打ち消し線~~               |
| `_underline_`      | `<span class = "underline">underline</span>`      | <span class="underline">underline 下線</span> |
|                    | - 下線としてこの `underline` クラスをレンダリングするには  **CSS** が必用 |                                             |
{{< /table >}}

`org-hugo-use-code-for-kbd` を `t` に設定し:

{{< codeblock caption="" >}}
```emacs-lisp
(setq org-hugo-use-code-for-kbd t)
```
{{< /codeblock>}}

このような CSS を追加しました:

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
