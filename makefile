NAME	        =		so_long

NAME_B          =       so_long_bonus

SRCS            =       $(wildcard srcs/*.c)

SRCS_B      =       $(wildcard srcs/*.c)

INCLUDES_DIR     =       includes/

INCLUDES_DIR_B  =       includes/

LIB_DIR         =       libft/

LIBFT           =       libft/libft.a

CC              =       clang

OBJS            =       ${SRCS:.c=.o}

OBJS_B          =       ${SRCS_B:.c=.o}

MLX         =       minilibx/libmlx.a

MLX_DIR     =       minilibx/

RM          =       rm -rf

LFLAGS       =       -framework OpenGL -framework AppKit

FLAGS       =       -Wall -Werror -Wextra

.c.o:
					@${CC} ${FLAGS} -I${INCLUDES_DIR} -c $< -o ${<:.c=.o}
					@echo "\x1b[32m[OK]\033[0m ${<:.s=.o}"

all:			${NAME}

${NAME}:		${OBJS}
						@make -C ${MLX_DIR} 2>/dev/null
						@make -C ${LIB_DIR} 2>/dev/null
						@make -C ${LIB_DIR} bonus 2>/dev/null
						@${CC} ${FLAGS} ${LFLAGS} -I${INCLUDES_DIR} -o ${NAME} ${OBJS} ${LIBFT} ${MLX}
						@echo "\nlibft.a has been created"
						@echo "so_long has been created"

bonus:		${OBJS_B}
						@make -C ${MLX_DIR} 2>/dev/null
						@make -C ${LIB_DIR} 2>/dev/null
						@make -C ${LIB_DIR} bonus 2>/dev/null
						@${CC} ${FLAGS} ${LFLAGS} -I ${INCLUDES_DIR_B} -o ${NAME_B} ${OBJS_B} ${LIBFT} ${MLX}
						@echo "\nlibft.a has been created"
						@echo "so_long_bonus has been created"

clean:
						@make -C ${LIB_DIR} clean
						@${RM} ${OBJS} ${OBJS_B}
						@echo "\n *.o files deleted\n"

fclean:		clean
						@make -C ${LIB_DIR} fclean
						@${RM} ${NAME} ${NAME_B}
						@echo "\nlibft and so_long have been deleted\n"

re:		fclean all

.PHONY:           all     clean   fclean  re