+++
title = "Emacs Tips"
author = ["島野 善雄"]
date = 2023-08-31T00:00:00+09:00
lastmod = 2023-09-09T11:39:23+09:00
tags = ["Emacs"]
categories = ["Ubuntu"]
type = "post"
draft = false
+++

<div class="ox-hugo-toc toc">

<div class="heading">&#30446;&#27425;</div>

- [Emacs Tips](#emacs-tips)
    - [Bind "muhenkan" key to `evil-escape` in Spacemacs](#bind-muhenkan-to-evil-escape)
    - [<span class="org-todo todo TODO">TODO</span> Bind "Henkan" key to set shift key in Emacs](#bind-henkan-key-to-set-shift-key-in-emacs)

</div>
<!--endtoc-->



## Emacs Tips {#emacs-tips}


### Bind "muhenkan" key to `evil-escape` in Spacemacs {#bind-muhenkan-to-evil-escape}

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


### <span class="org-todo todo TODO">TODO</span> Bind "Henkan" key to set shift key in Emacs {#bind-henkan-key-to-set-shift-key-in-emacs}

This means that if you hit "Henkan" key, then hit "s",
then you get "T".

For example:

-   `Henkan t` → T

This is for Japanese 106 only.

To bind "Henkan" to enter "Shit",
Write this in you Emacs configuration.
Replace `'henkan` to the key you want to use:

```emacs-lisp
(let ((i ?a))
  (while (<= i ?z)
    (define-key key-translation-map
      (vector 'henkan i) (vector (- i 32)))
    (setq i (1+ i))))
(setq x-meta-keysym 'meta)
(setq x-super-keysym 'meta)
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 2:</span>
  "Henkan" key to set shift key
</div>

That's all.

Enjoy!

```emacs-lisp
(let ((i ?a))
  (while (<= i ?z)
    (define-key key-translation-map
      (vector 'muhenkan i) (vector (- i 32)))
    (setq i (1+ i))))
(setq x-meta-keysym 'meta)
(setq x-super-keysym 'meta)
```
