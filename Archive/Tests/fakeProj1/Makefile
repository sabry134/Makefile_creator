EXEC = 	 fakeProj

PROJECT_DIR = 	 fakeProj1

SRC = 	calc.c	\
		main.c	\

OBJ = 	 $(SRC:.c=.o)

CC = 	 clang

SOURCES_DIR = 	 .

CFLAGS = 	 -ftest-coverage -O2

HEADERS_DIR = 	 include

LIBS_DIR = 	 librarys

BCK_DIR = 	 backup

ZIP =	tar

ZIPFLAGS = 	-cvvf

UNZIP = 	tar

UNZIPFLAGS = 	-xvf

all: 	 $(EXEC)

$(EXEC): $(OBJ)
	gcc -o $(EXEC) $(OBJ) $(CFLAGS)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(EXEC)

re:	fclean all

archive:
	tar -cvvf $(BCK_DIR)-1.tar ../$(PROJECT_DIR) $(SRC)
	mv $(BCK_DIR)-1.tar $(BCK_DIR)/
	@echo $(BCK_DIR) file generated

revert:
	tar -xvf $(BCK_DIR)/$(BCK_DIR)-1.tar -C ../$(PROJECT_DIR)

num:
	@echo 1

delete:
	rm -rf $(BCK_DIR)/$(BCK_DIR)-1.tar

.PHONY: clean fclean re all

