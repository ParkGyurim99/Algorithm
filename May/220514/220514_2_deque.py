//  구명보트
//  https://programmers.co.kr/learn/courses/30/lessons/42885

from collections import deque

def solution(people, limit):
    answer = 0
    queue = deque(sorted(people))
    
    while len(queue) > 1 :
        if queue[0] + queue[-1] <= limit :
            queue.popleft()
            queue.pop()
        else :
            queue.pop()
            
        answer += 1
    
    return answer if not queue else answer + 1


정확성  테스트
테스트 1 〉	통과 (1.99ms, 10.2MB)
테스트 2 〉	통과 (1.06ms, 10.3MB)
테스트 3 〉	통과 (1.35ms, 10.2MB)
테스트 4 〉	통과 (0.78ms, 10.2MB)
테스트 5 〉	통과 (0.70ms, 10.2MB)
테스트 6 〉	통과 (0.42ms, 10.1MB)
테스트 7 〉	통과 (0.38ms, 10.1MB)
테스트 8 〉	통과 (0.07ms, 10.2MB)
테스트 9 〉	통과 (0.09ms, 10.2MB)
테스트 10 〉	통과 (0.71ms, 10.3MB)
테스트 11 〉	통과 (1.01ms, 10.2MB)
테스트 12 〉	통과 (0.56ms, 10.3MB)
테스트 13 〉	통과 (0.88ms, 10.4MB)
테스트 14 〉	통과 (1.01ms, 10.1MB)
테스트 15 〉	통과 (0.10ms, 10.1MB)
효율성  테스트
테스트 1 〉	통과 (11.12ms, 11.1MB)
테스트 2 〉	통과 (13.16ms, 11.1MB)
테스트 3 〉	통과 (10.99ms, 11MB)
테스트 4 〉	통과 (12.54ms, 11.2MB)
테스트 5 〉	통과 (11.74ms, 11MB)

