- **2022.01.09. ~ 2022.01.15.**
    
    ### 문제 1 : K번째 수
    
    ```swift
    import Foundation
    
    func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
        var result : [Int] = []
        for cmd in commands {        
            result.append(array[(cmd[0] - 1)...(cmd[1] - 1)].sorted()[cmd[2] - 1])
        }
        
        return result
    }
    ```
    
    ---
    
    ### 문제 2 : 거리두기 확인하기
    
    ```swift
    import Foundation
    
    func solution(_ places:[[String]]) -> [Int] {
        var result = [Int]()
        for place in places { result.append(solution2(place)) }
        
        return result
    }
    
    func solution2(_ place : [String]) -> Int {
        var lines : [[Character]] = []
        lines.append(["M", "M", "M", "M", "M", "M", "M"])
        for i in place.indices {
            if place[i].contains("PP") || place[i].contains("POP") { return 0 }
            let temp = "M" + place[i] + "M"
            lines.append(Array(temp))
        }
        lines.append(["M", "M", "M", "M", "M", "M", "M"])
    
        for i in 1..<6 {
            for j in 1..<6 {
                if lines[i][j] == "P" {
                    if lines[i-1][j-1] == "P" && lines[i-1][j] == "O" { return 0 }
                    else if lines[i-1][j] == "O" && lines[i-1][j+1] == "P" { return 0 }
                    else if lines[i+1][j-1] == "P" && lines[i+1][j] == "O" { return 0 }
                    else if lines[i+1][j] == "O" && lines[i+1][j+1] == "P" { return 0 }
                    else if lines[i+1][j] == "P" { return 0 }
                    else if lines[i+1][j] == "O" && lines[i+2][j] == "P" { return 0 }
                }
            }
        }
        return 1
    }
    ```
    
    - M-Array for **padding** outside
    - 고차원적인 풀이 필요성 느끼지 못함 ➡️ 실패 케이스 규정 후 함수 리턴
        - 실패 케이스인 경우 조기에 함수 리턴
        - ‘X’ (파티션) 을 고려하지 않아도 됨.
        
    
    <aside>
    💡 실패 케이스
    
    </aside>
    
    - For **Horizontal** test
    
    ```swift
    ***if place[i].contains("PP") || place[i].contains("POP") { return 0 }***
    ```
    
    - For **Vertical** test
    
    ```swift
    ***else if lines[i+1][j] == "P" { return 0 } 
    else if lines[i+1][j] == "O" && lines[i+2][j] == "P" { return 0 }***
    ```
    
    - For **Diagonal** test
    
    ```swift
    ***if lines[i-1][j-1] == "P" && lines[i-1][j] == "O" { return 0 }
    else if lines[i-1][j] == "O" && lines[i-1][j+1] == "P" { return 0 }
    else if lines[i+1][j-1] == "P" && lines[i+1][j] == "O" { return 0 }
    else if lines[i+1][j] == "O" && lines[i+1][j+1] == "P" { return 0 }***
    ```
    
    ---
    
    ### 문제 3 : H - Index
    
    ```swift
    func solution(_ citations:[Int]) -> Int {
        let sortedCitation : [Int] = citations.sorted().reversed()
        var minNum = 0
        var endNum = 0
        var minIndex = -1
            
        for index in 0..<sortedCitation.count {
            if index + 1 >= sortedCitation[index] {
                minNum = sortedCitation[index]
                minIndex = index
                break
            }
        }
        if minIndex == 0 { return 0 } 
        else if minIndex != -1 { endNum = sortedCitation[minIndex - 1] } 
        else { endNum = sortedCitation[sortedCitation.endIndex - 1] }
        
        var result = 0
        for i in minNum...endNum {
            var count = 0
            for e in sortedCitation { if e >= i { count += 1 } }
            if count >= i { result = i }
        }
        
        return result
    }
    ```
    
    - **Array Index**를 통한 접근
        - 내림차순으로 정렬된 배열의 인덱스 → 인용 횟수와 같음

