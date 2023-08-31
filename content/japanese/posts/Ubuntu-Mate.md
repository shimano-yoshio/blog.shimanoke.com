+++
title = "Ubuntu Mate Tips"
author = ["島野 善雄"]
date = 2023-08-31
lastmod = 2023-08-31T11:18:54+09:00
tags = ["Ubuntu", """
  "Ubuntu
  """, """
  MATE"
  """]
categories = ["Ubuntu"]
type = "post"
draft = false
+++

<div class="ox-hugo-toc toc">

<div class="heading">&#30446;&#27425;</div>

- [<span class="org-todo todo TODO">TODO</span> peco を使って zsh でコマンド履歴を便利にする](#use-peco-in-zsh)
    - [参考文献](#参考文献)
    - [確認環境](#確認環境)
    - [peco のインストール](#peco-のインストール)
    - [Zsh で peco を使うための設定](#zsh-で-peco-を使うための設定)

</div>
<!--endtoc-->



## <span class="org-todo todo TODO">TODO</span> peco を使って zsh でコマンド履歴を便利にする {#use-peco-in-zsh}

私はシェルとして Zsh を使っています。
Zsh はコマンド補完がありますが、peco を使うと、
コマンドの履歴を便利に選択することができます。

-   [peco/peco: Simplistic interactive filtering tool](https://github.com/peco/peco)

下の図では `apt` とタイプした後に =Ctl-r" をタイプしています。
コマンド補完の候補が出てくるのがわかります。

ここでコマンドを選択するために Emacs のキーバインディングを
使うことができます。

{{< figure src="/ox-hugo/peco-samoke.png" caption="<span class=\"figure-number\">&#22259;1:  </span>peco を起動した情愛" >}}


### 参考文献 {#参考文献}

以下のサイトを参考にさせていただきました。

-   [peco/peco: Simplistic interactive filtering tool](https://github.com/peco/peco) : peco 本家
-   [Mac | zshとpecoでコマンド入力作業を快適に - わくわくBank](https://www.wakuwakubank.com/posts/862-mac-zsh-peco/) : zsh から
    peco を使う方法が詳しくのっています。


### 確認環境 {#確認環境}

確認した環境です。
私は Ubuntu MATE を使っていますが、Windows でも動くようです。

-   Host OS : Windows11 Pro
-   Guest OS : Ubuntu Mate 23.04 on VirtualBox


### peco のインストール {#peco-のインストール}

peco をインストールするには次のようにします:

```sh
sudo apt -y install peco
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 1:</span>
  peco の Ubuntu  へのインストール
</div>


### Zsh で peco を使うための設定 {#zsh-で-peco-を使うための設定}

`~/.zshrc` に以下を追加します。

```sh
# ---------------------------------------
# peco
# https://www.instagram.com/pecotecooo/?hl=en
# ---------------------------------------

# A function for command history (Ctl-r)
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen1
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# Setup cdr
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
fi

# cd history (Ctrl+f)
function peco-cdr () {
    local selected_dir="$(cdr -l | sed 's/^[0-9]\+ \+//' | peco --prompt="cdr >" --query "$LBUFFER")"
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N peco-cdr
bindkey '^f' peco-cdr
# ---------------------------------------
```
<div class="src-block-caption">
  <span class="src-block-number">ソースコード 2:</span>
  Zsh で peco を使うための設定
</div>
