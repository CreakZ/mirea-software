# 19/11/2024 wtf is this 

# all commands must be ran from the root directory

# DO NOT SPECIFY EXTENSION
path ?= default_value

word:s
	libreoffice --writer $(path)

pdf:
	xdg-open $(path)


wnum ?= 9

winit:
	mkdir work-$(wnum)
	cd work-$(wnum)
	mkdir report src
