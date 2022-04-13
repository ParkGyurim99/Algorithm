//
//  main.c
//  220408_LG
//
//  Created by Park Gyurim on 2022/04/08.
//

#include <stdio.h>
#include <stdlib.h>

int n = 4;
int factory[4][2] = {{-20, 5}, {10, 45}, {-10, 35}, {30,40}}; // {{A, B}, ...} -> A <= B // 건물 중심부 : 0

int solution() {
    int answer = 0;
    int supMin = 100, supMax = -100;
    int ** sets = (int **)malloc(sizeof(int*) * n);
    for (int i = 0; i < n; i++) { sets[i] = (int *)malloc(sizeof(int) * (supMin - supMax)); }
    int index = 0;
    for (int i = 0; i < n; i++) {
        if (factory[i][0] < supMin) { supMin = factory[i][0]; }
        if (factory[i][1] > supMax) { supMax = factory[i][1]; }
        
        index = 0;
        for (int j = factory[i][0]; j <= factory[i][1]; j++, index++) { sets[i][index] = j; }
    }
    
    for (int i = 0; i < n; i++) {
        
        for (int j = 0; j <= factory[i][1] - factory[i][0]; j++) {
            printf("%d ", sets[i][j]);
        }
        printf("\n");
    }
    
    return answer;
}

int main(int argc, const char * argv[]) {
    printf("%d\n",solution());
    
    return 0;
}
