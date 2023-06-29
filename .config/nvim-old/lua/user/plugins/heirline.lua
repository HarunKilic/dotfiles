return {
  "heirline.nvim",
  opts = function(_, opts)
    local status = require "astronvim.utils.status"
    opts.statusline[9] = status.component.lsp { lsp_progress = false }
    opts.statusline = {
      hl = { fg = "fg", bg = "bg" },
      status.component.git_branch(),
      status.component.diagnostics { padding = { left = 0 } },
      status.component.file_info {
        file_icon = { padding = { left = 0 } },
        filename = false,
        padding = { left = 0 },
      },
      status.component.separated_path {
        padding = { left = 0 },
        path_func = status.provider.filename { modify = ":.:h" },
      },
      status.component.file_info {
        file_icon = false,
        file_modified = false,
        padding = { left = 0 },
      },
      status.component.breadcrumbs {
        icon = { hl = true },
        prefix = false,
        padding = { left = 0 },
      },
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.git_diff {
        padding = { right = 0 },
      },
      status.component.nav {
        padding = {
          left = 0,
          right = 0,
        },
        surround = {
          separator = "right",
        },
      },
    }
    opts.tabline[2] = status.heirline.make_buflist(status.component.tabline_file_info { close_button = false })
    opts.winbar = nil
  end,
}
