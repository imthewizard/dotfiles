local statuscolumn = {}

function statuscolumn.border()
	local text = "│";

	if vim.v.relnum == 0 then
		text = "%#SelectedLineNr#"..text
	end

	return text
end

function statuscolumn.number()
	return vim.v.relnum == 0 and "%#SelectedLineNr#%l" or "%l"
end

function statuscolumn.diagnostic()
	local text = ""

	local bufnr = vim.api.nvim_get_current_buf()
	local a = vim.api.nvim_buf_get_extmarks(bufnr, -1, 0, -1, {details = true, type = "sign"})
	for _, extmark in pairs(a) do
		local nvim_line = extmark[2] + 1

		if nvim_line == vim.v.lnum then
			local type = extmark[4].sign_hl_group
			if (type == "DiagnosticSignError") then
				return text .. "%#DiagnosticError#Error%#LineNr#"
			elseif (type == "DiagnosticSignWarn") then
				return text .. "%#DiagnosticWarn#Warn%#LineNr#"
			end

			if (type == "DiagnosticSignHint") then
				return text .. "%#DiagnosticHint#Hint%#LineNr#"
			end
			if (type == "DiagnosticSignInfo") then
				return text .. "%#DiagnosticInfo#Info%#LineNr#"
			end
		end
	end

	return text
end

function statuscolumn.statuscolumn()
	local text = ""

	text = table.concat({
		statuscolumn.diagnostic(),
		" %=",
		statuscolumn.number(),
		statuscolumn.border(),
	})

	return text;
end

return statuscolumn
