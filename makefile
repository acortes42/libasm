OBJS =	ft_read.s ft_strcmp.s ft_strcpy.s ft_strdup.s ft_strlen.s ft_write.s
COMP =	${OBJS:.s=.o}
NAME = libasm.a

all: $(NAME)

$(NAME): ${OBJS}
	nasm -f macho64 ft_read.s
	nasm -f macho64 ft_strcmp.s
	nasm -f macho64 ft_strcpy.s
	nasm -f macho64 ft_strdup.s
	nasm -f macho64 ft_strlen.s
	nasm -f macho64 ft_write.s

	ar rc ${NAME} ${COMP}
clean:
	rm -f ${COMP}
fclean:	clean
	rm -f ${NAME}
	rm ./a.out
test:
	gcc -Wall -Werror -Wextra -L. -lasm main.c
	./a.out
re: fclean all .
