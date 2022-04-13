- **2022.01.16. ~ 2022.01.22.**
    
    ### 문제 1 : [크레인 인형뽑기 게임](https://programmers.co.kr/learn/courses/30/lessons/64061)
    
    ```swift
    import Foundation
    
    func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
        var temp = board
        var result : [Int] = []
        var count = 0
        
        for n in moves {
            for i in 0..<board.count {
                if temp[i][n-1] != 0 {
                    if (result.last == temp[i][n-1]) {
                        count += 2
                        result.remove(at : result.count-1)
                    } else { result.append(temp[i][n-1]) }
                    
                    temp[i][n-1] = 0
                    break
                }
            } 
        }
        
        return count
    }
    ```
    
    - 배열 관련 함수 숙지하기
        
        ```swift
        var stacks: [[Int]] = Array(repeating: [], count: board.count)
        Array().enumerated().forEach { ... }
        Array().removeLast(n)
        Array().removeFirst(n)
        Array().popLast()
        
        등등
        ```
        
    - Test Result
        
        ![Untitled](parkgyurim%20d2376/Untitled.png)
        
    
    ---
    
    ### 문제 2 : [더 맵게](https://programmers.co.kr/learn/courses/30/lessons/42626)
    
    ```python
    import heapq
    
    def solution(scoville, K):
        heapq.heapify(scoville)
        count = 0
        
        while(scoville[0] < K) :
            if len(scoville) == 1 : return -1
            heapq.heappush(scoville, mix(heapq.heappop(scoville), heapq.heappop(scoville)))
            count += 1
        
        if count == 0 :
            return - 1
        return count
    
    def mix(a, b) :
        if a > b : 
            return 2*a + b
        else :
            return a + 2*b
    ```
    
    - 자료구조 힙 개념
        
        [https://gmlwjd9405.github.io/2018/05/10/data-structure-heap.html](https://gmlwjd9405.github.io/2018/05/10/data-structure-heap.html)
        
    - python module - heapq
        - *heapq.heapify* : **최소** 힙 배열 생성
        - *heapq.heappop([array], _)* : 삭제
        - *heapq.heappush([array], _)* : 삽입
    - 테스트 케이스 1, 3, 8, 14 : 배열 요소가 1개일때 예외 처리, 안하면 index out of range
    - Test Result
        
        ![Untitled](parkgyurim%20d2376/Untitled%201.png)
        
    
    ---
    
    ### 문제 3 :  [오픈채팅방](https://programmers.co.kr/learn/courses/30/lessons/42888?language=swift)
    
    ```swift
    import Foundation
    
    func solution(_ record:[String]) -> [String] {
        var result : [String] = []
        var commands : [[Substring]] = []
        var users : [String : String] = [:]
    
        for str in record { commands.append(str.split(separator: " ")) }
        
        for str in commands {
            if str.count > 2 { users[String(str[1])] = String(str[2]) }
        }
        
        for cmd in commands {
            if cmd[0] == "Change" { continue }
            switch String(cmd[0]) {
                case "Enter" : result.append(users[String(cmd[1])]! + "님이 들어왔습니다.")
                case "Leave" : result.append(users[String(cmd[1])]! + "님이 나갔습니다.")
                default: print("")
            }
        }
        
        return result
    }
    ```
    
    - Change와 Enter는 같은 동작. 단, Change는 출력을 하지 않음.
    - record : [String] → commands [[SubStirng]] // [action] [uid] [nickname]
        - String Tokenizing Function
            - components(seperatedBy : “ ”)
                
                : return type이 [String]
                
            - split(separator : “ “)
                
                : return type이 [SubString]
                
        - components 함수를 사용했으면 String Type Casting을 줄일 수 있었음.
        - 근데 components 함수를 사용했을때 더 많은 실행시간이 걸렸음.
    - users : Dictionary 를 사용해서 command 배열 순회하며 최신화된 이름 저장
    - Test Result
        
        ![Untitled](parkgyurim%20d2376/Untitled%202.png)
        

