#include <stdio.h>

int main()
{
  int input,output, rotate;
	printf("Rotate versie 1.0 (Tiemen Molenaar)\n");
	printf("Typ een hex getal met maximaal 8 cijfers: ");
	scanf("%x",&input);
	printf("Typ hoeveel plaatsen je wil schijfen in decimaal:");
	scanf("%d",&rotate);

	asm("mov %[output], %[input], ROR %[rotate]"
			: [output] "+r" (output)
			: [input] "r" (input)
			, [rotate] "r" (rotate));

	printf("\ninput=%x rotate=%d geeft %x\n"
			,input, rotate, output);
			
  return 0;
}
