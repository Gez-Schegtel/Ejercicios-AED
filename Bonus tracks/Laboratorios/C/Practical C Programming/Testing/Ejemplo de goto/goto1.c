// C program to check if a number is
// even or not using goto statement
#include <stdio.h>

// function to check even or not
void checkEvenOrNot(int num)
{
	if (num % 2 == 0)
		// jump to even
		goto even;
	else
		// jump to odd
		goto odd;

 even:
	printf("%d is even\n", num);
	// return if even
	return;
 odd:
	printf("%d is odd\n", num);
}

int main()
{
	int num = 26;
	checkEvenOrNot(num);
	return 0;
}
