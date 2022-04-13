def solution(maps):
    map = maps
    n = len(maps)
    m = len(maps[0])
    
    map = [ [0] * (m + 2) ]
    for i in range(n) : map.append([0] + maps[i] + [0])
    map.append( [0] * (m + 2) )
    
    buffer = [(1,1)]
    
    while buffer :
        temp = buffer
        
        buffer = []
        for cur in temp :
            if cur[0] == n and cur[1] == m : 
                return map[cur[0]][cur[1]]

            if map[cur[0]][cur[1] - 1] == 1 : # 왼쪽
                map[cur[0]][cur[1] - 1] = map[cur[0]][cur[1]] + 1
                buffer.append((cur[0], cur[1] - 1))
            if map[cur[0] + 1][cur[1]] == 1 : # 아래
                map[cur[0] + 1][cur[1]] = map[cur[0]][cur[1]] + 1
                buffer.append((cur[0] + 1, cur[1]))
            if map[cur[0] - 1][cur[1]] == 1 : # 위
                map[cur[0] - 1][cur[1]] = map[cur[0]][cur[1]] + 1
                buffer.append((cur[0] - 1, cur[1]))
            if map[cur[0]][cur[1] + 1] == 1 : # 오른쪽
                map[cur[0]][cur[1] + 1] = map[cur[0]][cur[1]] + 1
                buffer.append((cur[0], cur[1] + 1))

    return -1

# from collections import deque
# def solution(maps):
#     map = maps
#     n = len(maps)
#     m = len(maps[0])
    
#     # 위 아래 왼쪽 오른쪽
#     dx = [-1, 1, 0, 0]
#     dy = [0, 0, -1, 1]
    
#     queue = deque([])
#     queue.append([(0, 0)])
    
#     while queue :
#         temp = queue.popleft()
        
#         buffer = []
#         for cur in temp :
#             if cur[0] == (n - 1) and cur[1] == (m - 1) : 
#                 return map[cur[0]][cur[1]]

#             for i in range(4) :
#                 nx = cur[0] + dx[i]
#                 ny = cur[1] + dy[i]
                
#                 if 0<=nx<n and 0<=ny<m :
#                     if map[nx][ny] == 1 : 
#                         map[nx][ny] = map[cur[0]][cur[1]] + 1
#                         buffer.append((nx, ny))

#         if buffer :
#             queue.append(buffer)

#     return -1


# 1
print(
    solution(
        [
            [1,0,1,1,1],
            [1,0,1,0,1],
            [1,0,1,1,1],
            [1,1,1,0,1],
            [0,0,0,0,1]
        ]
    )
)

# 2
print(
    solution(
        [[1,0,1,1,1],[1,0,1,0,1],[1,0,1,1,1],[1,1,1,0,0],[0,0,0,0,1]]
    )
)