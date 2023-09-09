+++
title = """
  "muhenkan" （無変換）キーを evil-escape に割り当てる(Spacemacs)
  """
author = ["島野 善雄"]
date = 2023-09-08T00:00:00+09:00
lastmod = 2023-09-09T10:55:09+09:00
tags = ["Emacs"]
categories = ["Ubuntu"]
type = "post"
draft = false
+++

Spacemacs の vim と hybrid の編集モードでは、
"ESC" キーを頻繁に叩きます。

しかし "ESC" キーはホームポジションからはるか遠くにあります。
そこで "ESC" を別のキーにヮリアテます。

日本語 106 キーボードでは、私が使っていない
キーがいくつかあります。

{{< figure src="/ox-hugo/japanese-keyboad.jpg" alt="日本語 106 キーボード" caption="<span class=\"figure-number\">&#22259;1:  </span>日本語 106 キーボード" width="50%" >}}

よって "muhenkan" （無変換）キー （スペースバーの左）を
=evil-escape" に割り当てます。
これで "muhenkan" キーを叩くことと "ESC" キーを
叩くことが同じになりまう

これを Emacs のコンフィギュレーションに追加してください:

```emacs-lisp
(define-key global-map (kbd "<muhenkan>") 'evil-escape)
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 1:</span>
  Bind "muhenkan" key to =evil-escape"
</div>

日本語 106 キーボードを使ったいない場合には、
"&lt;muhenkan&gt;" を別の使ったいないキーで置き換えてください。

以上です。 Emacs を楽しんでください!
