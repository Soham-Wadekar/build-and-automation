MAKE_DIR := mk
SCRIPTS_DIR := scripts
OUTPUTS_DIR := outputs
LOGS_DIR := logs
REPORT_DIR:= reports

USERS = users.log
REPORTS = reports.log

TIME := [$(shell date '+%d-%m-%y %H:%M:%S')]

ENV ?= dev
export ENV

ifeq ($(V), 1)
Q := 
else
Q := @
endif

