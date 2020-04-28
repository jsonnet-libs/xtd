.PHONY: test
test:
	jsonnet test.jsonnet

.PHONY: docs
docs:
	jsonnet -J docs/vendor docs/main.docsonnet | docsonnet > README.md
