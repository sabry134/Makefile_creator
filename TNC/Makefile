SRC		=	name_checker.c	\

OBJ     =	$(SRC:.c=.o)

NAME    =	name_check

all:    $(NAME)

$(NAME): $(OBJ)
	gcc -o $(NAME) $(OBJ)

clean:
	rm -f $(OBJ)
	rm -f *gcno

fclean: clean
	rm -f $(NAME)
	rm -f *~
	rm -f *.o

re:     fclean all