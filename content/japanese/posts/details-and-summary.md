+++
title = "Details と summary"
author = ["Yoshio Shimano"]
date = 2019-04-02
lastmod = 2019-04-02T13:27:20+09:00
tags = ["Hugo", "ox-hugo"]
categories = ["Hugo", "ox-hugo"]
type = "post"
draft = false
+++

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
