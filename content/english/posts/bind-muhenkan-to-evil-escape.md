+++
title = """
  Bind "muhenkan" key to evil-escape in Spacemacs
  """
author = ["島野 善雄"]
date = 2023-09-10T00:00:00+09:00
lastmod = 2023-09-09T10:55:46+09:00
tags = ["Emacs"]
categories = ["Ubuntu"]
type = "post"
draft = false
+++

In vim and hybrid editing styles in Spaecemacs,
you hit "ESC" key frequently
to escape to "normal mode".
But "ESC" keye is far away from the home row.

In a Japanse 106 keyboard, there some unused keys:

{{< figure src="/ox-hugo/japanese-keyboad.jpg" alt="Japanese 106 Keyboard" caption="<span class=\"figure-number\">&#22259;1:  </span>Japanese 106 Keyboard" width="50%" >}}

So bind "muhenkan" key (lett to the spacebar)
to =evil-escape" to espcape to normal mode.

Add this to your Emacs configuration:

```emacs-lisp
(define-key global-map (kbd "<muhenkan>") 'evil-escape)
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 1:</span>
  Bind "muhenkan" key to =evil-escape"
</div>

If you do not use a Japanese keybord,
please replace "&lt;muhenkan&gt;"
with the key you want to use.

That's all. Enjoy!
