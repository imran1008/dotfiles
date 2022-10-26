
-----------------------------------------
-- Packer -------------------------------
-----------------------------------------

local packer = require('packer')
packer.init {
	display = {
		open_fn = require('packer.util').float,
		show_all_info = true,
		prompt_border = 'double'
	}
}

local function init_telescope(use, extensions)
	use 'nvim-telescope/telescope.nvim'		-- fuzzy finder
	use 'nvim-treesitter/nvim-treesitter'	-- needed by telescope

	local telescope = require('telescope')

	for i,v in pairs(extensions) do
		telescope.load_extension(v)
	end
end

local function init_cmp_autocomplete(use, snippet)
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	local snippet_source = nil

	if snippet == "vsnip" then
		use 'hrsh7th/cmp-vsnip'
		use 'hrsh7th/vim-vsnip'

		snippet_source = { name = 'vsnip' }

	elseif snippet == "luasnip" then
		use 'L3MON4D3/LuaSnip'
		use 'saadparwaiz1/cmp_luasnip'

		snippet_source = { name = 'luasnip' }

	elseif snippet == "ultisnips" then
		use 'SirVer/ultisnips'
		use 'quangnguyen30192/cmp-nvim-ultisnips'

		snippet_source = { name = 'ultisnips' }

	elseif snippet == "snippy" then
		use 'dcampos/nvim-snippy'
		use 'dcampos/cmp-snippy'

		snippet_source = { name = 'snippy' }
	end

	local cmp = require('cmp')
	assert(cmp)

	cmp.setup({
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				if snippet == "vsnip" then
					vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
				elseif snippet == "luasnip" then
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				elseif snippet == "snippy" then
					require('snippy').expand_snippet(args.body) -- For `snippy` users.
				elseif snippet == "ultisnips" then
					vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
				end
			end,
		},
		window = {
			-- completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			snippet_source
		}, {
			{ name = 'buffer' },
		})
	})

	-- Set configuration for specific filetype.
	cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({
			{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
		}, {
			{ name = 'buffer' },
		})
	})

	-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline('/', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		})
	})

	return require('cmp_nvim_lsp').default_capabilities()
end

local function init_coq_autocomplete(use)
	use 'ms-jpq/coq_nvim'
	return require('coq').lsp_ensure_capabilities()
end

local function init_lspconfig(use, capabilities)
	use 'neovim/nvim-lspconfig'				-- language specific warnings

	local lspconfig = require('lspconfig')
	lspconfig.pyright.setup({
		capabilities = capabilities
	})

	lspconfig.clangd.setup({ })
	lspconfig.sumneko_lua.setup({
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = 'LuaJIT',
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = {'vim'},
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})

	lspconfig.tsserver.setup({ })
end

packer.startup(function(use)
	use 'wbthomason/packer.nvim'	-- plugin manager
	use 'kyazdani42/nvim-tree.lua'	-- nerdtree like plugin
	use 'vimwiki/vimwiki'			-- vimwiki
	use 'ap/vim-css-color'			-- colorize #aabbcc
	use 'dracula/vim'				-- dracula theme
	use 'vifm/vifm.vim'				-- vifm file manager
	use 'nvim-lua/plenary.nvim'		-- needed by telescope, harpoon
	use 'ThePrimeagen/harpoon'		-- harpoon - fast switch to small set of files per project

	use 'tpope/vim-fugitive'		-- not used yet
	use 'sakhnik/nvim-gdb'			-- nto used yet

	init_telescope(use, {'harpoon'})

	-- CMP is better for:
	--    - color highlighting within the search results
	--    - fuzzy searches
	--    - no foul language in the documentation
	--    - more popular (and used by Primeagen)
	--    - doesn't require additional vim commands to start plugin
	--    - does autocompletion in the vim command bar
	--
	-- COQ is better for:
	--    - searching local filesystem
	--    - supposedly faster
	--
	-- CMP is the clear winner
	--

    -- List of snippet plugens:
	--    - vsnip
	--    - luasnip
	--    - ultisnips
	--    - snippy

	local capabilities = init_cmp_autocomplete(use, nil)
	-- local capabilities = init_coq_autocomplete(use)

	init_lspconfig(use, capabilities)
end)

-----------------------------------------
-- Nvim Tree ----------------------------
-----------------------------------------

require('nvim-tree').setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },

				-- The default 'm' is now used to move left
				{ key = "h", action = "toggle_mark" }
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	remove_keymaps = {
		"O", "m"
	},
})


