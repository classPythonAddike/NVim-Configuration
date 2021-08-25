return require("packer").startup({
	require("plugin-list").InstallPlugins,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
	compile_on_sync = true,
	auto_clean = true,
})
