#include <string.h>
#include <stdio.h>

int checker(int argc, char **argv)
{
    int countcaps = 0;
    int mincap = 0;
    int len = 0;

    char *str = NULL;
    for (int i = 1; argv[i] != NULL; i++) {
        str = argv[i];
        for (int j = 0; str[j] != '\0'; j++) {
            if ((str[j] >= 'A' && str[j] <= 'Z')) {
                countcaps ++;
            }
            if (str[j] - '0' >= 0 && str[j] - '0' <= 9) {
                mincap++;
            }
        }
        len += strlen(str);
    }
    if (len > 20) {
        printf("Invalid name: Too long name! Name length: %d.\n", len);
        return (0);
    } if (countcaps >= len / 2) {
        printf("Invalid name: Too many capital letters.\n");
        return (0);
    } if (mincap > 1) {
        printf("Invalid name: There must be only 1 number in the name.\n");
        return (0);
    } else {
        printf("Valid team name.\n");
        return (0);
    }

}

int main(int argc, char **argv)
{
    checker(argc, argv);
}