# Project: Scripted Data Processing Pipeline

You are building a generic automation system that:

1. Takes multiple executable scripts (`.sh`, `.py`)
2. Runs them in the correct order
3. Stores logs and outputs in environment-specific directories
4. Supports quiet mode by default
5. Supports verbose mode when `V=1`
6. Works across multiple environments (`dev`, `test`, `prod`)
7. Is cleanly modularized using included `.mk` files

## Directory Structure

```bash
project/
├── Makefile
├── mk/
│   ├── vars.mk
│   ├── rules.mk
│   └── env.mk
├── scripts/
│   ├── fetch_data.sh
│   ├── transform_data.py
│   └── generate_report.sh
├── output/
│   └── (environment-specific folders created by Make)
├── logs/
│   └── (environment-specific folders created by Make)

```
