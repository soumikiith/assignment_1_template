#include <stdio.h>
#include <stdlib.h>

float func(int size, float* num)
{
    float sum = 0.0;

    for (size_t i = 0; i < size; ++i) {
        sum += num[i];
    }

    return sum;
}

int main()
{
    int n;
    scanf("%d", &n);
    
    float *num = (float*)malloc(n * sizeof(float));

    for (int i = 0; i < n; ++i) {
        scanf("%f", &num[i]);
    }

    float result = 0;
    result = func(n, num);
    printf("%.2f\n", result);

    return 0;
}
