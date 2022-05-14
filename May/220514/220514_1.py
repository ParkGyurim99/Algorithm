#  가장 먼 노드
#  Level 3
#  https://programmers.co.kr/learn/courses/30/lessons/49189?language=python3

from collections import deque

def solution(n, edge):
    adjacentNode = {i : [] for i in range(1,n+1)}
    for e in edge : 
        adjacentNode[e[1]].extend([e[0]])
        adjacentNode[e[0]].extend([e[1]])
    
    queue = deque([1])
    queueBuffer = queue
    visited = [False for x in range(n+1)]
    visited[1] = True

    while queue :
        queueBuffer = queue.copy()
        for _ in range(len(queueBuffer)) :
            currentNode = queue.popleft()
            temp = []
            for node in adjacentNode[currentNode] :
                if not visited[node] :
                    temp.extend([node])
                    visited[node] = True
            queue.extend(temp)

    return len(queueBuffer)

print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]), 3)
