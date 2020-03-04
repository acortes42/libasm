OBJS =	ft_read.s ft_strcmp.s ft_strcpy.s ft_strdup.s ft_strlen.s ft_write.s
COMP =	${OBJS:.c=.o}
NAME = libasm.a

all: $(NAME)

$(NAME): ${OBJS}
	gcc -c ${OBJS}
	ar rc ${NAME} ${COMP}
clean:
	rm -f ${COMP}
fclean:	clean
	rm -f ${NAME}
re: fclean all .
