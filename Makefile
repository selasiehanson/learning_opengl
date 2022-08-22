run:
	xmake run main

.PHONY: watch
watch:
	watchexec -w src --exts cpp,h xmake

# this create the compile_commands.json needed by clangd for Lsp
gen-deps:
	xmake project -k compile_commands
