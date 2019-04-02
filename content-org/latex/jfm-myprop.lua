luatexja.jfont.define_jfm {
   dir = 'yoko',
   zw = 1.0, zh = 1.0,
   [0] = { -- 他の全ての文字は元来の字幅を保持
      align = 'left', left = 0.0, down = 0.0,
      width = 'prop', height = 0.88, depth = 0.12, italic = 0.0,
   },
   [1] = { -- <（>は左の空きを削って半角幅
      chars = {'（'},
      -- 0.5zwの幅に右揃えでグリフを配置
      align = 'right', left = 0.0, down = 0.0,
      width = 0.5, height = 0.88, depth = 0.12, italic = 0.0,
   },
   [2] = { -- <）>は右の空きを削って半角幅
      chars = {'）'},
      -- 0.5zwの幅に左揃えでグリフを配置
      align = 'left', left = 0.0, down = 0.0,
      width = 0.5, height = 0.88, depth = 0.12, italic = 0.0,
   },
   [3] = { -- <、>も半角幅だが右側に若干伸縮空きを入れる
      chars = {'、'},
      align = 'left', left = 0.0, down = 0.0,
      width = 0.5, height = 0.88, depth = 0.12, italic = 0.0,
      glue = {
         [0] = { 0.2, 0.0, 0.2 }, -- 直後が"その他"か<（>の場合
         [1] = { 0.2, 0.0, 0.2 }, -- 0.2zw plus 0.0zw minus 0.2zw
      }                           -- を挿入する
   },
   [4] = { -- <。>も半角幅だが右側に若干伸縮空きを入れる
      chars = {'。'},
      align = 'left', left = 0.0, down = 0.0,
      width = 0.5, height = 0.88, depth = 0.12, italic = 0.0,
      glue = {
         [0] = { 0.2, 0.1, 0.0 },
         [1] = { 0.2, 0.1, 0.0 },
      }
   },
   [4] = { -- <「（>は左の空きを削って半角幅
     chars = {'「'},
     -- 0.8 zwの幅に右揃えでグリフを配置
     align = 'right', left = 0.0, down = 0.0,
     width = 0.8, height = 0.88, depth = 0.12, italic = 0.0,
   },
   [2] = { -- <」>は右の空きを削って半角幅
     chars = {'」'},
     -- 0.8 zwの幅に左揃えでグリフを配置
     align = 'left', left = 0.0, down = 0.0,
     width = 0.8, height = 0.88, depth = 0.12, italic = 0.0,
   },

}
