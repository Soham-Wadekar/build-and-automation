ROOT_DIRS:= $(OUTPUTS_DIR) $(LOGS_DIR) $(REPORT_DIR)

$(ROOT_DIRS):
	$(Q)mkdir -p $@

$(OUTPUTS_DIR)/$(ENV): $(LOGS_DIR)
	$(Q)mkdir -p $@

remove_dirs:
	$(Q)rm -rf $(ROOT_DIRS)