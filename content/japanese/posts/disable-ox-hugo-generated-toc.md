+++
title = "ox-hugo に目次を作成させないようにする"
author = ["Yoshio Shimano"]
date = 2019-04-02
lastmod = 2019-04-02T12:47:21+09:00
tags = ["Hugo", "ox-hugo"]
categories = ["Hugo"]
type = "post"
draft = false
+++

ox-hugo はデフォルトで目次を生成します。
それを止めるには、  `org-hugo-export-with-toc` を `nil` に設定します。

{{< codeblock caption="<a id=\"code-snippet--disable-ox-hugo-generated-toc\"></a><a href=\"#code-snippet--disable-ox-hugo-generated-toc\">ソースコード 1</a>: ox-hugo に目次を作成させないようにする" >}}
```emacs-lisp
(setq org-hugo-export-with-toc t)
```
{{< /codeblock>}}
