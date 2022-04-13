//
//  main.c
//  220408_1
//
//  Created by Park Gyurim on 2022/04/08.
//
//  https://www.acmicpc.net/problem/13458
//

#include <stdio.h>
#include <stdlib.h>

int main() {
    long long answer = 0;
    int n = -1;
    scanf("%d", &n);
    int * a = (int *)calloc(n, sizeof(int));
    for (int i = 0; i < n; i++) { scanf("%d", a + i); }
    
    int b = -1, c = -1;
    scanf("%d %d", &b, &c);
    int temp = 0;

    for (int i = 0; i < n; i++) {
        answer++;
        if (a[i] - b <= 0) { continue; }
        
        temp = (a[i] - b) % c;
        if (temp == 0) { answer += (a[i] - b) / c; }
        else { answer += (a[i] - b) / c + 1; }
    }

    printf("%lld\n", answer);
    return 0;
}

