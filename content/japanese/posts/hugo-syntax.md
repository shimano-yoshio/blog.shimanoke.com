---
title: "このブログで使うことができる文法"
date: 2011-03-06T16:01:23+09:00
lastmod: 2019-03-26T10:01:23+09:00
type: post
draft: false
tags: ["preview", "shortcodes", "tag-6", "hugo" ]
categories: ["docs", "shortcodes", "index"]
toc: true
---

## はじめに
**Markdown** は
[Daring Fireball](http://daringfireball.net/) によって
作成されました。 
オリジナルのガイドラインは[ここ](http://daringfireball.net/projects/markdown/syntax)にあります。 
しかしその文法は異なるパーサやエディタで変化します。

この記事ではこのブログの中で使用することができる
Markdown の文法を説明します。
<!--more-->




## パラグラフと改行

単純にパラグラフは、
1 行以上の連続するテキストです
In markdown source code, Markdown のソースコードのニンアで
paragraphs パラグラフは
are separated 分けられます
by more than one blank lines. 


However,  しかし
most markdown parser will ignore 無視します
single line break, 
to make other markdown parsers recognize 
your line break, 
you can leave two whitespace 
at the end of the line, or insert `<br/>`.

## 見出し

見出しは行のはじめで 1-6 個のハッシュ文字を使います。
このハッシュ文字の数が見出しのレベル 1-6 に対応します。
例です:

``` markdown
# これは H1

## これは H2

###### これは H6
```

## ブロッククオート

Markdown は
ブロッククオートに対して Eメールスタイルの > 文字を使います。
それは次のようにレンダリングされます:


> This is a blockquote with two paragraphs. This is first paragraph.
>
> This is second pragraph.Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
>
> This is another blockquote with one paragraph. There is three empty line to seperate two blockquote.
>


こんなショートコードを作りました。

```markdown
{{%/* blockquote width="50%" author="shimano" */%}}
こんなものですかね。引用は。うまくいきます？
{{%/* /blockquote */%}}
```

このように出力されます。

{{% blockquote width="50%" author="shimano" %}}
こんなものですかね。引用は。うまくいきます？
{{% /blockquote %}}



## リスト

Input `* list item 1` と入力すると
will create 作成します
an un-ordered list, 
the `*` symbol can be replace with `+` or `-`.

```markdown
* Red
* Green
* Blue
```


* Red
* Green
* Blue


Input `1. list item 1` 
will create 
an ordered list, their markdown source code is like:

```markdown
1. Red
2. Green
3. Blue
```

1. Red
2. Green
3. Blue


## タスクリスト

Task lists タスクリストは、
are lists with items アイテムを持つリストです
marked  as either `[ ]` か `[x]`  としてマークされている
(完了していないか、完了している). 
例です:

- [ ] a task list item
- [ ] list syntax required
- [ ] normal **formatting**, @mentions, #1234 refs
- [ ] incomplete
- [x] completed

You can change 
the complete/incomplete state 
by click the checkbox before the item.

## 文法ハイライト

```js
function helloWorld () {
  alert("Hello, World!")
}
```
Java の例です:

```java
public class HelloWorld {
  public static void main(String[] args) {
    System.out.println("Hello, World!");
  }
}
```

{{< codeblock caption="Demo for html color" >}}
```java
public class HelloWorld {
  public static void main(String[] args) {
    System.out.println("Hello, World!");
  }
}
```
{{< /codeblock>}}


## 数式ブロック

**MathJax を使って**、
*LaTeX* の数式表現をレンダリングすることができます。


$$
\mathbf{V}_1 \times \mathbf{V}_2 =  \begin{vmatrix}
\mathbf{i} & \mathbf{j} & \mathbf{k} \\
\frac{\partial X}{\partial u} &  \frac{\partial Y}{\partial u} & 0 \\
\frac{\partial X}{\partial v} &  \frac{\partial Y}{\partial v} & 0 \\
\end{vmatrix}
$$


In markdown source file, 
math block 
is *LaTeX* expression 
wrapped 
by ‘$$’ mark:

``` markdown
$$
\mathbf{V}_1 \times \mathbf{V}_2 =  \begin{vmatrix}
\mathbf{i} & \mathbf{j} & \mathbf{k} \\
\frac{\partial X}{\partial u} &  \frac{\partial Y}{\partial u} & 0 \\
\frac{\partial X}{\partial v} &  \frac{\partial Y}{\partial v} & 0 \\
\end{vmatrix}
$$
```

## 表

Input `| First Header  | Second Header |` 
and press `return` key 
will create a table with two column.

Markdown のソースコードでは表は次のように見えます:

``` markdown
| 名前              | Markdown            | HTML tag             |
| ----------------- | ------------------- | -------------------- |
| *Emphasis*        | `*Emphasis*`        | `<em></em>`          |
| **Strong**        | `**Strong**`        | `<strong></strong>`  |
| `code`            | ``code``            | `<code></code>`      |
| ~~Strikethrough~~ | `~~Strikethrough~~` | `<del></del`         |
| <u>Underline</u>  | `<u>underline</u>`  | `<u></u>`            |
```

これが出ます

{{< table class="w3-table-all w3-card-4" caption="**test表のテスト**">}}
| 名前              | Markdown            | HTML のタグ          |
| ----------------- | ------------------- | -------------------- |
| *Emphasis*        | `*Emphasis*`        | `<em></em>`          |
| **Strong**        | `**Strong**`        | ` <strong></strong>` |
| `code`            | ``code``            | `<code></code>`      |
| ~~Strikethrough~~ | `~~Strikethrough~~` | `<del></del`         |
| <u>Underline</u>  | `<u>underline</u>`  | `<u></u>`            |
{{< /table >}}


## 脚注

脚注を作成します。


``` markdown
You can create footnotes like this[^footnote].

[^footnote]: Here is the *text* of the **footnote**.
```

これは次を生成します:

You can create footnotes like this[^footnote].

[^footnote]: Here is the *text* of the **footnote**.

Mouse on the ‘footnote’ superscript to see content of the footnote.

## 水平線

空行で `***` か `---` を入力して、
`return` を押すと水平線を描きます。

------

## リンク

Markdown は 2 つの種類のリンクをサポートしています:
インラインと参照です。

両方のスタイルで、リンクのテキストは [大括弧] によって分けられます。

To create an inline link, インラインリンクを作成するには、
use 使ってください
a set of regular parentheses
immediately after すぐ後に
the link text’s closing square bracket. 
Inside the parentheses, 
put 
the URL 
where you want the link 
to point,
along with an optional title オプションのタイトルとともに
for the link, surrounded in quotes. クオートの中に囲まれたリンクに対する
例です:

```markdown
これは [例](http://example.com/ "Title") となるインラインリンクです。

[このリンク](http://example.net/) にはタイトル属性はありません。
```
次を生成します:

これは [例](http://example.com/ "Title") となるインラインリンクです。
(`<p>これは <a href="http://example.com/" title="Title">`)

[このリンク](http://example.net/) にはタイトル属性はありません。
(`<p><a href="http://example.net/">このリンク</a> has no`)

### 内部リンク

**You can set 
the href 
to headers**, 
which will create a bookmark that allow you to jump to that section after clicking. 例です:

Command(on Windows: Ctrl) + Click [This link](#block-elements) will jump to header `Block Elements`. To see how to write that, please move cursor or click that link with `⌘` key pressed to expand the element into markdown source.

### Reference Links

Reference-style links use a second set of square brackets, inside which you place a label of your choosing to identify the link:

``` markdown
This is [an example][id] reference-style link.

Then, anywhere in the document, you define your link label like this, on a line by itself:

[id]: http://example.com/  "Optional Title Here"
```

In typora, they will be rendered like:

This is [an example][id] reference-style link.

[id]: http://example.com/	"Optional Title Here"

The implicit link name shortcut allows you to omit the name of the link, in which case the link text itself is used as the name. Just use an empty set of square brackets — e.g., to link the word “Google” to the google.com web site, you could simply write:

``` markdown
[Google][]
And then define the link:

[Google]: http://google.com/
```

In typora click link will expand it for editing, command+click will open the hyperlink in web browser.

## URLs

Typora allows you to insert urls as links, wrapped by `<`brackets`>`.

`<i@typora.io>` becomes <i@typora.io>.

Typora will aslo auto link standard URLs. e.g: www.google.com.

## Images

Image looks similar with links, but it requires an additional `!` char before the start of link. Image syntax looks like this:

``` markdown
![Alt text](/path/to/img.jpg)

![Alt text](/path/to/img.jpg "Optional title")
```

You are able to use drag & drop to insert image from image file or we browser. And modify the markdown source code by clicking on the image. Relative path will be used if image is in same directory or sub-directory with current editing document when drag & drop.

For more tips on images, please read <http://support.typora.io//Images/>

## Emphasis

Markdown treats asterisks (`*`) and underscores (`_`) as indicators of emphasis. Text wrapped with one `*` or `_` will be wrapped with an HTML `<em>` tag. E.g:

``` markdown
*single asterisks*

_single underscores_
```

出力:

*single asterisks*

_single underscores_

GFM will ignores underscores in words, which is commonly used in code and names, like this:

> wow_great_stuff
>
> do_this_and_do_that_and_another_thing.

To produce 
a literal asterisk or underscore 
at a position 
where it would otherwise 
be used as an emphasis delimiter, you can backslash escape it:

``` markdown
\*this text is surrounded by literal asterisks\*
```

Typora recommends to use `*` symbol.

## 太字

double *’s or _’s will be wrapped with an HTML `<strong>` tag, e.g:

``` markdown
**double asterisks**

__double underscores__
```

出力:

**double asterisks**

__double underscores__

Typora recommends to use `**` symbol.

## Code

To indicate 
a span of code, 
wrap 
it 
with backtick quotes (`). 
Unlike a pre-formatted code block, 
a code span 
indicates 
code within a normal paragraph. 
例です:

``` markdown
Use the `printf()` function.
```

will produce:

Use the `printf()` function.

## 打ち消し線

GFM adds syntax to create strikethrough text, which is missing from standard Markdown.

`~~Mistaken text.~~` becomes ~~Mistaken text.~~

## 下線

Underline is powered by raw HTML.

`<u>Underline</u>` becomes <u>Underline</u>.

## 絵文字 :smile:

Input emoji with syntax `:smile:`.


User can trigger auto-complete suggestions 
for emoji by pressing `ESC` key, or trigger it automatically after enable it on preference panel. Also, input UTF8 emoji char directly from `Edit` -> `Emoji & Symbols` from menu bar is also supported.


## インライン数式

To use this feature, konoK
first, please enable it 
in `Preference` Panel -> `Markdown` Tab. Then use `$` to wrap TeX command, for example: `$\lim_{x \to \infty} \exp(-x) = 0$` will be rendered as LaTeX command.

これ \\(F(x) = \sum_{n=1}^{N} \frac{1}{N}\\)

To trigger inline preview for inline math: input “$”, then press `ESC` key, then input TeX command, a preview tooltip will be visible like below:

<img src="http://typora.io/img/inline-math.gif" style="zoom:50%;" />
