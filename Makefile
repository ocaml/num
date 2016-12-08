OCAMLC=ocamlc
LIBDIR=$(shell $(OCAMLC) -where)

all:
	$(MAKE) -C src all

test:
	$(MAKE) -C test test

# This is the legacy installation: straight into the master lib/ directory
# TODO: ocamlfind support
install-legacy:
	$(MAKE) -C src install-legacy

clean:
	$(MAKE) -C src clean
	$(MAKE) -C test clean
