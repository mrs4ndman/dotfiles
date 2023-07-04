-- -- LSP Explicit config
local navic = require("nvim-navic")
-- First, Native LSP
local lspconfig = require("lspconfig")
require("lspconfig").lua_ls.setup({
	on_attach = function(client, bufnr)
		navic.attach(client, bufnr)
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
require("lspconfig").rust_analyzer.setup({
	on_attach = function(client, bufnr)
		navic.attach(client, bufnr)
	end,
})
lspconfig.pylsp.setup({})
lspconfig.vimls.setup({})
lspconfig.marksman.setup({})
lspconfig.clangd.setup({})
lspconfig.neocmake.setup({})
-- lspconfig.html.setup {}
lspconfig.emmet_ls.setup({})
lspconfig.cssls.setup({})
lspconfig.eslint.setup({})
lspconfig.tsserver.setup({})
lspconfig.bashls.setup({})
lspconfig.ansiblels.setup({})
lspconfig.yamlls.setup({})
lspconfig.ruby_ls.setup({})
-- lspconfig.lua_ls.setup {}
-- lspconfig.jdtls.setup {}
--
-- LSP Attach keybinds
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efinition" })
		vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { desc = "[G]o to [T]ype definition" })
		vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "[G]o to [I]mplementation" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover help" })
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, { desc = "Workspace Symbol" })
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "Diagnostic Float on current word" })
		vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
		vim.keymap.set("n", "d]", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
		vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, { desc = "View code action" })
		vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, { desc = "Show Variable References" })
		vim.keymap.set({ "n", "v" }, "<leader>vrn", vim.lsp.buf.rename, { desc = "Rename variable with LSP" })
		vim.keymap.set("n", "<leader>ff", function()
			vim.lsp.buf.format({ async = true })
		end, { desc = "Format current buffer / file" })
		vim.keymap.set("i", "<C-q>", vim.lsp.buf.signature_help, { desc = "Quickhelp on word" })

		vim.api.nvim_create_autocmd("CursorHold", {
			buffer = bufnr,
			callback = function()
				local opts = {
					focusable = false,
					close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
					border = "rounded",
					source = "always",
					prefix = " ",
					scope = "cursor",
				}
				vim.diagnostic.open_float(nil, opts)
			end,
		})
		-- if client.server_capabilities.inlayHintProvider then
		--     vim.lsp.buf.inlay_hint(bufnr, true)
		-- end
		-- if client.resolved_capabilities.document_highlight then
		--     vim.cmd [[
		--     hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
		--     hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
		--     hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
		--     ]]
		--     vim.api.nvim_create_augroup('lsp_document_highlight', {
		--         clear = false
		--     })
		--     vim.api.nvim_clear_autocmds({
		--         buffer = bufnr,
		--         group = 'lsp_document_highlight',
		--     })
		--     vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
		--         group = 'lsp_document_highlight',
		--         buffer = bufnr,
		--         callback = vim.lsp.buf.document_highlight,
		--     })
		--     vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
		--         group = 'lsp_document_highlight',
		--         buffer = bufnr,
		--         callback = vim.lsp.buf.clear_references,
		--     })
		-- end
	end,
})

-- Change here the left sidebar LSP icon config for:
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
