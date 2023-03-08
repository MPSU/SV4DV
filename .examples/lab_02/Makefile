####################################

# Makefile for examples compilation

# For concrete example compilation:
#   make example=<name>

####################################

# Current directory
curdir := $(CURDIR)

# Example module name variable
example ?= active_event_region

# Output directory
out ?= $(curdir)/out

# Example source
sv := $(curdir)/$(example).sv

.PHONY: run clean

run: $(out)/compile.stamp
	@echo -n "Running $(example) (log at $(out)/sim.log)..."
	@cd $(out) && vsim -c $(example) -lib work +UVM_TESTNAME=$(testname) \
		-do "run -a;" -voptargs=+acc $(run_opts) > sim.log
	@echo "done"

$(out)/compile.stamp: $(sv)
	@echo -n "Compiling $(example) (log at $(out)/compile.log)..."
	@mkdir -p $(out)
	@cd $(out) && vlib work > compile.log
	@cd $(out) && vmap work work > compile.log
	@cd $(out) && vlog $(sv) > compile.log
	@echo "done"
	@touch $@

clean:
	@echo -n "Removing $(out)..."
	@rm -rf $(out)
	@echo "done"