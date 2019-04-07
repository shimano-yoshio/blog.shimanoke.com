+++
title = "Details and summary"
author = ["Yoshio Shimano"]
date = 2019-04-03
lastmod = 2019-04-07T14:39:09+09:00
tags = ["Hugo", "ox-hugo"]
categories = ["Hugo", "ox-hugo"]
type = "post"
draft = false
thumbnail = "images/org-to-hugo.svg"
+++

<details>
<p class="details">Howt write "Details" and "Summary" in ox-hugo.
</p>
</details>

{{< codeblock caption="" >}}
```org
#+begin_details
#+begin_summary
This is aSummary.
#+end_summary
This is a detail.
#+end_details
```
{{< /codeblock>}}

<details>
<summary>
This is Summary.
</summary>
<p class="details">

This is a detail.
</p>
</details>
