-- require("lspconfig").eslint.setup({})
-- require("lspconfig").tsserver.setup({})

-- TYPESCRIPT
-- local ok, tst = pcall(require, "typescript-tools")

-- if not ok then
--     return
-- end

-- tst.setup ({
--     settings = {
--         separate_diagnostic_server = true,
--         publish_diagnostic_on = "insert_leave",
--         preferences = {
--             includeInlayParameterNameHints = "all",
--             includeInlayParameterNameHintsWhenArgumentMatchesName = false,
--             includeInlayFunctionParameterTypeHints = true,
--             includeInlayVariableTypeHints = false,
--             includeInlayVariableTypeHintsWhenTypeMatchesName = false,
--             includeInlayPropertyDeclarationTypeHints = true,
--             includeInlayFunctionLikeReturnTypeHints = true,
--             includeInlayEnumMemberValueHints = true,
--         }
--     },
-- })
