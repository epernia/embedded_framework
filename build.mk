#==============================================================================
# Select a target to build for. Available targets:
#  - pc_sim
#  - ciaa_nxp           
#  - edu_ciaa_nxp   
#
# Remember to clean program if change the target!
#==============================================================================

TARGET = pc_sim

#==============================================================================
# Select a program to build with make.
# Use a path relative to this folder.
#==============================================================================

PROGRAM = examples/c/sapi/gpio/blinky

# ver si lo dejamos asi como 1 variable con el path completo o usamos 2 como antes:
#PROGRAM_PATH = examples/c/sapi/gpio
#PROGRAM_NAME = blinky
