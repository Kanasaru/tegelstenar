define colorecho
	@tput setaf $1
	@echo $2
	@tput sgr0
endef

PROG   = tegelstenar
CC     = clang
LINKER = clang

INCDIR = src
SRCDIR = src
OBJDIR = obj
BINDIR = bin

CFLAGS = -I$(INCDIR)
LFLAGS = -lSDL2-2.0.0 -lSDL2_image-2.0.0 -lSDL2_ttf-2.0.0 -lSDL2_mixer-2.0.0 -lmpos-1.0.0

SOURCES := $(wildcard $(SRCDIR)/*.c) \
           $(wildcard $(SRCDIR)/utl/*.c)

OBJECTS := $(SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

$(BINDIR)/$(PROG): $(OBJECTS)
	@$(LINKER) $(OBJECTS) $(LFLAGS) -o $@
	$(call colorecho,6,"Linking complete!")

$(OBJECTS): $(OBJDIR)/%.o : $(SRCDIR)/%.c | createdir
	@$(CC) $(CFLAGS) -c $< -o $@
	$(call colorecho,6,"Compiled "$<" successfully!")

createdir:
	$(call colorecho,4,"Create directories...")
	@mkdir -p $(BINDIR)
	@mkdir -p $(OBJDIR)

.PHONY: clean
clean:
	@rm -f $(OBJECTS)
	$(call colorecho,4,"Cleanup complete!")

.PHONY: remove
remove: clean
	@rm -R $(BINDIR)
	@rm -R $(OBJDIR)
	$(call colorecho,4,"EData removed!")
