//
//  main.c
//  220408_2
//
//  Created by Park Gyurim on 2022/04/08.
//

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[]) {
    int answer = 0, cur = 0;
    int n = 0;
    scanf("%d", &n); // n + 1 일 : 퇴사하는 날 -> n일동안 최대한 많은 일을 하려고함!!
    
    // tp[i][0] -> t : 상담을 완료하는데 걸리는 기간
    // tp[i][1] -> p : 상담을 했을때 받을 수 있는 금액
    int ** tp = (int **)malloc(sizeof(int *) * n);
    for (int i = 0; i < n; i++) {
        tp[i] = (int *)malloc(sizeof(int) * 2);
        scanf("%d %d", &tp[i][0], &tp[i][1]);
    }
    
    int tempT = 0;
    int tempP = 0;
    while(cur < n) {
        tempT = tp[cur][0];
        tempP = tp[cur][1];
        
        answer += tp[cur][1];
        for(int next = cur + 1; next <= cur + tp[cur][0] && next + tp[next][0] <= n; next++) {
            if (tempP < tp[next][1]) {
                cur = next;
            }
        }
    }
    
    printf("\n%d\n", answer);
    return 0;
}


