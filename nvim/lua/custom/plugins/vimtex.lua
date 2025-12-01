return {
  {
    'lervag/vimtex',
    ft = { 'tex' },
    config = function()
      -- vim.g.vimtex_view_method = 'general' -- or 'sioyek', 'skim', etc.
      vim.g.vimtex_view_method = 'general'
      vim.g.vimtex_view_general_viewer = 'zathura'
      vim.g.vimtex_view_general_options = '--synctex-forward @line:@col:@tex @pdf'
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_compiler_latexmk = {
        build_dir = '',
        callback = 1,
        continuous = 1,
        executable = 'latexmk',
        options = {
          '-shell-escape',
          '-verbose',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode',
        },
      }
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

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'tex',
        callback = function()
          vim.bo.expandtab = true
          vim.bo.shiftwidth = 2
          vim.bo.softtabstop = 2
          vim.bo.tabstop = 2
        end,
      })
    end,
  },
}
