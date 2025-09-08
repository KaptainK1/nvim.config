-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  --  {
  --    'GustavEikaas/easy-dotnet.nvim',
  --    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  --    config = function()
  --      local function get_secret_path(secret_guid)
  --        local path = ''
  --        local home_dir = vim.fn.expand '~'
  --        if require('easy-dotnet.extensions').isWindows() then
  --          local secret_path = home_dir .. '\\AppData\\Roaming\\Microsoft\\UserSecrets\\' .. secret_guid .. '\\secrets.json'
  --          path = secret_path
  --        else
  --          local secret_path = home_dir .. '/.microsoft/usersecrets/' .. secret_guid .. '/secrets.json'
  --          path = secret_path
  --        end
  --        return path
  --      end
  --
  --      local dotnet = require 'easy-dotnet'
  --      -- Options are not required
  --      dotnet.setup {
  --        --Optional function to return the path for the dotnet sdk (e.g C:/ProgramFiles/dotnet/sdk/8.0.0)
  --        get_sdk_path = get_sdk_path,
  --        ---@type TestRunnerOptions
  --        test_runner = {
  --          ---@type "split" | "float" | "buf"
  --          viewmode = 'split',
  --          noBuild = true,
  --          noRestore = true,
  --          icons = {
  --            passed = '',
  --            skipped = '',
  --            failed = '',
  --            success = '',
  --            reload = '',
  --            test = '',
  --            sln = '󰘐',
  --            project = '󰘐',
  --            dir = '',
  --            package = '',
  --          },
  --          mappings = {
  --            run_test_from_buffer = { lhs = '<leader>r', desc = 'run test from buffer' },
  --            filter_failed_tests = { lhs = '<leader>fe', desc = 'filter failed tests' },
  --            debug_test = { lhs = '<leader>d', desc = 'debug test' },
  --            go_to_file = { lhs = 'g', desc = 'got to file' },
  --            run_all = { lhs = '<leader>R', desc = 'run all tests' },
  --            run = { lhs = '<leader>r', desc = 'run test' },
  --            peek_stacktrace = { lhs = '<leader>p', desc = 'peek stacktrace of failed test' },
  --            expand = { lhs = 'o', desc = 'expand' },
  --            expand_all = { lhs = 'E', desc = 'expand all' },
  --            collapse_all = { lhs = 'W', desc = 'collapse all' },
  --            close = { lhs = 'q', desc = 'close testrunner' },
  --            refresh_testrunner = { lhs = '<C-t>', desc = 'refresh testrunner' },
  --          },
  --          --- Optional table of extra args e.g "--blame crash"
  --          additional_args = {},
  --        },
  --        ---@param action "test" | "restore" | "build" | "run"
  --        terminal = function(path, action)
  --          print(path)
  --          print(action)
  --          local commands = {
  --            run = function()
  --              return 'dotnet run --project ' .. path
  --            end,
  --            test = function()
  --              return 'dotnet test ' .. path
  --            end,
  --            restore = function()
  --              return 'dotnet restore ' .. path
  --            end,
  --            build = function()
  --              return 'dotnet build ' .. path
  --            end,
  --          }
  --          local command = commands[action]() .. '\r'
  --          vim.cmd 'vsplit'
  --          vim.cmd('term ' .. command)
  --        end,
  --        secrets = {
  --          path = get_secret_path,
  --        },
  --        csproj_mappings = true,
  --        auto_bootstrap_namespace = true,
  --      }
  --
  --      -- Example command
  --      vim.api.nvim_create_user_command('Secrets', function()
  --        dotnet.secrets()
  --      end, {})
  --
  --      -- Example keybinding
  --      -- vim.keymap.set('n', '<C-p>', function()
  --      --   dotnet.run_project()
  --      -- end)
  --    end,
  --  },
  {
    'seblj/roslyn.nvim',
    ft = 'cs',
    opts = {
      filewatching = 'auto',
      broad_search = false,
      lock_target = false,
    },
  },

  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      settings = {
        code_lens = 'off',
        tsserver_max_memory = 3072,
        separate_diagnostic_server = true,
        include_completions_with_insert_text = true,
        expose_as_code_action = { 'add_missing_imports', 'remove_unused', 'remove_unused_imports' },
        publish_diagnostic_on = 'insert_leave',
        tsserver_file_preferences = {
          quotePreference = 'single',
          includeInlayParameterNameHints = 'all',
          includeCompletionsForImportStatements = true,
          includeCompletionsForModuleExports = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayFunctionParamterTypeHints = true,
          importModuleSpecifierPreference = 'shortest',
          importModuleSpecifierEnding = 'auto',
          includePackageJsonAutoImports = 'auto',
          jsxAttributeCompletionStyle = 'auto',
          includeCompletionsWithClassMemberSnippets = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          allowRenameOfImportPath = true,
          displayPartsForJSDoc = true,
          includeAutomaticOptionalChainCompletions = true,
          generateReturnInDocTemplate = true,
        },
        tsserver_format_options = {
          insertSpaceAfterCommaDelimiter = true,
          insertSpaceAfterSemicolonInForStatements = true,
          insertSpaceBeforeAndAfterBinaryOperators = true,
          insertSpaceAfterConstructor = false,
          insertSpaceAfterKeywordsInControlFlowStatements = true,
          insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
          insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
          insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
          insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
          insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
          insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
          insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
          insertSpaceAfterTypeAssertion = false,
          insertSpaceBeforeFunctionParenthesis = false,
          placeOpenBraceOnNewLineForFunctions = false,
          placeOpenBraceOnNewLineForControlBlocks = false,
          insertSpaceBeforeTypeAnnotation = false,
          semicolons = 'ignore',
          indentSize = 2,
          tabSize = 2,
          trimTrailingWhitespace = true,
          convertTabsToSpaces = true,
        },
      },
    },
  },

  {
    'm4xshen/autoclose.nvim',
    config = {
      keys = {
        ['('] = { escape = false, close = true, pair = '()' },
        ['['] = { escape = false, close = true, pair = '[]' },
        ['{'] = { escape = false, close = true, pair = '{}' },

        ['>'] = { escape = true, close = false, pair = '<>' },
        [')'] = { escape = true, close = false, pair = '()' },
        [']'] = { escape = true, close = false, pair = '[]' },
        ['}'] = { escape = true, close = false, pair = '{}' },

        ['"'] = { escape = true, close = true, pair = '""' },
        ["'"] = { escape = true, close = true, pair = "''" },
        ['`'] = { escape = true, close = true, pair = '``' },
      },
      options = {
        disabled_filetypes = { 'text', 'markdown' },
        disable_when_touch = true,
        touch_regex = '[%w(%[{]',
        pair_spaces = false,
        auto_indent = true,
        disable_command_mode = true,
      },
    },
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()
      vim.keymap.set('n', '<leader>la', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<leader>ll', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', '<leader>lh', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<leader>lj', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<leader>lk', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<leader>l;', function()
        harpoon:list():select(4)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-B>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-N>', function()
        harpoon:list():next()
      end)
    end,
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    'KaptainK1/multirun.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      local multirun = require 'multirun'

      multirun.setup {
        auto_close_project_window = true,
      }

      vim.keymap.set('n', '<leader>mr', function()
        multirun.multirun()
      end, { desc = '[M]ultirun [R]un' })
      vim.keymap.set('n', '<leader>mp', function()
        multirun.multirun_previous()
      end, { desc = '[M]ultirun [P]revious' })
      vim.keymap.set('n', '<leader>mc', function()
        multirun.multirun_close_project_windows()
      end, { desc = '[M]ultirun [C]lose Window' })
      vim.keymap.set('n', '<leader>ms', function()
        multirun.multirun_stop_projects()
      end, { desc = '[M]ultirun [S]top Projects' })
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    opts = {},
  },
  -- {
  --   'https://github.com/esmuellert/nvim-eslint',
  --   config = function()
  --     require('nvim-eslint').setup {
  --       -- Toggle debug mode for ESLint language server, see debugging part
  --       debug = false,

  --       -- Command to launch language server. You might hardly want to change this setting
  --       cmd = M.create_cmd(),

  --       -- root_dir is used by Neovim LSP client API to determine if to attach or launch new LSP
  --       -- The default configuration uses the git root folder as the root_dir
  --       -- For monorepo it can have many projects, so launching too many LSP for one workspace is not efficient
  --       -- You can override it with passing function(bufnr)
  --       -- It should receive active buffer number and return root_dir
  --       root_dir = M.resolve_git_dir(args.buf),

  --       -- A table used to determine what filetypes trigger the start of LSP
  --       filetypes = { 'javascript', 'javascript.jsx', 'typescript', 'typescript.tsx' },

  --       -- The client capabilities for LSP Protocol. See Nvim LSP docs for details
  --       -- It uses the default Nvim LSP client capabilities. Adding the capability to dynamically change configs
  --       capabilities = M.make_client_capabilities(),

  --       handlers = {
  --         -- The handlers handles language server responses. See Nvim LSP docs for details
  --         -- The default handlers only has a rewrite of default "workspace/configuration" handler of Nvim LSP
  --         -- Basically, when you load a new buffer, ESLint LSP requests the settings with this request
  --         -- To make it work with monorepo, the workingDirectory setting needs to be calculated at runtime
  --         -- This is the main reaason for rewriting, and it also works if you have a simple structure repo
  --         -- You might add more custom handler with reference to LSP protocol spec and vscode-eslint code
  --       },

  --       -- The settings send to ESLint LSP. See below part for details.
  --       settings = {
  --         validate = 'on',
  --         -- packageManager = 'pnpm',
  --         useESLintClass = true,
  --         useFlatConfig = function(bufnr)
  --           return M.use_flat_config(bufnr)
  --         end,
  --         experimental = { useFlatConfig = false },
  --         codeAction = {
  --           disableRuleComment = {
  --             enable = true,
  --             location = 'separateLine',
  --           },
  --           showDocumentation = {
  --             enable = true,
  --           },
  --         },
  --         codeActionOnSave = { mode = 'all' },
  --         format = false,
  --         quiet = false,
  --         onIgnoredFiles = 'off',
  --         options = {},
  --         rulesCustomizations = {},
  --         run = 'onType',
  --         problems = { shortenToSingleLine = false },
  --         nodePath = function(bufnr)
  --           return M.resolve_node_path()
  --         end,
  --         workingDirectory = { mode = 'location' },
  --         workspaceFolder = function(bufnr)
  --           local git_dir = M.resolve_git_dir(bufnr)
  --           print(vim.inspect(git_dir))
  --           return {
  --             uri = vim.uri_from_fname(git_dir),
  --             name = vim.fn.fnamemodify(git_dir, ':t'),
  --           }
  --         end,
  --       },
  --     }
  --   end,
  -- },
}
