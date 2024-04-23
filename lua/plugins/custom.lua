return {
  -- Plugins
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "ThePrimeagen/harpoon",
    keys = {
      {
        "<leader>H",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon File",
      },
    },
  },

  -- * adds harpoon to status line
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      local function is_full_path(path)
        return path:sub(1, 1) == "/"
      end

      local function get_full_path(root_dir, value)
        return root_dir .. "/" .. value
      end

      local function extract_filename(fullpath)
        local pattern = ".+/([^/]+)$"
        local filename = fullpath:match(pattern)
        return filename
      end

      local icons = require("lazyvim.config").icons
      return {
        sections = {
          lualine_c = {
            LazyVim.lualine.root_dir(),
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { LazyVim.lualine.pretty_path() },
            {
              function()
                local harpoon_icons = {
                  indicators = { "[1]", "[2]", "[3]", "[4]", "[5]" },
                  active = "[⚓]",
                }
                local harpoon = require("harpoon")
                local root_dir = vim.loop.cwd()
                local len = math.min(5, harpoon:list():length())
                local status_line = {}
                local current_file = vim.api.nvim_buf_get_name(0)
                for i = 1, len do
                  local entry = harpoon:list():get(i)
                  if not entry then
                    return
                  end
                  local full_path = nil
                  if is_full_path(entry.value) then
                    full_path = entry.value
                  else
                    full_path = get_full_path(root_dir, entry.value)
                  end

                  if full_path == current_file then
                    table.insert(status_line, harpoon_icons.active .. " " .. extract_filename(current_file))
                  else
                    table.insert(status_line, harpoon_icons.indicators[i] .. " " .. extract_filename(full_path))
                  end
                end
                return table.concat(status_line, " ")
              end,
            },
          },
        },
      }
    end,
  },

  -- Disables
  { "rcarriga/nvim-notify", enabled = false },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "nvim-treesitter/nvim-treesitter-context", enabled = false },
  -- override LazyVim
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin-frappe" } },
}
