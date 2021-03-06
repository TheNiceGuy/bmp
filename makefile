CFLAGS=-W -Wall -pedantic
LDFLAGS=
EXEC=bmp
BINDIR=/usr/bin
SRCDIR=src

all: $(EXEC)

$(EXEC): mkdir algo.o io.o bmp.o main.o
	gcc -o bin/$(EXEC) $(SRCDIR)/algo.o $(SRCDIR)/io.o $(SRCDIR)/bmp.o $(SRCDIR)/main.o $(LDFLAGS)
	rm -rf $(SRCDIR)/*.o

main.o: $(SRCDIR)/main.c
	gcc -o $(SRCDIR)/main.o -c $(SRCDIR)/main.c $(CFLAGS)

algo.o: $(SRCDIR)/algo.c
	gcc -o $(SRCDIR)/algo.o -c $(SRCDIR)/algo.c $(CFLAGS)

io.o: $(SRCDIR)/io.c
	gcc -o $(SRCDIR)/io.o -c $(SRCDIR)/io.c $(CFLAGS)

bmp.o: $(SRCDIR)/bmp.c
	gcc -o $(SRCDIR)/bmp.o -c $(SRCDIR)/bmp.c $(CFLAGS)

mkdir:
	@mkdir -p bin/

clean:
	rm -rf $(SRCDIR)/*.o

mrproper:
	rm -rf $(SRCDIR)/*.o
	rm -rf bin/$(EXEC)

install:
	cp bin/$(EXEC) $(BINDIR)/$(EXEC)

uninstall:
	rm $(BINDIR)/$(EXEC)

