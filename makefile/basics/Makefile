DATE = $(shell date +%F)
USERNAME ?= dev
PROJECT ?= "New Project"
PROJECT += $(DATE)
WORKSPACE := workspace_$(USERNAME)_$(DATE)/
LOG_FILE = workspace.log

SETUP_STAMP := .setup_$(DATE)

.PHONY: clean prepare log extra-clean

setup: $(SETUP_STAMP)
	@echo "✅ Setup completed successfully!"

clean:
	@echo "🧹 Cleaning up old artifacts..."
	@rm -rf workspace_* .setup_*

prepare:
	@echo "🛠️  Preparing workspace..."
	@mkdir -p $(WORKSPACE)

log:
	@echo "Date=$(DATE)		| User=$(USERNAME)		| Workspace=$(WORKSPACE)	" >> $(LOG_FILE)

prepare-git: prepare
	@git init $(WORKSPACE)
	@echo "# $(PROJECT)" > $(WORKSPACE)/README.md
	@touch $(WORKSPACE)/.gitignore

$(SETUP_STAMP):
	@$(MAKE) clean
	@$(MAKE) prepare-git
	@$(MAKE) log
	@touch $@

extra-clean:
	@echo "🗑️  Removing everything"
	@rm -rf workspace_* $(LOG_FILE) $(SETUP_STAMP)
