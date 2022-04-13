#include <stdio.h>

int* solution(int prices[], size_t prices_len) {
    int k = 0, temp = 0, size = prices_len;
    int* answer = (int*)malloc(sizeof(int) * size);

    for (int i = 0; i < size; i++) {
        k = 0;
        for (int j = i + 1; j < size; j++) {
            k++;
            if (prices[i] > prices[j]) { break; }
        }    
        answer[i] = k;
    }
    
    return answer;
}
