+++
title = "ox-hugo に目次を作成させないようにする"
author = ["Yoshio Shimano"]
date = 2019-04-02
lastmod = 2019-04-03T21:25:47+09:00
tags = ["Hugo", "ox-hugo"]
categories = ["Hugo", "ox-hugo"]
type = "post"
draft = false
thumbnail = "images/org-to-hugo.svg"
+++

ox-hugo はデフォルトで目次を生成します。
それを止めるには、  `org-hugo-export-with-toc` を `nil` に設定します。
また、 `org-html-use-infojs` が `t` だと、 **常に** 目次が
出力されてしまうので、 `nil` に設定しておきます。

{{< codeblock caption="<a id=\"code-snippet--disable-ox-hugo-generated-toc\"></a><a href=\"#code-snippet--disable-ox-hugo-generated-toc\">ソースコード 1</a>: ox-hugo に目次を作成させないようにする" >}}
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
