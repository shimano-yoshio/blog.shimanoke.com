+++
title = "Hugo を使う"
author = ["Yoshio Shimano"]
lastmod = 2019-03-28T13:41:53+09:00
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

<div class="heading">Table of Contents</div>

- <span class="section-num">1</span> [はじめに](#はじめに)
    - <span class="section-num">1.1</span> [なぜ Hugo を使うのか？](#なぜ-hugo-を使うのか)
    - <span class="section-num">1.2</span> [なぜ ox-hugo を使うのか？](#なぜ-ox-hugo-を使うのか)
- <span class="section-num">2</span> [ox-hugo でのプリアンブルの設定方法](#ox-hugo-でのプリアンブルの設定方法)
- <span class="section-num">3</span> [このサイトでで使える記法](#このサイトでで使える記法)
    - <span class="section-num">3.1</span> [図](#図)
    - <span class="section-num">3.2</span> [Babel](#babel)
    - <span class="section-num">3.3</span> [数式](#数式)
        - <span class="section-num">3.3.1</span> [インライン数式](#インライン数式)
        - <span class="section-num">3.3.2</span> [\\(\LaTeX\\) の数式](#latex--の数式)
    - <span class="section-num">3.4</span> [コードブロック](#コードブロック)
    - <span class="section-num">3.5</span> [表](#表)
    - <span class="section-num">3.6</span> [引用](#引用)
        - <span class="section-num">3.6.1</span> [素の quote ブロック](#素の-quote-ブロック)
        - <span class="section-num">3.6.2</span> [`quote` ショートコードを使う](#quote-ショートコードを使う)
            - <span class="section-num">3.6.2.1</span> [`quote` ショートコード](#quote-ショートコード)
            - <span class="section-num">3.6.2.2</span> [著者ありの例:](#著者ありの例)
            - <span class="section-num">3.6.2.3</span> [著者なしの例:](#著者なしの例)
    - <span class="section-num">3.7</span> [スペシャルブロック](#スペシャルブロック)
    - <span class="section-num">3.8</span> [例のブロック](#例のブロック)

</div>
<!--endtoc-->



## <span class="section-num">1</span> はじめに {#はじめに}


### <span class="section-num">1.1</span> なぜ Hugo を使うのか？ {#なぜ-hugo-を使うのか}

> 早い!

の一言につきます。
ポストが少ないのであれば、 Hugo のサイトのリビルドは一瞬です。


### <span class="section-num">1.2</span> なぜ ox-hugo を使うのか？ {#なぜ-ox-hugo-を使うのか}

ox-hugo は Org mode から Markdown へのエクスポートバックエンドです。

Hugo は Markdown で書くのが普通ですが、私は Markdown に慣れることが
できません。そこで、 ox-hugo というパッケージを使って、
Org-mode のファイルを Markdown に変換しています。
この ox-hugo というパッケージがなかなか優れもので、
やりたいことはほとんどできます。

それでも、自分の好みの機能がないので、 ox-hugo をカスタマイズして
使っています。


## <span class="section-num">2</span> ox-hugo でのプリアンブルの設定方法 {#ox-hugo-でのプリアンブルの設定方法}

{{< codeblock caption="" >}}
```org
#+OPTIONS: H:6 num:t
```
{{< /codeblock>}}

H:6
: 見出しのレベルを 6 まで出力します。

num::t
: 見出しに番号をつけます。


## <span class="section-num">3</span> このサイトでで使える記法 {#このサイトでで使える記法}


### <span class="section-num">3.1</span> 図 {#図}

これは:

{{< codeblock caption="" >}}
```org
#+ATTR_HTML: :alt test :width 25%
#+caption: Reddit Icon
[[file:reddit.svg]]
```
{{< /codeblock>}}

次に変換されます:

{{< figure src="/ox-hugo/reddit.svg" alt="test" caption="Figure 1: Reddit Icon" width="25%" >}}


### <span class="section-num">3.2</span> Babel {#babel}

Org-mode の中でプログラミング言語を書くことができます。
それだけではなく、 Org-mode の中でプログラムを実行することが
できます。

この Ditaa のプログラムは:

{{< codeblock caption="" >}}
```ditaa
+--------------+
|              |
| Hello World! |
|              |
+--------------+
```
{{< /codeblock>}}

このように変換されます:

<a id="org702f9fe"></a>

{{< figure src="/ox-hugo/hello-world.png" caption="Figure 2: Ditaa の出力" >}}


### <span class="section-num">3.3</span> 数式 {#数式}


#### <span class="section-num">3.3.1</span> インライン数式 {#インライン数式}

例えば下の Org mode の断片は:

{{< codeblock caption="" >}}
```org
LaTeX formatted equation: \( E = -J \sum_{i=1}^N s_i s_{i+1} \)
```
{{< /codeblock>}}

これは Hugo がレンダリングする HTML の中でこのように見えます:

LaTeX formatted equation: \\( E = -J \sum\_{i=1}^N s\_i s\_{i+1 }\\)


#### <span class="section-num">3.3.2</span> \\(\LaTeX\\) の数式 {#latex--の数式}

`ox-hugo` は \\(\LaTeX\\) の環境をサポートしています。

下の Org mode の断片は:

{{< codeblock caption="" >}}
```org
\begin{equation}
\label{eq:0}
C = W\log_{2} (1+\mathrm{SNR})
\end{equation}
```
{{< /codeblock>}}

次のようにエクスポートされます:

\begin{equation}
\label{eq:1}
C = W\log\_{2} (1+\mathrm{SNR})
\end{equation}

数式の参照も動きます。
だから `\ref{eq:1}` は [eq:1](#eq:1) としてレンダリングされます


### <span class="section-num">3.4</span> コードブロック {#コードブロック}

いくつかのコードの例です:

{{< codeblock caption="" >}}
```emacs-lisp
(message "Hello")
```
{{< /codeblock>}}

{{< codeblock caption="" >}}
```sh
ls -al
```
{{< /codeblock>}}

{{< codeblock caption="Code Snippet 1: Ruby の例" >}}
```ruby
print("test")
```
{{< /codeblock>}}

上の Ruby コードの出力です:

```text
test
```


### <span class="section-num">3.5</span> 表 {#表}

これは ([1](#table--tab:test1)):

{{< codeblock caption="" >}}
```org
#+name: tab:test1
#+caption: 表のテスト
|---|---|---|
| a | b | c |
|---|---|---|
| 1 | 2 | 3 |
| 1 | 2 | 3 |
| 1 | 2 | 3 |
|---|---|---|
```
{{< /codeblock>}}

このように出力されます:

{{< table class="w3-table-all w3-card-4" caption="<a id=\"table--tab:test1\"></a><a href=\"#table--tab:test1\">Table 1</a>: 表のテスト">}}
| a | b | c |
|---|---|---|
| 1 | 2 | 3 |
| 1 | 2 | 3 |
| 1 | 2 | 3 |
{{< /table >}}


### <span class="section-num">3.6</span> 引用 {#引用}


#### <span class="section-num">3.6.1</span> 素の quote ブロック {#素の-quote-ブロック}

素の quote ブロックの出力です。

{{< codeblock caption="" >}}
```org
#+begin_quote :author Shimano
こんなものですかね。引用は。うまくいきます？
#+end_quote
```
{{< /codeblock>}}

> こんなものですかね。引用は。うまくいきます？


#### <span class="section-num">3.6.2</span> `quote` ショートコードを使う {#quote-ショートコードを使う}


##### <span class="section-num">3.6.2.1</span> `quote` ショートコード {#quote-ショートコード}

このような `quote` ショートコード を作りました。あ

{{< codeblock caption="" >}}
```html
{{- $author := .Get "author" -}}
{{- $width := .Get "width" -}}
<div class="w3-panel w3-card-4 w3-light-grey"
  {{ if eq $width ""}}
     style="width:50%"
  {{ else }}
     style="width:{{$width}}"
  {{ end }}>
  <i class="fa fa-quote-left w3-large w3-text-red"></i><br>
  <p class="w3-large">
    {{ .Inner  }}
  </p>
{{ with $author }}
  <p class="w3-large w3-right">by: {{.}}</p><br>
{{ end }}
<i class="fa fa-quote-right w3-large w3-text-red"></i><br>
</div>
```
{{< /codeblock>}}


##### <span class="section-num">3.6.2.2</span> 著者ありの例: {#著者ありの例}

{{< codeblock caption="<a id=\"code-snippet--quote-with-authr\"></a><a href=\"#code-snippet--quote-with-authr\">Code Snippet 2</a>: 著者ありの引用" >}}
```org
#+HTML: {{%/* blockquote width="30%" author="shimano" */%}}
#+begin_quotation :author Shimano
こんなものですかね。引用は。うまくいきます？
#+end_quotation
#+HTML: {{</* /blockquote */>}}
```
{{< /codeblock>}}

これが出力されます:

{{% blockquote width="30%" author="shimano" %}}

<div class="quotation">
  <div></div>

こんなものですかね。引用は。うまくいきます？

</div>

{{< /blockquote >}}


##### <span class="section-num">3.6.2.3</span> 著者なしの例: {#著者なしの例}

{{< codeblock caption="<a id=\"code-snippet--quote-wihtout-author\"></a>" >}}
```org
#+HTML: {{%/* blockquote width="70%" */%}}
#+begin_quotation :author Shimano
こんなものですかね。引用は。うまくいきます？
#+end_quotation
#+HTML: {{</* /blockquote */>}}
```
{{< /codeblock>}}

これが出力されます:

{{% blockquote width="70%" %}}

<div class="quotation">
  <div></div>

こんなものですかね。引用は。うまくいきます？

</div>

{{< /blockquote >}}


### <span class="section-num">3.7</span> スペシャルブロック {#スペシャルブロック}

Org-mode の中のスペシャルブロックは `<div>` へ変換されます。
クラスを設定するには、 `#+ATTR_HTML: :class` を設定します。

この Org-mode のスペシャルブロックは:

{{< codeblock caption="" >}}
```org
#+ATTR_HTML: :class w3-panel w3-blue w3-border
#+begin_info
Info

This is a test.
#+end_info
```
{{< /codeblock>}}

これへと変換されます:

<div class="info w3-card-2 w3-panel w3-blue w3-border info">
  <div></div>

Info

This is a test.

</div>

{{< codeblock caption="" >}}
```org
#+ATTR_HTML: :class w3-panel w3-yellow w3-border
#+begin_info
#+begin_warning
Warning

This is a test.
#+end_warning
```
{{< /codeblock>}}

<div class="w3-panel w3-card-2 w3-yellow w3-border warning">
  <div></div>

Warning

This is a test.

</div>


### <span class="section-num">3.8</span> 例のブロック {#例のブロック}

{{< codeblock caption="" >}}
```ruby
p "test"
```
{{< /codeblock>}}

```text
test
```
