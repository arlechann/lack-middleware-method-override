.PHONY: test
test:
	qlot exec ros run -e '(asdf:test-system :lack-middleware-method-override :verbose t)' -q

