local M = {}

M.opts = {
	cc = "g++",
	flags = {
		"-std=c++17",
		"-O2",
		"-Wall",
		"-Wextra",
		"-pedantic",
		"-Wshadow",
		"-Wformat=2",
		"-Wfloat-equal",
		"-Wconversion",
		"-Wlogical-op",
		"-Wshift-overflow=2",
		"-Wduplicated-cond",
		"-Wcast-qual",
		"-Wcast-align",
		"-Wno-unused-result",
		"-Wno-sign-conversion",
	},
}

M.compile = function(file)
	local flags_concat = ""
	for _, v in pairs(M.opts.flags) do
		flags_concat = string.format("%s %s", flags_concat, v)
	end
	return vim.fn.system(string.format("%s %s %s", M.opts.cc, flags_concat, file))
end

return M
