-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  {
    'GustavEikaas/easy-dotnet.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      local function get_secret_path(secret_guid)
        local path = ''
        local home_dir = vim.fn.expand '~'
        if require('easy-dotnet.extensions').isWindows() then
          local secret_path = home_dir .. '\\AppData\\Roaming\\Microsoft\\UserSecrets\\' .. secret_guid .. '\\secrets.json'
          path = secret_path
        else
          local secret_path = home_dir .. '/.microsoft/usersecrets/' .. secret_guid .. '/secrets.json'
          path = secret_path
        end
        return path
      end

      local dotnet = require 'easy-dotnet'
      -- Options are not required
      dotnet.setup {
        --Optional function to return the path for the dotnet sdk (e.g C:/ProgramFiles/dotnet/sdk/8.0.0)
        get_sdk_path = get_sdk_path,
        ---@type TestRunnerOptions
        test_runner = {
          ---@type "split" | "float" | "buf"
          viewmode = 'split',
          noBuild = true,
          noRestore = true,
          icons = {
            passed = '',
            skipped = '',
            failed = '',
            success = '',
            reload = '',
            test = '',
            sln = '󰘐',
            project = '󰘐',
            dir = '',
            package = '',
          },
          mappings = {
            run_test_from_buffer = { lhs = '<leader>r', desc = 'run test from buffer' },
            filter_failed_tests = { lhs = '<leader>fe', desc = 'filter failed tests' },
            debug_test = { lhs = '<leader>d', desc = 'debug test' },
            go_to_file = { lhs = 'g', desc = 'got to file' },
            run_all = { lhs = '<leader>R', desc = 'run all tests' },
            run = { lhs = '<leader>r', desc = 'run test' },
            peek_stacktrace = { lhs = '<leader>p', desc = 'peek stacktrace of failed test' },
            expand = { lhs = 'o', desc = 'expand' },
            expand_all = { lhs = 'E', desc = 'expand all' },
            collapse_all = { lhs = 'W', desc = 'collapse all' },
            close = { lhs = 'q', desc = 'close testrunner' },
            refresh_testrunner = { lhs = '<C-t>', desc = 'refresh testrunner' },
          },
          --- Optional table of extra args e.g "--blame crash"
          additional_args = {},
        },
        ---@param action "test" | "restore" | "build" | "run"
        terminal = function(path, action)
          print(path)
          print(action)
          local commands = {
            run = function()
              return 'dotnet run --project ' .. path
            end,
            test = function()
              return 'dotnet test ' .. path
            end,
            restore = function()
              return 'dotnet restore ' .. path
            end,
            build = function()
              return 'dotnet build ' .. path
            end,
          }
          local command = commands[action]() .. '\r'
          vim.cmd 'vsplit'
          vim.cmd('term ' .. command)
        end,
        secrets = {
          path = get_secret_path,
        },
        csproj_mappings = true,
        auto_bootstrap_namespace = true,
      }

      -- Example command
      vim.api.nvim_create_user_command('Secrets', function()
        dotnet.secrets()
      end, {})

      -- Example keybinding
      vim.keymap.set('n', '<C-p>', function()
        dotnet.run_project()
      end)
    end,
  },
  {
    'seblj/roslyn.nvim',
    ft = 'cs',
    opts = {
      config = {
        settings = {
          ['csharp|inlay_hints'] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
          },
          ['csharp|completion'] = {
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_show_name_completion_suggestions = true,
          },
          ['csharp|code_lens'] = {
            dotnet_enable_tests_code_lens = true,
            dotnet_enable_references_code_lens = true,
          },
        },
      },
    },
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      settings = {
        publish_diagnostic_on = 'change',
        tsserver_file_preferences = {
          quotePreference = 'single',
          includeInlayParameterNameHints = 'all',
          includeCompletionsForImportStatements = true,
          includeCompletionsForModuleExports = true,
        },
        tsserver_format_options = {
          insertSpaceAfterCommaDelimiter = true,
          insertSpaceAfterSemicolonInForStatements = true,
          insertSpaceBeforeAndAfterBinaryOperators = true,
          insertSpaceAfterConstructor = true,
          insertSpaceAfterKeywordsInControlFlowStatements = true,
          insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
          insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
          insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
          insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
          insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
          insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
          insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = true,
          insertSpaceAfterTypeAssertion = true,
          insertSpaceBeforeFunctionParenthesis = false,
          placeOpenBraceOnNewLineForFunctions = true,
          placeOpenBraceOnNewLineForControlBlocks = true,
          insertSpaceBeforeTypeAnnotation = true,
          semicolons = 'insert',
          indentSize = 2,
          tabSize = 2,
          trimTrailingWhitespace = true,
        },
      },
    },
  },

  { 'mfussenegger/nvim-jdtls' },
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
        disabled_filetypes = { 'text' },
        disable_when_touch = false,
        touch_regex = '[%w(%[{]',
        pair_spaces = false,
        auto_indent = true,
        disable_command_mode = false,
      },
    },
  },
}
