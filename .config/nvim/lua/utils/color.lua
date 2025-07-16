local color = {}

---https://en.wikipedia.org/wiki/HSL_and_HSV#To_RGB
---@param hue number Hue [0, 360]
---@param saturation number Saturation [0, 100]
---@param lightness number Lightness [0, 100]
---@return number # r [0, 1]
---@return number # g [0, 1]
---@return number # b [0, 1]
function color.hsl_to_rgb(hue, saturation, lightness)
	local h = hue % 360
	local s = saturation / 100
	local l = lightness / 100

	local a = s * math.min(l, 1 - l)
	local k1 = (0 + h / 30) % 12
	local k2 = (8 + h / 30) % 12
	local k3 = (4 + h / 30) % 12

	local r = l - a * math.max(-1, math.min(k1 - 3, 9 - k1, 1))
	local g = l - a * math.max(-1, math.min(k2 - 3, 9 - k2, 1))
	local b = l - a * math.max(-1, math.min(k3 - 3, 9 - k3, 1))

	return r, g, b
end

---https://gristle.tripod.com/hexconv.html
---@param r integer Red 0 to 255
---@param g integer Green 0 to 255
---@param b integer Blue 0 to 255
---@return string # Hex value as #XXXXXX
function color.rgb_to_hex(r, g, b)
	-- checking if values are normalized
	if r <= 1 then r = r * 255 end
	if g <= 1 then g = g * 255 end
	if b <= 1 then b = b * 255 end

	local hex_table = "0123456789ABCDEF"
	local hex = ""

	local r_div = math.floor(r / 16)
	local r_rem = r % 16
	hex = hex .. string.sub(hex_table, r_div + 1, r_div + 1) .. string.sub(hex_table, r_rem + 1, r_rem + 1)

	local g_div = math.floor(g / 16)
	local g_rem = g % 16
	hex = hex .. string.sub(hex_table, g_div + 1, g_div + 1) .. string.sub(hex_table, g_rem + 1, g_rem + 1)

	local b_div = math.floor(b / 16)
	local b_rem = b % 16
	hex = hex .. string.sub(hex_table, b_div + 1, b_div + 1) .. string.sub(hex_table, b_rem + 1, b_rem + 1)

	return '#' .. hex
end

---@param hue number Hue [0, 360]
---@param saturation number Saturation [0, 100]
---@param lightness number Lightness [0, 100]
---@return string # Hex value as #XXXXXX
function color.hsl(hue, saturation, lightness)
	local r, g, b = color.hsl_to_rgb(hue, saturation, lightness)
	return color.rgb_to_hex(r, g, b)
end

return color
