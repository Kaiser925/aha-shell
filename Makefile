## help: Show help message
.PHONY: help
help: Makefile
	@echo "\nUsage: make <TARGETS>  ...\n\nTargets:"
	@sed -n 's/^##//p' $< | column -t -s ':' | sed -e 's/^/ /'

## install-go: Install go on local machine
.PHONY: install-go
install-go:
	@./installer/golang-install.sh

## ubuntu.install-rvm: Install rvm for ubuntu
.PHONY: ubuntu.install-rvm
ubuntu.install-rvm:
	@./installer/ubuntu/install-rvm

## ubuntu.install-podman: Install podman for ubuntu
.PHONY: ubuntu.install-podman
ubuntu.install-podman:
	@./installer/ubuntu/install-rvm

## password: Generate password
.PHONY: password
password:
	@./tools/pass-generate
