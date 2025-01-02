local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("tex", {
	s({ trig = "mm", snippetType = "snippet" }, {
		t({ "\\( " }),
		i(1),
		t({ " \\)" }),
	}),

	-- old snippets from when I had auto-pairs disabled
	-- s({ trig = "((", snippetType = "snippet" }, {
	-- 	t({ "\\( " }),
	-- 	i(1),
	-- 	t({ " \\)" }),
	-- }),
	-- s({ trig = "[", snippetType = "snippet" }, {
	-- 	t({ "[" }),
	-- 	i(1),
	-- 	t({ "]" }),
	-- }),
	-- s({ trig = "{", snippetType = "snippet" }, {
	-- 	t({ "{" }),
	-- 	i(1),
	-- 	t({ "}" }),
	-- }),
	-- s({ trig = "(", snippetType = "snippet" }, {
	-- 	t({ "(" }),
	-- 	i(1),
	-- 	t({ ")" }),
	-- }),
	-- s({ trig = "|", snippetType = "snippet" }, {
	-- 	t({ "|" }),
	-- 	i(1),
	-- 	t({ "|" }),
	-- }),
})
