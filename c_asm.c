#include <stdio.h>

int triple(int n)
{
	asm("add %[value], %[value], %[value], LSL #1" 
			: [value] "+r" (n));
}

int main()
{
  int n;
	printf("\nTriple Program!\n");
	printf("\nEnter an integer: ");
	scanf("%d", &n);
	printf("\nThree times %d is %d\n", n, triple(n));
}
