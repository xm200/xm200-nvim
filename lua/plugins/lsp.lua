return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls", "pyright", "clangd", "gopls", "html", "cssls", "rust_analyzer"
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["clangd"] = function()
					require("lspconfig").clangd.setup({
						on_attach = function(client, bufnr)
							local buf_ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
							if buf_ft == "proto" then
								client.stop()
							end
						end,
					})
				end,
				["pyright"] = function ()
		        	require("lspconfig").pyright.setup({
        	        		settings = {
	        	        	    python = {
        			                    disableLanguageServices = false,
	        	        	            analysis = {
                        			        autoSearchPaths = true,
                	        	        	diagnosticMode = "workspace",
	        	                        	useLibraryCodeForTypes = true,
			                                loglevel = "Trace",
        		                        	typecheckingmode = "basic",
                		        	        autoImportCompletions = true
                			            }
	        	            	    }
		                	},
                			on_attach = function (client, bufnr)
        		        		local buf_ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
				                if buf_ft == "proto" then
        		                		client.stop()
                				end
	            			end
        				})
			    	end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,

				yamlls = function()
					local lspconfig = require("lspconfig")
					lspconfig.yamlls.setup({
						on_attach = function(_, buffer)
							if vim.bo[buffer].filetype == "helm" then
								vim.schedule(function()
									vim.cmd("LspStop ++force yamlls")
								end)
							end
						end,
					})
				end,
				["gopls"] = function ()
					local lspconfig = require("lspconfig")
					lspconfig.gopls.setup({
						capabilities = capabilities,
	    					settings = {
	      						gopls = {
		      						experimentalPostfixCompletions = true,
		      						analyses = {
		        						unusedparams = true,
		        						shadow = true,
		     						},
		     						staticcheck = true,
		   					},
	    					},
						on_attach = function(client, bufnr)
							local buf_ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
							if buf_ft == "proto" then
								client.stop()
							end
						end,

					})
				end,
				["html"] = function ()
					local lspconfig = require("lspconfig")
					lspconfig.html.setup({
						settings = {}
					})
					on_attach = function (client, bufnr)
						local buf_ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
						if buf_ft == "proto" then
							client.stop()
						end
					end
				end,
				["rust-analyzer"] = function()
  local lspconfig = require("lspconfig")
  lspconfig.rust_analyzer.setup({
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",  -- Run clippy to check for errors
        },
        cargo = {
          allFeatures = true,  -- Enable all features in Cargo.toml
        },
        procMacro = {
          enable = true,  -- Enable procedural macros
        },
        inlayHints = {
          enable = true,  -- Enable inlay hints
          chainingHints = true,  -- Enable chaining hints (e.g., function calls)
          parameterHints = true,  -- Enable parameter hints
        },
        lens = {
          enable = true,  -- Enable code lenses (e.g., go to definition, run tests)
        },
        diagnostics = {
          enable = true,  -- Enable diagnostics for errors/warnings
        },
      },
    },
    on_attach = function(client, bufnr)
      -- Custom on_attach for rust-analyzer
      -- For example, you can set key mappings or auto-format options here
    end,
  })
end
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),

				["<TAB>"] = cmp.mapping.confirm(cmp_select),
				["<CR>"] = cmp.mapping.confirm({ select = true }),

				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
		})

		cmp.setup.filetype({ "sql" }, {
			sources = {
				{ name = "vim-dadbod-completion" },
				{ name = "buffer" },
			},
		})

		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
			virtual_text = {
   				 -- source = "always",  -- Or "if_many"
   				 prefix = '●', -- Could be '■', '▎', 'x'
  			},
		})
	end,
}
