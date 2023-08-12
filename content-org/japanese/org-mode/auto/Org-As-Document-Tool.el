(TeX-add-style-hook
 "Org-As-Document-Tool"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("jsbook" "a4j" "12pt" "openany" "uplatex" "dvipdfmx")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "jsbook"
    "jsbook12"
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
    "sec:orgc5ecff6"
    "sec:orgc5e82c0"
    "sec:orgc8b128c"
    "sec:orgde8a648"
    "sec:org42f7b09"
    "sec:org57e2fd4"
    "sec:org731ae03"
    "sec:orge81b9bf"
    "fig:network-diagram-w-blockdiag-1"
    "sec:org2a06530"
    "sec:org3b2651c"
    "sec:org1d54f5d"
    "sec:org7183907"
    "sec:org05cfc30"
    "sec:orgd1ba470"
    "sec:org87fd7b7"
    "sec:orgfd55f4a"
    "sec:orgeb662c9"
    "sec:org174b830"
    "sec:orgf678483"
    "sec:orgc9ec5ed"
    "sec:org4b8c273"
    "sec:org47f5f36"
    "sec:org240de17"
    "sec:org446cbf9"
    "sec:org3591550"
    "sec:org23375be"
    "sec:orgf91feca"
    "sec:org5668ae8"
    "sec:org2290dd6")
   (LaTeX-add-index-entries
    "blockdig"
    "\\LaTeX"
    "HTML"))
 :latex)

