/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   aux.c                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dmlasko <dmlasko@student.42berlin.de>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/20 13:52:32 by dmlasko           #+#    #+#             */
/*   Updated: 2024/12/03 17:13:34 by dmlasko          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "fdf.h"

void	swap(void *a, void *b, size_t size)
{
	void	*temp;

	temp = malloc(size);
	if (temp == NULL)
		return ;
	memcpy(temp, a, size);
	memcpy(a, b, size);
	memcpy(b, temp, size);
	free(temp);
}

int	ft_count_str(char const *s, char const c)
{
	int	string_count;

	string_count = 0;
	while (*s)
	{
		while (*s && *s == c)
			s++;
		if (*s && *s != c)
		{
			string_count++;
			while (*s && *s != c)
				s++;
		}
	}
	return (string_count);
}
