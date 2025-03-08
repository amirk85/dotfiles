local state = {
  floating = {
    buf = nil,
    win = nil,
  },
}

local function create_floating_window(opts)
  opts = opts or {}
  -- Calculate dimensions: default to 80% of the screen
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  -- Calculate position to center the window
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create or reuse a scratch buffer
  local buf = nil
  if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  -- Open the floating window with a rounded border
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = "rounded",
  })

  -- Return the new state
  return { buf = buf, win = win }
end

local toggle_terminal = function()
  if state.floating.win and vim.api.nvim_win_is_valid(state.floating.win) then
    vim.api.nvim_win_hide(state.floating.win)
    state.floating.win = nil -- Reset window state when hidden
  else
    state.floating = create_floating_window({ buf = state.floating.buf })
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end

    vim.cmd("startinsert") -- Automatically enter insert mode
  end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})

-- vim.keymap.set({ "n", "t" }, "<leader><s-t>", toggle_terminal)
vim.keymap.set({ "n", "t" }, "<leader>jj", toggle_terminal)

return {} -- lazyvim expects a table return from plugins
