def solution() :
    k, n = input().split()
    k = int(k) # max k = 10000
    n = int(n) # max n = 1000000
    line = [int(input()) for _ in range(k)]            
    
    start = 0
    end = int(sum(line) / n)
    while (start <= end) :
        mid = (start + end) // 2
        if mid == 0 : mid = 1
        temp =  0
        for i in range(k) : temp += int(line[i] / mid)
        if temp == n :
            for c in range(mid, end) :
                temp = sum([int(line[i] / c) for i in range(k)])
                if temp == n - 1 :
                    print(c - 1)
                    break
            
            break
        
        if temp < n : end = mid
        else : start = mid

solution()