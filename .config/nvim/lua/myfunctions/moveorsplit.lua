function moveOrSplit(key)
	local curWindow = vim.fn.winnr()
	
	vim.cmd("wincmd "..key)

	if curWindow == vim.fn.winnr() then --didn't change, create new split
		if key == 'j' then --splitbelow on
			vim.cmd("split")
			vim.cmd("wincmd j")
		end

		if key == 'l' then --splitright on
			vim.cmd("vsplit")
			vim.cmd("wincmd l")
		end
	end	
end
