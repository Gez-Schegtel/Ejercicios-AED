
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
const char *str = "Arbitrary string to be written to a file.\n";

int main(void) {
    const char* filename = "from_copiar_string.txt";

    FILE* output_file = fopen(filename, "w+");
    if (!output_file) {
        perror("fopen");
        exit(EXIT_FAILURE);
    }
    fwrite(str, 1, strlen(str), output_file);
    printf("Done Writing!\n");

    fclose(output_file);

    exit(EXIT_SUCCESS);
}
