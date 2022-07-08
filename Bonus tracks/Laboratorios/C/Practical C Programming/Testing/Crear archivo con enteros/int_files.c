
#include <stdio.h>

int main(void) {
  // creating a FILE variable
  FILE *fptr;

  // integer variable
  int num;

  // open the file in write mode
  fptr = fopen("integers", "w");

  if (fptr != NULL)
    printf("File created successfully!\n");
  else {
    printf("Failed to create the file.\n");
    // exit status for OS that an error occurred
    return(-1);
  }

  // enter integer numbers
  printf("Enter some integer numbers [Enter -1 to exit]\n");
  while (1) {
    printf(">> ");
    scanf("%d", &num);

    if (num != -1)
      putw(num, fptr);
    else
      break;
  }

  // close connection
  fclose(fptr);

  // open file for reading
  fptr = fopen("integers", "r");

  // display numbers
  printf("\nNumbers:\n");
  while ( (num = getw(fptr)) != EOF )
    printf("%d ", num);

  printf("\nEnd of file.\n");

  // close connection
  fclose(fptr);

  return(0);
}
