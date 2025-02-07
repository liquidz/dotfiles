local sonictemplate = function(callback_id, items, opts)
  vim.ui.select(items, {prompt = "Select"}, function(choice)
    vim.fn['denops#callback#call'](callback_id, choice)
  end)
end

return {
  sonictemplate = sonictemplate,
}
