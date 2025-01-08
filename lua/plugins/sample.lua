local function runtime(rt)
	if rt.extend then
		rt.extend()
	end
end

M = {}

M.extend = function()
	print('extern "C"')
end

runtime(M)
