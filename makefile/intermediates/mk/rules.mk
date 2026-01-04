.PHONY: new_report fetch_data transform_data generate_report clean

new_report: generate_report

fetch_data:
	$(Q)echo "Fetching data..."

transform_data: $(OUTPUTS_DIR)/$(ENV) fetch_data
	$(Q)echo "Transforming data..."
	$(Q)python3 $(SCRIPTS_DIR)/transform_data.py
	$(Q)echo "$(TIME) Added new '$(ENV)' user" >> $(LOGS_DIR)/$(USERS)

generate_report: $(REPORT_DIR) transform_data
	$(Q)echo "Generating report..."
	$(Q)echo "$(TIME)" > $(LOGS_DIR)/$(REPORTS)
	$(Q)bash $(SCRIPTS_DIR)/generate_report.sh $(OUTPUTS_DIR) $(REPORT_DIR)/new_report_$(DATE).csv > $(LOGS_DIR)/$(REPORTS)

clean: remove_dirs
	$(Q)echo "Removing everything..."