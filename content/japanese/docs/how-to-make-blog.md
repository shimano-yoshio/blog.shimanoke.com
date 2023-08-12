+++
title = "このブログの作りかた"
author = ["Yoshio Shimano"]
description = "このブログの作成方法です。"
lastmod = 2019-04-02T10:46:59+09:00
tags = ["Hugo", "Github", "Disqus"]
type = "post"
draft = false
+++

<style>
  .ox-hugo-toc ul {
    list-style: none;
  }
</style>
<div class="ox-hugo-toc toc">
<div></div>

<div class="heading">&#30446;&#27425;</div>

- <span class="section-num">1</span> [この文書について](#この文書について)
    - <span class="section-num">1.1</span> [動作環境](#動作環境)
- <span class="section-num">2</span> [Hugo サイトの作成](#hugo-サイトの作成)
- <span class="section-num">3</span> [テーマのクローン](#テーマのクローン)
- <span class="section-num">4</span> [Github への登録](#github-への登録)
    - <span class="section-num">4.1</span> [Git レポジトリの初期化](#git-レポジトリの初期化)
    - <span class="section-num">4.2</span> [Github へのプッシュ](#github-へのプッシュ)
- <span class="section-num">5</span> [Netlify で新しいサイトを作成する](#netlify-で新しいサイトを作成する)
- <span class="section-num">6</span> [Netlify での確認](#netlify-での確認)
- <span class="section-num">7</span> [お名前.com でドメインを取得する](#お名前-dot-com-でドメインを取得する)
- <span class="section-num">8</span> [DNS 設定](#dns-設定)
    - <span class="section-num">8.1</span> [お名前.com 側の設定](#お名前-dot-com-側の設定)
    - <span class="section-num">8.2</span> [Netlify 側の設定](#netlify-側の設定)

</div>
<!--endtoc-->



## <span class="section-num">1</span> この文書について {#この文書について}


### <span class="section-num">1.1</span> 動作環境 {#動作環境}

{{< table class="w3-table-all w3-card-4" caption="<a id=\"table--tab:environment\"></a><a href=\"#table--tab:environment\">&#34920; 1</a>: 動作環境">}}
| OS       | Ubuntu 18.10 |
|----------|--------------|
| Hugo     | v0.55.0-DEV  |
| Emacs    | 25.22        |
| Org-mode | 9.2.2        |
{{< /table >}}


## <span class="section-num">2</span> Hugo サイトの作成 {#hugo-サイトの作成}

{{< codeblock caption="<a id=\"code-snippet--create-new-hugo-site\"></a><a href=\"#code-snippet--create-new-hugo-site\">ソースコード 1</a>: 新しい Hugo サイトの作成" >}}
```sh
hugo new site blog.shimanoke.com
```
{{< /codeblock>}}


## <span class="section-num">3</span> テーマのクローン {#テーマのクローン}


## <span class="section-num">4</span> Github への登録 {#github-への登録}

Github で `gfmyc.git` というレポジトリを作成し、
そこにこの Hugo プロジェクトをプッシュします


### <span class="section-num">4.1</span> Git レポジトリの初期化 {#git-レポジトリの初期化}

{{< codeblock caption="" >}}
```sh
git init
git add -A
git commit -m "Initial commit"
```
{{< /codeblock>}}


### <span class="section-num">4.2</span> Github へのプッシュ {#github-へのプッシュ}

{{< codeblock caption="" >}}
```sh
git remote add origin https://github.com/shimano-yoshio/gfmyc.git
git push -u origin master
```
{{< /codeblock>}}


## <span class="section-num">5</span> Netlify で新しいサイトを作成する {#netlify-で新しいサイトを作成する}


## <span class="section-num">6</span> Netlify での確認 {#netlify-での確認}

-   <https://quizzical-kirch-258bfa.netlify.com/ja/>


## <span class="section-num">7</span> お名前.com でドメインを取得する {#お名前-dot-com-でドメインを取得する}

-   shimanoke.com

を取得しました。


## <span class="section-num">8</span> DNS 設定 {#dns-設定}


### <span class="section-num">8.1</span> お名前.com 側の設定 {#お名前-dot-com-側の設定}


### <span class="section-num">8.2</span> Netlify 側の設定 {#netlify-側の設定}
