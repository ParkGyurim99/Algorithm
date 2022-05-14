//  구명보트
//  https://programmers.co.kr/learn/courses/30/lessons/42885

def solution(people, limit):
    answer = 0
    people.sort()
    size = len(people)
    visited = [False] * size
    visitedCount = 0
    index = 0
    rearIndex = size
    
    while visitedCount < size :
        if people[index] > limit // 2 :
            answer += visited.count(False)
            break
        elif visited[index] == False :
            visited[index] = True
            visitedCount += 1

            for i in range(index + 1, rearIndex) :
                if people[index] + people[rearIndex - i] <= limit and not visited[rearIndex - i] :
                    visited[rearIndex - i] = True
                    visitedCount += 1
                    break
                if people[index] + people[i] == limit and not visited[i] :
                    visited[i] = True
                    visitedCount += 1
                    break
                    
            answer += 1
            
        index += 1
        
    return answer

정확성  테스트
테스트 1 〉	통과 (408.68ms, 10.4MB)
테스트 2 〉	통과 (0.29ms, 10.4MB)
테스트 3 〉	통과 (247.49ms, 10.3MB)
테스트 4 〉	통과 (143.36ms, 10.3MB)
테스트 5 〉	통과 (71.31ms, 10.2MB)
테스트 6 〉	통과 (8.26ms, 10.2MB)
테스트 7 〉	통과 (53.33ms, 10.2MB)
테스트 8 〉	통과 (0.01ms, 10.3MB)
테스트 9 〉	통과 (2.87ms, 10.2MB)
테스트 10 〉	통과 (191.47ms, 10.3MB)
테스트 11 〉	통과 (83.05ms, 10.3MB)
테스트 12 〉	통과 (144.81ms, 10.1MB)
테스트 13 〉	통과 (111.63ms, 10.3MB)
테스트 14 〉	통과 (0.37ms, 10.3MB)
테스트 15 〉	통과 (0.04ms, 10.4MB)
효율성  테스트
테스트 1 〉	실패 (시간 초과)
테스트 2 〉	실패 (시간 초과)
테스트 3 〉	실패 (시간 초과)
테스트 4 〉	통과 (3.86ms, 10.7MB)
테스트 5 〉	통과 (3.69ms, 10.7MB)

