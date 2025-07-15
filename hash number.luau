local function jenkins_hash(num:number): number
	local keyStr = tostring(num)
	local l = 0
	local h = 0
	for i = 1, #keyStr do
		local byte = string.byte(keyStr, i)
		l = (l + byte) % 2^32;l = (l + bit32.lshift(l, 10)) % 2^32;l = bit32.bxor(l, bit32.rshift(l, 6))
		h = (h + byte) % 2^32;h = (h + bit32.lshift(h, 11)) % 2^32;h = bit32.bxor(h, bit32.rshift(h, 7))
	end
	l = (l + bit32.lshift(l, 3)) % 2^32;l = bit32.bxor(l, bit32.rshift(l, 11));l = (l + bit32.lshift(l, 15)) % 2^32
	h = (h + bit32.lshift(h, 5)) % 2^32;h = bit32.bxor(h, bit32.rshift(h, 13));h = (h + bit32.lshift(h, 9)) % 2^32
	return h * 2^32 + l
end
