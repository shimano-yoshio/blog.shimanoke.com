+++
title = "Spacemacs を初めて起動する"
author = ["島野 善雄"]
date = 2023-09-09T00:00:00+09:00
lastmod = 2023-09-10T12:38:33+09:00
tags = ["Emacs"]
categories = ["Ubuntu"]
type = "post"
draft = false
+++

<div class="ox-hugo-toc toc has-section-numbers">

<div class="heading">&#30446;&#27425;</div>

- <span class="section-num">1</span> [Spacemacs の起動](#spacemacs-の起動)
- <span class="section-num">2</span> [編集モードの選択](#編集モードの選択)
- <span class="section-num">3</span> [ディストリビューションの選択肢](#ディストリビューションの選択肢)
- <span class="section-num">4</span> [パッケージのインストール （自動）](#パッケージのインストール-自動)
- <span class="section-num">5</span> [Spacemacs の終了のしかた](#spacemacs-の終了のしかた)
- <span class="section-num">6</span> [次は](#次は)

</div>
<!--endtoc-->

ここでは Spacemacs を初めて起動する
方法を説明します。

Emacs と Spacemacs のインストールが
おわっていない場合には、
「[Ubuntu MATE で複数の Emacs ディストリビューションを動かす •](https://blog.shimanoke.com/ja/posts/install-emacs-on-ubuntu/)」を
参考にしてインストールしておいてください。


## <span class="section-num">1</span> Spacemacs の起動 {#spacemacs-の起動}

「[Ubuntu MATE で複数の Emacs ディストリビューションを動かす •](https://blog.shimanoke.com/ja/posts/install-emacs-on-ubuntu/)」を
使って Spacemacs を設定している場合は
次のコマンドで Spacemacs を起動することができます

```text
emacs --with-profile spacemacs
```

または

```text
emacs
```

で起動します。


## <span class="section-num">2</span> 編集モードの選択 {#編集モードの選択}

Spacemacs を最初に立ち上げると、
編集モードを何にするかと質問されます。
編集喪には "vim", "hybrid", "emacs" の
3 種類があります。それぞれの特徴は次のとおりです。

vim
: Vil/Vim ユーザーであれば、これを選択するとよいでしょう。

emacs
: Emacs ユーザーで、Vim のキーバインディングを使いたくないかたは
    これを選択してください。お勧めはしません。

hybrid
: 最初は選択できません。
    Emacs ユーザーであればこれを選択すると良いかもしれません。
    Vim のキーバインディングに加えて、Emacs のキーバインディングも
    使ううことができます。私はこれを使っています。

ここでは "vim" を選択します。
"h" と入力して "Return" を押します。

{{< figure src="/ox-hugo/spacemacs-ask-edit-mode.png" alt="Spacemacs の編集モードの選択" caption="<span class=\"figure-number\">&#22259;1:  </span>Spacemacs の編集モードの選択" width="100%" >}}


## <span class="section-num">3</span> ディストリビューションの選択肢 {#ディストリビューションの選択肢}

次に、どのディストリビューションを使うかが
質問されます。
矢印キーを使って、 "spacemacs" を選択してください。

{{< figure src="/ox-hugo/spacemacs-akk-didt.png" alt="ディストリビューションの選択" caption="<span class=\"figure-number\">&#22259;2:  </span>ディストリビューションの選択" width="100%" >}}


## <span class="section-num">4</span> パッケージのインストール （自動） {#パッケージのインストール-自動}

ディストリビューションの選択肢が終了したらあ、
自動的に必要な Emacs のパッケージがインストールされます。
しばらくお待ちください。

パッケージのインストールが終わると
次のような画面になります

{{< figure src="/ox-hugo/spacemacs-strt-screen.png" alt="Spacemacs の最初の起動" width="70%" >}}


## <span class="section-num">5</span> Spacemacs の終了のしかた {#spacemacs-の終了のしかた}

Spacemacs を終了するには次をうちます。

```text
=space q q=
```

`space q` とタイプしたら
Spacemacs の終了メニューが出るので、
"q" を押して終了します。

{{< figure src="/ox-hugo/spaceemacs-quit-menu.png" alt="Spacemacs の終了メニュー" caption="<span class=\"figure-number\">&#22259;4:  </span>Spacemacs の終了メニュー" width="70%" >}}

または編集モードが hybrid か emacs のかたは
`Ctl-+x Ctl+c` が使えます。


## <span class="section-num">6</span> 次は {#次は}

次の記事では、Spacemacs のカスタマイズに
ついて説明します。
