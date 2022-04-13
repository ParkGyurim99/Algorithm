# n = 4
# factory = [[-20, 5], [10,45], [-10, 35], [30,40]]
# n = 4
# factory = [[1,2], [2,3], [3,4], [4,5]]

n = 3
factory = [[1,1], [1,1], [1,1]]

def solution() : 
    answer = 0
    factorySet = [[0 for col in range(100)] for row in range(n)]
    visited = [False for _ in range(n)]
    
    for i in range(n) :
        factorySet[i] = set([x for x in range(factory[i][0], factory[i][1] + 1)])
    
    for i in range(n) :
        visited[i] = True
        for j in range(n) :
            if i == j or visited[j] : continue
            
            temp = factorySet[i].intersection(factorySet[j])
            if len(temp) != 0 : visited[j] = True
            else : answer += 1
        
    print(answer)

solution()