#include <stdio.h>
#include <string.h>
#include "my_debug.h"

int do_multi(int a, int b)
{
	return a * b;
}

int do_add(int a, int b)
{
	return a + b;
}

int do_calc(int a, int b)
{
	return do_multi(a, b) + do_add(a, b);
}

int fun1(void)
{
	return 0;
}

int fun2(void)
{
	return fun1();
}

int fun3(void)
{
	return fun2();
}

int main()
{
	set_baseaddr();
	enable_my_debug();
	int a = 4, b = 5;
	printf("result: %d\n", do_calc(a, b));
	fun3();
	disable_my_debug();
	return 0;
}

