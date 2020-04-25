SAPI_BASE=$(SAPI_ROOT)/base

# Convert ---------------------------------------------------------------------

INCLUDES+=$(SAPI_BASE)/convert/inc
SOURCES+=$(wildcard $(SAPI_BASE)/convert/src/*.c)

# Delay -----------------------------------------------------------------------

INCLUDES+=$(SAPI_BASE)/delay/inc
SOURCES+=$(wildcard $(SAPI_BASE)/delay/src/*.c)

# Print -----------------------------------------------------------------------

INCLUDES+=$(SAPI_BASE)/print/inc
SOURCES+=$(wildcard $(SAPI_BASE)/print/src/*.c)

# Stdio -----------------------------------------------------------------------

INCLUDES+=$(SAPI_BASE)/stdio/inc
SOURCES+=$(wildcard $(SAPI_BASE)/stdio/src/*.c)
