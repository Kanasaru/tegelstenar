# colored terinal output
define colorecho
	@tput setaf $1
	@echo $2
	@tput sgr0
endef

# output file name
PROG   = tegelstenar
# compiler and linker
CC     = clang
LINKER = clang
# directories
INCDIR = src
SRCDIR = src
OBJDIR = obj
BINDIR = bin

# flags
CFLAGS = -I$(INCDIR)
LFLAGS = -lSDL2-2.0.0 -lSDL2_image-2.0.0 -lSDL2_ttf-2.0.0 -lSDL2_mixer-2.0.0

# source file paths
SOURCES := $(wildcard $(SRCDIR)/*.c) \
           $(wildcard $(SRCDIR)/utl/*.c) \
           $(wildcard $(SRCDIR)/mpos/*.c)
# object files
OBJECTS := $(SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
rm       = rm -f

# linking
$(BINDIR)/$(PROG): $(OBJECTS)
	@$(LINKER) $(OBJECTS) $(LFLAGS) -o $@
	$(call colorecho,6,"Linking complete!")
# compiling
$(OBJECTS): $(OBJDIR)/%.o : $(SRCDIR)/%.c | createdir
	@$(CC) $(CFLAGS) -c $< -o $@
	$(call colorecho,6,"Compiled "$<" successfully!")

# create object file paths
createdir:
	$(call colorecho,4,"Create directories...")
	mkdir -p $(BINDIR)
	mkdir -p obj/utl
	mkdir -p obj/mpos

.PHONY: clean
clean:
	@$(rm) $(OBJECTS)
	$(call colorecho,4,"Cleanup complete!")

.PHONY: remove
remove: clean
	@$(rm) $(BINDIR)/$(PROG)
	@$(rm) $(wildcard $(BINDIR)/*.*)
	$(call colorecho,4,"Executable and game data removed!")
