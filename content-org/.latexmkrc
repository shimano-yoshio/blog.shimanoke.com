# LaTeX コマンドの設定
$latex  = 'uplatex -src-specials -shell-escape -synctex=1 -interaction=nonstopmode';

# BibTeX コンパイラ
$bibtex = 'upbibtex';
# $bibtex = 'biber';

# pdf 作成
$dvipdf  = 'dvipdfmx %O -o %D %S';

# 索引作成
# $makeindex  = 'upmendex  -c -g -d main.dict -s dot.ist';
$makeindex  = 'upmendex -d main.dict -s dot.ist %O -o  %D %S';

# PDF のプレビュー
$pdf_previewer = 'xdg-open %O %S';

# 最大の繰り返し回数
$max_repeat       = 5;

# 0：pdf化しない場合
# 1：pdflatexを使う場合
# 2：ps2pdfを使う場合
# 3：dviファイルからpdfを作成する場合
$pdf_mode = 3;

$pdf_update_method = 0;
