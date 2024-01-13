#include<stdio.h>

long int func(int n);

int main()
{
    int n;
    scanf("%d", &n);
    printf("%ld\n", func(n));
    return 0;
}

long int func(int n) {
    if (n >= 1)
        return n * func(n - 1);
    else
        return 1;
}
