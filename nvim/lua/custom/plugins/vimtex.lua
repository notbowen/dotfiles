return {
  {
    'lervag/vimtex',
    ft = { 'tex' },
    config = function()
      vim.g.vimtex_view_method = 'zathura' -- or 'sioyek', 'skim', etc.
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_syntax_conceal = {
        accents = 1,
        cites = 1,
        fancy = 1,
        greek = 1,
        math_bounds = 1,
        math_delimiters = 1,
        math_fracs = 1,
        math_super_sub = 1,
        math_symbols = 1,
        sections = 1,
        styles = 1,
      }
      vim.opt.conceallevel = 2
      vim.opt.concealcursor = 'nc'
    end,
  },
}
