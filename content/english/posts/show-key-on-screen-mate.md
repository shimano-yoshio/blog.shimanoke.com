+++
title = "Show Keystrokes on your Screen (Ubuntu 23.04)"
author = ["Yoshio Shimano"]
date = 2023-09-03T00:00:00+09:00
lastmod = 2023-09-03T12:40:33+09:00
tags = ["Ubuntu", """
  "Ubuntu
  """, """
  MATE"
  """]
categories = ["Ubuntu"]
type = "post"
draft = true
+++

<div class="ox-hugo-toc toc has-section-numbers">

<div class="heading">Table of Contents</div>

- <span class="section-num">1</span> [Environment](#environment)
- <span class="section-num">2</span> [Installl screenkey:](#installl-screenkey)
- <span class="section-num">3</span> [Start Screnkye](#start-screnkye)

</div>
<!--endtoc-->

Sometimes you may want to show your keystoroke on the screen,
for example, during a presentation.

For this, I use [screenkey](https://www.thregr.org/wavexx/software/screenkey/).

-   [Screencast your keys.](https://www.thregr.org/wavexx/software/screenkey/)

In this article, I'll show you how to install/use Screenkye.


## <span class="section-num">1</span> Environment {#environment}

-   OS: Ubuntu Mate 23.04 on VirtualBox] on Windows 11.


## <span class="section-num">2</span> Installl screenkey: {#installl-screenkey}

To install Screenky on Ubuntu, type this in your terminal:

```sh
sudo apt -y install screenkey
```
<div class="src-block-caption">
  <span class="src-block-number">Code Snippet 1:</span>
  Install Screenkye
</div>


## <span class="section-num">3</span> Start Screnkye {#start-screnkye}

Then start screenkey from your terminal:

```sh
screenkey
```
<div class="src-block-caption">
  <span class="src-block-number">Code Snippet 2:</span>
  Start Screenkey
</div>

After that, screenkey's menu apeears
on the main menu.

{{< figure src="/ox-hugo/screenshot-menu.png" alt="Screenkye Icon on Main Menu" caption="<span class=\"figure-number\">Figure 1: </span>Screenkye Icon on Main Menu" width="50%" >}}

Select "Preferences", and set diaplay duration etc.

{{< figure src="/ox-hugo/screenky-prefs.png" alt="Screenkye Prefs" caption="<span class=\"figure-number\">Figure 2: </span>Screenkye Prefs." width="50%" >}}

...and you can see keystorokes are shown on the screen:

{{< figure src="/ox-hugo/screenkye.gif" caption="<span class=\"figure-number\">Figure 3: </span>Screenkey in Action" width="50%" >}}
