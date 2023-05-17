vim.treesitter.query.set("rust", "folds", [[
	[
		(mod_item)
		(function_item)
		(struct_item)
		(trait_item)
		(enum_item)
		(impl_item)
		(use_declaration)
		(match_expression)
		(array_expression)
	] @fold
]])
