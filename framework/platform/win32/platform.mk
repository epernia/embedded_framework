PROVIDES+=platform_unix

ARCH:=ia32_emt64
COMPILER:=gcc
EXEC_EXTENTION:=.exe

RUN_GOALS:=.run_goal

.run_goal: .exec_goal

run_exec=$(EXEC_GOAL)
