
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

struct s {
	int sn;
	int id;
};

int bubble_sort(struct s *array, int n)
{
	int i;
	int j;
	struct s tmp;

	for (i = 0; i < n; i++)
	{
		for (j = i; j < n; j++)
		{
			if (array[j].sn > array[i].sn)
			{
				tmp.sn = array[i].sn;
				tmp.id = array[i].id;
				array[i].sn = array[j].sn;
				array[i].id = array[j].id;
				array[j].sn = tmp.sn;
				array[j].id = tmp.id;
			}
		}
	}

	return 0;
}

int main(int argc, char *argv[])
{
#if 0
	struct s array[8] = {
		{4, 1},
		{5, 2},
		{1, 3},
		{2, 4},
		{3, 5},
		{8, 6},
		{7, 7},
		{6, 8},
	};

	bubble_sort(array, 8);

	for (int i = 0; i < 8; i++)
	{
		printf("%d %d\n", array[i].sn, array[i].id);
	}
#elif 0
#define ARRAY_NUM	(32 * 1)
	struct s array[ARRAY_NUM];

	for (int i = 0; i <  ARRAY_NUM; i++)
	{
		array[i].sn = random() % ARRAY_NUM;
		array[i].id = array[i].sn;
	}

	for (int i = 0; i < ARRAY_NUM; i++)
	{
		printf("id: %4d, sn: %4d\n", array[i].id, array[i].sn);
	}

	bubble_sort(array, ARRAY_NUM);

	printf("after sort\n");
	for (int i = 0; i < ARRAY_NUM; i++)
	{
		printf("id: %4d, sn: %4d\n", array[i].id, array[i].sn);
	}

#else
	float matrix[3][3] = {
		{1.0f, 2.0f, 3.0f},
		{4.0f, 5.0f, 6.0f},
		{7.0f, 8.0f, 9.0f},
	};
	printf("matrix[0][1]: %f\n", -matrix[0][1]);
#endif
	printf("test: %x\n", '\n'/*0x21 '$'isprint(0x00)*/);

	float temp = pow(3.0, 2) + pow(4.0, 2);
	float result = pow(temp, 2) + pow(5.0, 2);
	printf("temp: %f, result: %f\n", temp, result);
	return 0;
}




