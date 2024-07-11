return {
	"Olical/conjure",
	-- [Optional] cmp-conjure for cmp
	enabled = true,
	ft = { "clojure", "fennel" }, -- etc
	lazy = true,
	dependencies = {
		{
			"PaterJason/cmp-conjure",
			config = function()
				local cmp = require("cmp")
				local config = cmp.get_config()
				table.insert(config.sources, {
					name = "buffer",
					option = {
						sources = {
							{ name = "conjure" },
						},
					},
				})
				cmp.setup(config)
			end,
		},
	},
}
