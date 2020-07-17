#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

int main()
{
	printf("O_RDWR     = %x\n"
		"O_RDONLY   = %x\n"
		"O_WRONLY   = %x\n"
		"O_CREAT    = %x\n"
		"O_SYNC     = %x\n"
		"PROT_READ  = %x\n"
		"PROT_WRITE = %x\n"
		"MAP_SHARED = %x\n"
		"MAP_FAILED = %x\n"
		"sysconf(_SC_PAGE_SIZE) = %x!%d\n"
		,O_RDWR,O_RDONLY,O_WRONLY,O_CREAT,O_SYNC
		,PROT_READ,PROT_WRITE,MAP_SHARED,MAP_FAILED
		,sysconf(_SC_PAGE_SIZE),sysconf(_SC_PAGE_SIZE));
  return 0;
}
