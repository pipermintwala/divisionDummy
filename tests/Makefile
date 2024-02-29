SIM ?= icarus
TOPLEVEL_LANG ?= verilog
VERILOG_SOURCES += $(PWD)/../hdl/dut.v
dut:
	$(MAKE) sim MODULE=test TOPLEVEL=dut
include $(shell cocotb-config --makefiles)/Makefile.sim