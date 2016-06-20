# Each new dir added should be added here via: make new sandbox=name
SUBDIRS = print-stdout

.PHONY: subdirs $(SUBDIRS)

subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -f ../Makefile -C $@ sandbox

sandbox: sandbox.o
	ld -o sandbox sandbox.o
sandbox.o: sandbox.asm
	nasm -f elf64 -g -F stabs sandbox.asm -l sandbox.lst

new:
	echo making name sandbox=$(sandbox)
	cp -Rv sandbox $(sandbox)
	sed -i 's/^SUBDIRS\s*=.*/& $(sandbox)/' Makefile
