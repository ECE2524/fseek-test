/*
 * ============================================================================
 *
 *       Filename:  fdaccess.c
 *
 *    Description:  a short utility to experiment with access to standarad in fd
 *
 *         Author:  Darren Maczka (dkm), dmaczka@hazyblue.me
 *
 * ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <err.h>

int main() {
	FILE* fp = stdin;

	if (fseek(fp, 0, SEEK_END) != 0) {
		err(1, "(standard input)");
	}
	
	while( (fseek(fp, -2, SEEK_CUR)) == 0) {
		char c = fgetc(fp);
		putc(c, stdout);
	}
	putc('\n', stdout);
	exit(EXIT_SUCCESS);
}
	
