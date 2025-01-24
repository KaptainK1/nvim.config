local ls = require 'luasnip'

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require 'luasnip.util.events'
local ai = require 'luasnip.nodes.absolute_indexer'
local extras = require 'luasnip.extras'
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local conds = require 'luasnip.extras.expand_conditions'
local postfix = require('luasnip.extras.postfix').postfix
local types = require 'luasnip.util.types'
local parse = require('luasnip.util.parser').parse_snippet
local ms = ls.multi_snippet
local k = require('luasnip.nodes.key_indexer').new_key

ls.add_snippets('all', {

  ls.parser.parse_snippet({ trig = 'clg' }, '$1 is ${2|hard,easy,challenging|}'),
  s('trig', {
    i(1),
    t 'text',
    i(2),
    t 'text again',
    i(3),
    t 'stuff',
  }),
  s('ternary', {
    -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
    i(1, 'cond'),
    t ' ? ',
    i(2, 'then'),
    t ' : ',
    i(3, 'else'),
  }),
  -- position of the node, not the jump-index!!
  --s('trig1', { t 'first node', t 'second node', i(1, 'third node') }),
  --[5] = {
  -- [events.enter] = function(node, _event_args)
  -- print '2!'
  --end,
  --},
  s('trigger', {
    t { 'After expanding, the cursor is here ->' },
    i(1),
    t { '', 'After jumping forward once, cursor is here ->' },
    i(2),
    t { '', 'After jumping once more, the snippet is exited there ->' },
    i(0),
  }),

  --s('')
})
