# n = 5
# t = 3
# p = [0,1,2,3,6]
# s = [1,2,3,2,1]

n = 5
t = 10000
p = [0,1,2,3,6]
s = [1,2,3,2,1]

# n = 5
# t = 10000
# p = [0,1,2,3,6]
# s = [1,2,3,3,2]

def solution() :
    global p
    for i in range(t) : # 각 분마다 생각
        buffer = p
        bufferBoolean = [buffer[i] < buffer[i + 1] for i in range(n - 1)]
        added = [p[i] + s[i] for i in range(n)]
        addedBoolean = [added[i] < added[i + 1] for i in range(n - 1)]
        for k in range(n - 1) :
            if bufferBoolean[k] != addedBoolean[k] :
                if added[k] < added[k+1] :
                    p[k] = added[k]
                    p[k+1] = added[k]
                else :
                    p[k] = added[k+1]
                    p[k+1] = added[k+1]
                
                if s[k] < s[k+1] :
                    s[k] = s[k]
                    s[k+1] = s[k]
                else :
                    s[k] = s[k+1]
                    s[k+1] = s[k+1]
        p = added
    
    print(p)
    return len(set(p))


print(solution())