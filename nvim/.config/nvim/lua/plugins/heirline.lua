Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

-- local function vim_icon()
--     return ''
-- end

local plugin = "heirline.nvim"

return {
	"rebelot/" .. plugin,
	enabled = Is_Enabled(plugin),
	event = "VimEnter",
	config = function()
		local conditions = require("heirline.conditions")
		local utils = require("heirline.utils")
		local colors = {
			diag_error = "#FF0000",
			diag_warn = "#ECBE7B",
			diag_hint = "#00CCCC",
			diag_info = "#c678dd",
			git_del = "#FF0000",
			git_add = "#ECBE7B",
			git_change = "#FF8800",
			-- bright_bg = utils.get_highlight("Folded").bg,
			-- bright_fg = utils.get_highlight("Folded").fg,
			yellow = "#ECBE7B",
			cyan = "#008080",
			pink = "#FF00FF",
			darkblue = "#0037AA",
			turquoise = "#00CCCC",
			green = "#98be65",
			lime = "#00CC00",
			orange = "#FF8800",
			sorange = "#FF6600",
			violet = "#a9a1e1",
			magenta = "#c678dd",
			blue = "#51afef",
			red = "#FF0000",
			purple = "#c678dd",
			ultraviolet = "#CC0099",
		}
		-- Custom elements
		local ViMode = {
			-- get vim current mode, this information will be required by the provider
			-- and the highlight functions, so we compute it only once per component
			-- evaluation and store it as a component attribute
			init = function(self)
				self.mode = vim.fn.mode(1) -- :h mode()
			end,
			-- Now we define some dictionaries to map the output of mode() to the
			-- corresponding string and color. We can put these into `static` to compute
			-- them at initialisation time.
			static = {
				mode_names = { -- change the strings if you like it vvvvverbose!
					n = "N",
					no = "N?",
					nov = "N?",
					noV = "N?",
					["no\22"] = "N?",
					niI = "Ni",
					niR = "Nr",
					niV = "Nv",
					nt = "Nt",
					v = "V",
					vs = "Vs",
					V = "V_",
					Vs = "Vs",
					["\22"] = "^V",
					["\22s"] = "^V",
					s = "S",
					S = "S_",
					["\19"] = "^S",
					i = "I",
					ic = "Ic",
					ix = "Ix",
					R = "R",
					Rc = "Rc",
					Rx = "Rx",
					Rv = "Rv",
					Rvc = "Rv",
					Rvx = "Rv",
					c = "C",
					cv = "Ex",
					r = "...",
					rm = "M",
					["r?"] = "?",
					["!"] = "!",
					t = "T",
				},
				mode_colors = {
					n = "red",
					i = "green",
					v = "cyan",
					V = "cyan",
					["\22"] = "cyan",
					c = "orange",
					s = "purple",
					S = "purple",
					["\19"] = "purple",
					R = "orange",
					r = "orange",
					["!"] = "red",
					t = "red",
				},
			},
			-- We can now access the value of mode() that, by now, would have been
			-- computed by `init()` and use it to index our strings dictionary.
			-- note how `static` fields become just regular attributes once the
			-- component is instantiated.
			-- To be extra meticulous, we can also add some vim statusline syntax to
			-- control the padding and make sure our string is always at least 2
			-- characters long. Plus a nice Icon.
			provider = function(self)
				return " %2(" .. self.mode_names[self.mode] .. "%)"
			end,
			-- Same goes for the highlight. Now the foreground will change according to the current mode.
			hl = function(self)
				local mode = self.mode:sub(1, 1) -- get only the first mode character
				return { fg = self.mode_colors[mode], bold = true }
			end,
			-- Re-evaluate the component only on ModeChanged event!
			-- Also allows the statusline to be re-evaluated when entering operator-pending mode
			update = {
				"ModeChanged",
				pattern = "*:*",
				callback = vim.schedule_wrap(function()
					vim.cmd("redrawstatus")
				end),
			},
		}
		-- FILENAME MODULE START
		local FileNameBlock = {
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(0)
			end,
		}
		local FileIcon = {
			init = function(self)
				local filename = self.filename
				local extension = vim.fn.fnamemodify(filename, ":e")
				self.icon, self.icon_color =
					require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
			end,
			provider = function(self)
				return self.icon and (self.icon .. " ")
			end,
			hl = function(self)
				return { fg = self.icon_color }
			end,
		}

		local FileName = {
			provider = function(self)
				local filename = vim.fn.fnamemodify(self.filename, ":.")
				if filename == "" then
					return "[No Name]"
				end

				if not conditions.width_percent_below(#filename, 0.25) then
					filename = vim.fn.pathshorten(filename)
				end
				return filename
			end,
			hl = { fg = "red" },
		}

		local FileFlags = {
			{
				condition = function()
					return vim.bo.modified
				end,
				provider = "●",
				hl = { fg = "green" },
			},
			{
				condition = function()
					return not vim.bo.modifiable or vim.bo.readonly
				end,
				provider = "",
				hl = { fg = "orange" },
			},
		}

		local FileNameModifier = {
			hl = function()
				if vim.bo.modified then
					return { fg = "cyan", bold = true, force = true }
				end
			end,
		}

		FileNameBlock = utils.insert(
			FileNameBlock,
			FileIcon,
			utils.insert(FileNameModifier, FileName),
			FileFlags,
			{ provider = "%<" }
		)

		-- FILETYPE, FILE ENCODING AND FILE FORMAT
		local FileType = {
			provider = function()
				return string.upper(vim.bo.filetype)
			end,
			hl = { fg = "cyan", bold = true },
		}

		local FileEncoding = {
			provider = function()
				local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
				return enc ~= "utf-8" and enc:upper()
			end,
		}

		local FileFormat = {
			provider = function()
				local fmt = vim.bo.fileformat
				return fmt ~= "unix" and fmt:upper()
			end,
		}

		local FileSize = {
			provider = function()
				local suffix = { "b", "k", "M", "G", "T", "P", "E" }
				local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
				fsize = (fsize < 0 and 0) or fsize
				if fsize < 1024 then
					return fsize .. suffix[1]
				end
				local i = math.floor((math.log(fsize) / math.log(1024)))
				return string.format("%.2g%s", fsize / (1024 ^ i), suffix[i + 1])
			end,
		}

		local FileLastModified = {
			provider = function()
				local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
				return (ftime > 0) and os.date("%c", ftime)
			end,
		}

		local TerminalName = {
			provider = function()
				local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
				return " " .. tname
			end,
			hl = { fg = "blue", bold = true },
		}

		-- CURSOR POSITION: RULER AND SCROLLBAR
		local Ruler = {
			provider = "%7(%l/%3L) - %2c%% %P", -- TODO: This might not work
			hl = { fg = "lime" },
		}

		local ScrollBar = {
			static = {
				sbar = { "🭶", "🭷", "🭸", "🭹", "🭺", "🭻" },
			},
			provider = function(self)
				local curr_line = vim.api.nvim_win_get_cursor(0)[1]
				local lines = vim.api.nvim_buf_line_count(0)
				local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
				return string.rep(self.sbar[i], 2)
			end,
			hl = { fg = "blue", bg = "bright_bg" },
		}

		-- LSP STATUS
		local LSPActive = {
			condition = conditions.lsp_attached,
			update = { "LspAttach", "LspDetach" },
			provider = function()
				local names = {}
				for i, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
					table.insert(names, server.name)
				end
				return " [" .. table.concat(names, " ") .. "]"
			end,
			hl = { fg = "cyan", bold = true },
		}

		local Navic = {
			condition = function()
				return require("nvim-navic").is_available()
			end,
			static = {
				type_hl = {
					File = "Directory",
					Module = "@include",
					Namespace = "@namespace",
					Package = "@include",
					Class = "@structure",
					Method = "@method",
					Property = "@property",
					Field = "@field",
					Constructor = "@constructor",
					Enum = "@field",
					Interface = "@type",
					Function = "@function",
					Variable = "@variable",
					Constant = "@constant",
					String = "@string",
					Number = "@number",
					Boolean = "@boolean",
					Array = "@field",
					Object = "@type",
					Key = "@keyword",
					Null = "@comment",
					EnumMember = "@field",
					Struct = "@structure",
					Event = "@keyword",
					Operator = "@operator",
					TypeParameter = "@type",
				},
				enc = function(line, col, winnr)
					return bit.bor(bit.lshift(line, 16), bit.lshift(col, 6), winnr)
				end,
				dec = function(c)
					local line = bit.rshift(c, 16)
					local col = bit.band(bit.rshift(c, 6), 1023)
					local winnr = bit.band(c, 63)
					return line, col, winnr
				end,
			},
			init = function(self)
				local data = require("nvim-navic").get_data() or {}
				local children = {}
				-- create a child for each level
				for i, d in ipairs(data) do
					-- encode line and column numbers into a single integer
					local pos = self.enc(d.scope.start.line, d.scope.start.character, self.winnr)
					local child = {
						{
							provider = d.icon,
							hl = self.type_hl[d.type],
						},
						{
							-- escape `%`s (elixir) and buggy default separators
							provider = d.name:gsub("%%", "%%%%"):gsub("%s*->%s*", ""),
							-- highlight icon only or location name as well
							-- hl = self.type_hl[d.type],

							on_click = {
								-- pass the encoded position through minwid
								minwid = pos,
								callback = function(_, minwid)
									-- decode
									local line, col, winnr = self.dec(minwid)
									vim.api.nvim_win_set_cursor(vim.fn.win_getid(winnr), { line, col })
								end,
								name = "heirline_navic",
							},
						},
					}
					-- add a separator only if needed
					if #data > 1 and i < #data then
						table.insert(child, {
							provider = " > ",
							hl = { fg = "bright_fg" },
						})
					end
					table.insert(children, child)
				end
				-- instantiate the new child, overwriting the previous one
				self.child = self:new(children, 1)
			end,

			provider = function(self)
				return self.child.eval()
			end,
			hl = { fg = "gray" },
			update = "CursorMoved",
		}

		-- LSP DIAGNOSTICS
		local Diagnostics = {
			condition = conditions.has_diagnostics,
			static = {
				error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
				warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
				info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
				hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
			},

			init = function(self)
				self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
				self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
				self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
				self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
			end,

			update = { "DiagnosticChange", "BufEnter" },

			{
				provider = "![",
			},

			{
				provider = function(self)
					return self.errors > 0 and (self.error_icon .. self.errors .. " ")
				end,
				hl = { fg = "diag_error" },
			},
			{
				provider = function(self)
					return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
				end,
				hl = { fg = "diag_warn" },
			},
			{
				provider = function(self)
					return self.info > 0 and (self.info_icon .. self.info .. " ")
				end,
				hl = { fg = "diag_info" },
			},
			{
				provider = function(self)
					return self.hints > 0 and (self.hint_icon .. self.hints .. " ")
				end,
				hl = { fg = "diag_hint" },
			},
			{
				provider = "]",
			},
		}

		local Git = {
			condition = conditions.is_git_repo,

			init = function(self)
				self.status_dict = vim.b.gitsigns_status_dict
				self.has_changes = self.status_dict.added ~= 0
					or self.status_dict.removed ~= 0
					or self.status_dict.changed ~= 0
			end,

			hl = { fg = "orange" },

			{ -- git branch name
				provider = function(self)
					return " " .. self.status_dict.head
				end,
				hl = { bold = true },
			},

			{
				condition = function(self)
					return self.has_changes
				end,
				provider = "(",
			},
			{
				provider = function(self)
					local count = self.status_dict.added or 0
					return count > 0 and ("" .. count)
				end,
				hl = { fg = "git_add" },
			},
			{
				provider = function(self)
					local count = self.status_dict.removed or 0
					return count > 0 and ("柳" .. count)
				end,
				hl = { fg = "git_del" },
			},
			{
				provider = function(self)
					local count = self.status_dict.changed or 0
					return count > 0 and ("" .. count)
				end,
				hl = { fg = "git_change" },
			},
			{
				condition = function(self)
					return self.has_changes
				end,
				provider = ")",
			},
		}

		local DAPMessages = {
			condition = function()
				local session = require("dap").session()
				return session ~= nil
			end,
			provider = function()
				return " " .. require("dap").status()
			end,
			hl = "magenta",
		}

		local HelpFileName = {
			condition = function()
				return vim.bo.filetype == "help"
			end,
			provider = function()
				local filename = vim.api.nvim_buf_get_name(0)
				return vim.fn.fnamemodify(filename, ":t")
			end,
			hl = { fg = "blue" },
		}

		local FileName = {
			init = function(self)
				self.lfilename = vim.fn.fnamemodify(self.filename, ":.")
				if self.lfilename == "" then
					self.lfilename = "[No Name]"
				end
			end,
			hl = { fg = "green" },

			flexible = 2,

			{
				provider = function(self)
					return self.lfilename
				end,
			},
			{
				provider = function(self)
					return vim.fn.pathshorten(self.lfilename)
				end,
			},
		}

		local Navic = { flexible = 3, Navic, { provider = "" } }

		local Align = { provider = "%=" }
		local Space = { provider = " " }

		ViMode = utils.surround({ "", "" }, "bright_bg", { ViMode })

		local DefaultStatusline = {
			ViMode,
			Space,
			FileNameBlock,
			Space,
			Git,
			Space,
			Navic,
			Align,
			DAPMessages,
			Space,
			Diagnostics,
			Space,
			LSPActive,
			Align,
			FileType,
			Space,
			Ruler,
			Space,
		}

		local InactiveStatusline = {
			condition = conditions.is_not_active,
			FileType,
			Space,
			FileName,
			Align,
		}

		local SpecialStatusline = {
			condition = function()
				return conditions.buffer_matches({
					buftype = { "nofile", "prompt", "help", "quickfix", "alpha" },
					filetype = { "^git.*", "fugitive" },
				})
			end,

			FileType,
			Space,
			HelpFileName,
			Align,
		}

		local TerminalStatusline = {
			condition = function()
				return conditions.buffer_matches({ buftype = { "terminal" } })
			end,

			hl = { bg = "red" },

			{ condition = conditions.is_active, ViMode, Space },
			FileType,
			Space,
			TerminalName,
			Align,
		}

		local StatusLines = {
			hl = function()
				if conditions.is_active() then
					return "StatusLine"
				else
					return "StatusLineNC"
				end
			end,

			fallthrough = false,

			SpecialStatusline,
			TerminalStatusline,
			InactiveStatusline,
			DefaultStatusline,
		}

		require("heirline").setup({
			statusline = StatusLines,
			opts = {
				colors = colors,
			},
		})
	end,
}
