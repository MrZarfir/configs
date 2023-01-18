# Fichier original fourni par Pr. Michael Blondin (Université de Sherbrooke) dans le cadre du cours d'IFT209
# Modifié par Jeremi Levesque le 17 Janvier 2023 afin de supporter la compilation sur Apple Silicon.
# Référence pour la modification: http://main.lv/writeup/arm64_assembly_hello_world.md

AS    = as
LD    = ld
ENTRY = main
NAME  = main

all: $(NAME)
	@echo "Veuillez exécuter: ./$(NAME)"

$(NAME): $(NAME).o
	@echo "Édition des liens..."
	@$(LD) $(NAME).o -o $(NAME) -e $(ENTRY) -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -arch arm64
	@echo "OK."

$(NAME).o: $(NAME).s
	@echo "Assemblage... "
	@$(AS) -o $(NAME).o $(NAME).s
	@echo "OK."

clean:
	@echo "Nettoyage... "
	@rm -f *.o $(NAME)
	@echo "OK."

