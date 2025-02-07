local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

local sonictemplate = function(callback_id, items, opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "sonictemplate",
    finder = finders.new_table {
      results = items
    },
    sorter = conf.generic_sorter(opts),

    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.fn['denops#callback#call'](callback_id, selection[1])
      end)
      return true
    end,
  }):find()
end

return {
  sonictemplate = sonictemplate,
}

