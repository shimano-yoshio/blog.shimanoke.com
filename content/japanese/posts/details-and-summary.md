+++
title = "Details と summary"
author = ["Yoshio Shimano"]
date = 2019-04-02
lastmod = 2019-04-03T14:18:52+09:00
tags = ["Hugo", "ox-hugo"]
categories = ["Hugo", "ox-hugo"]
type = "post"
draft = false
thumbnail = "images/org-to-hugo.svg"
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
