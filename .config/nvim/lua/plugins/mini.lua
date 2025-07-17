return {
	"echasnovski/mini.nvim",
	version = false,

	config = function()
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				hex_color = hipatterns.gen_highlighter.hex_color(),
				hsl_color = {
					pattern = "hsl%(%d+, %d+%%?, %d+%%?%)",
					group = function(_, match)
						local color = require("utils/color")
						local h, s, l = match:match("(%d+), (%d+%%?), (%d+%%?)")

						s, l = s:gsub("%%", ''), l:gsub("%%", '') -- remove %'s, if there are
						h, s, l = tonumber(h), tonumber(s), tonumber(l) -- convert to num

						if (h == nil or s == nil or l == nil) then return end -- because lsp warnings

						local hex = color.hsl(h, s, l)
						return hipatterns.compute_hex_color_group(hex, "bg")
					end
				},
				rgb_color = {
					pattern = "[rR][gG][bB]%(%d+, %d+, %d+%)",
					group = function(_, match)
						local color = require("utils/color")
						local r, g, b = match:match("(%d+), (%d+), (%d+)")
						r, g, b = tonumber(r), tonumber(g), tonumber(b)
						if (r == nil or g == nil or b == nil) then return end
						local hex = color.rgb_to_hex(r, g, b)
						return hipatterns.compute_hex_color_group(hex, "bg")
					end
				},
			}
		})
		require("mini.ai").setup()
		require("mini.pairs").setup()
	end
}
