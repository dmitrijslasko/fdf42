GREEN = \033[0;32m
RED = \033[0;31m
RESET = \033[0m

NAME = fdf

CC = cc
FLAGS = -Wall -Wextra -Werror -g
LIB_FLAGS = -lmlx -lm -lXext -lX11

INC = -I ./inc

SOURCES_DIR = ./src/
OBJECTS_DIR = ./obj/

SOURCES = $(wildcard $(SOURCES_DIR)*.c) $(wildcard $(SOURCES_DIR)**/*.c)
OBJECTS = $(patsubst $(SOURCES_DIR)%, $(OBJECTS_DIR)%, $(SOURCES:.c=.o))

$(info SOURCES: $(SOURCES))
$(info OBJECTS: $(OBJECTS))

# libraries
LIBDIRS = ./lib/

LIBFT = $(LIBFT_DIR)libft.a
LIBFT_DIR = $(LIBDIRS)libft/

PRINTF = $(PRINTF_DIR)libftprintf.a
PRINTF_DIR = $(LIBDIRS)printf/

MINILIBX = $(MINILIBX_DIR)libmlx.a
MINILIBX_DIR = $(LIBDIRS)minilibx/

GNL = $(GNL_DIR)*line.c $(GNL_DIR)*utils.c
GNL_DIR = $(LIBDIRS)get_next_line/


all: $(LIBFT) $(PRINTF) $(MINILIBX) $(NAME)

$(NAME): $(OBJECTS)
	@$(CC) $(OBJECTS) -o $(NAME) $(GNL) -L$(LIBFT_DIR) -lft -L$(MINILIBX_DIR) \
			-L$(PRINTF_DIR) -lftprintf $(LIB_FLAGS)
	@echo "\n$(GREEN)$(NAME) got successfully compiled.$(RESET)"

$(OBJECTS): $(OBJECTS_DIR)%.o : $(SOURCES_DIR)%.c
	@mkdir -p $(dir $@)
	@$(CC) $(FLAGS) $(INC) -c $< -o $@
	@echo "$(GREEN)%%%%$(RESET)\c"

clean:
	rm -f $(OBJECTS_DIR)**/*.o
	rm -rf $(OBJECTS_DIR)*

fclean: clean
	rm -f $(NAME)
	@$(MAKE) -C $(LIBFT_DIR) clean
	@$(MAKE) -C $(MINILIBX_DIR) clean
	@$(MAKE) -C $(PRINTF_DIR) clean

re: fclean all

$(LIBFT):
	$(MAKE) -C $(LIBFT_DIR)

$(MINILIBX):
	$(MAKE) -C $(MINILIBX_DIR)

$(PRINTF):
	$(MAKE) -C $(PRINTF_DIR)

.PHONY: all clean fclean re
