(TeX-add-style-hook
 "hugo"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("jsbook" "dvipdfmx" "a4j" "14pt" "uplatex" "openany")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "jsbook"
    "jsbook10"
    "inputenc"
    "fontenc"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref"
    "coco-jsbook")
   (LaTeX-add-labels
    "sec:orgcfdd19e"
    "sec:org757c626"
    "sec:orgbfd9aef"
    "sec:org82b8f56"
    "sec:org36a47fd"
    "sec:org6cbd80c"
    "sec:orgc1b71ea"
    "sec:orgd2ae0ab"
    "sec:org1d626ef"
    "sec:orge96a5d2"
    "fig:first"
    "sec:org76ed477"
    "sec:org51cf58a"
    "sec:org2f4c1d0"
    "eq:0"
    "eq:1"
    "sec:orge91f4d9"
    "sec:org6b304f1"
    "tab:test1"
    "sec:orgd3ee530"
    "sec:orgb1fc4bd"
    "sec:org496560b"
    "sec:org5e79dba"
    "sec:orga22217d"
    "sec:orgbdff6cf"
    "sec:org40f1366"
    "sec:orgb093244")
   (LaTeX-add-index-entries
    "table"))
 :latex)

