require("typescript").setup({
  disable_commands = false,
  debug = false,
  go_to_source_definition = {
    fallback = true,
  },
  -- TODO: Figure out this stuff
  -- server = {
  --     on_attach = ...,
  -- }
})
