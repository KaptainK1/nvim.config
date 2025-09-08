-- https://github.com/nvim-neo-tree/neo-tree.nvim
local function getTelescopeOpts(state, path)
  return {
    cwd = path,
    search_dirs = { path },
    attach_mappings = function(prompt_bufnr, map)
      local actions = require 'telescope.actions'
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local action_state = require 'telescope.actions.state'
        local selection = action_state.get_selected_entry()
        local filename = selection.filename
        if filename == nil then
          filename = selection[1]
        end
        -- any way to open the file without triggering auto-close event of neo-tree?
        require('neo-tree.sources.filesystem').navigate(state, state.path, filename)
      end)
      return true
    end,
  }
end

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '//', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    {
      '<leader>r',
      function()
        require('neo-tree.command').execute {
          toggle = true,
          source = 'buffers',
          position = 'left',
        }
      end,
      desc = 'Buffers (root dir)',
    },
    {
      '<leader>g',
      function()
        require('neo-tree.command').execute {
          toggle = true,
          source = 'git_status',
          position = 'left',
          action = 'show',
        }
      end,
      desc = 'git status',
    },
    {
      '<leader>e',
      function()
        require('neo-tree.command').execute {
          toggle = false,
          source = 'filesystem',
          position = 'left',
          action = 'focus',
        }
      end,
      desc = 'filesystem focus',
    },
    {
      '<leader>et',
      function()
        require('neo-tree.command').execute {
          toggle = true,
          source = 'filesystem',
          position = 'left',
          action = 'show',
        }
      end,
      desc = 'filesystem toggle',
    },
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = false,
      default_component_configs = {
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = 'NeoTreeFileName',
        },
        file_size = {
          enabled = true,
          width = 12, -- width of the column
          required_width = 64, -- min width of window required to show this column
        },
        type = {
          enabled = true,
          width = 10, -- width of the column
          required_width = 122, -- min width of window required to show this column
        },
        last_modified = {
          enabled = true,
          width = 20, -- width of the column
          required_width = 88, -- min width of window required to show this column
        },
        created = {
          enabled = true,
          width = 20, -- width of the column
          required_width = 110, -- min width of window required to show this column
        },
        symlink_target = {
          enabled = false,
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = true,
          hide_gitignored = true,
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        hijack_netrw_behavior = 'open_current',
      },
      buffers = {
        follow_current_file = {
          enable = true,
        },
      },
      window = {
        mappings = {
          ['//'] = 'close_window',
          ['tf'] = 'telescope_find',
          ['tg'] = 'telescope_grep',
        },
      },
      commands = {
        telescope_find = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          print(node)
          require('telescope.builtin').find_files(getTelescopeOpts(state, path))
        end,
        telescope_grep = function(state)
          local node = state.tree:get_node()
          --local parentNode = node:get_parent_id()
          local path = node:get_id()
          --if parentNode ~= nil then
          --  path = parentNode
          --end
          require('telescope.builtin').live_grep(getTelescopeOpts(state, path))
        end,
      },
    }
  end,
}
