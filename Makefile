run:
	xmake run main

.PHONY: watch
watch:
	watchexec -w src --exts cpp,h xmake
