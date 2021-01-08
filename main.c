#include "libasm.h"

int main()
{
	char *s = "1: Prueba de funcion write\n";
	int fd;
	char buf;
	int count;
	ssize_t len;

	//ft_write

	printf("-------------------------------------\n");
	printf("Pruebas write\n");
	printf("-------------------------------------\n\n");

	len = ft_strlen(s);
	if ((fd = open("test_write.txt", O_WRONLY | O_APPEND)) < 0)
		printf("No se ha podido abrir el archivo test_write.");
	if (ft_write(fd,s, strlen(s)) != len)
		printf("Hubo un error a a hora de escribir el archivo");
	else
		printf("Se pudo escribir con exito en el archivo test_write.txt\nSe ha escrito ---> %s", s);
	
	//ft_read

	printf("-------------------------------------\n");
	printf("Pruebas read\n");
	printf("-------------------------------------\n\n");

	if ((fd = open("test_read.txt", O_RDONLY)) < 0)
	{
		printf("No se puede abrir el archivo test.txt");
		return (0);
	}
	else
	{
		printf("\nread:    ");
		while ((count = read(fd, &buf, 1)) !=  0)
			printf("%c", buf);
		close(fd);
		count = 0;
		fd = open("test_read.txt", O_RDONLY);
		printf("\nft_read: ");
		while ((count = ft_read(fd, &buf, 1)) != 0)
			printf("%c", buf);
		close(fd);
	}

	//ft_strlen

	printf("\n-------------------------------------\n");
	printf("Pruebas ft_strlen\n");
	printf("-------------------------------------\n\n");

	printf("Esto es el len: %zu\n",ft_strlen("123456789"));

	//ft_strcmp

	printf("\n-------------------------------------\n");
	printf("Pruebas ft_strcmp\n");
	printf("-------------------------------------\n\n");
	printf("Esto es el strcmp: %d\n", ft_strcmp("hey", "hey"));

	//ft_strcpy

	printf("\n-------------------------------------\n");
	printf("Pruebas strcpy\n");
	printf("-------------------------------------\n\n");

	s = "Esto es lo que se copia en la nueva cadena";
	char j[50];
	char k[50];
	
	strcpy(j, s);
	printf("Original: %s\n", j);
	ft_strcpy(k, s);
	printf("Propia: %s\n", k);

	//ft_strdup

	printf("\n-------------------------------------\n");
	printf("Pruebas strdup\n");
	printf("-------------------------------------\n\n");

	char *src = "Esto es un texto";
	char *s1;
	char *s2;
	
	s1 = strdup(src);
	s2 = ft_strdup(src);
	printf("Original: %s\n", s1);
	printf("Propia: %s\n", s2);
	free(s1);
	free(s2);
	return (0);
}