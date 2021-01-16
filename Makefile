.PHONY: test
test:
	jsonnet test.jsonnet

.PHONY: docs
docs:
	docsonnet main.libsonnet
