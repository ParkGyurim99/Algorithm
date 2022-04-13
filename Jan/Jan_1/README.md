- **2022.01.02. ~ 2022.01.08.**
    
    ### 문제 1 : 완주하지 못한 선수
    
    ```python
    def solution(participant, completion):
        dictionary = dict.fromkeys(participant, 0)
        
        for person in participant :
            dictionary[person] += 1
            
        for person in completion : 
            dictionary[person] -= 1
        
        # value가 1인 key를 찾으면 됨
        for key, value in dictionary.items() :
            if value == 1 : 
                return key
                
        return ""
    ```
    
    - 해시
    
    ---
    
    ### 문제 2 : 로또의 최고 순위와 최저 순위
    
    ```swift
    import Foundation
    
    func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
        var zeroCount = 0, match = 0
        var maxRank : Int {
            if match == 0 && zeroCount == 0 { return 6 }
            return 7 - match - zeroCount
        }
        var minRank : Int {
            if match < 2 { return 6}
            return 7 - match
        }
        
        for n in lottos {
            if n == 0 { zeroCount += 1 }
            else if win_nums.contains(n) { match += 1 }
        }
        
        return [maxRank, minRank]
    }
    ```
    
    ---
    
    ### 문제 3 : 문자열 압축
    
    ```swift
    import Foundation
    
    func solution(_ s:String) -> Int {
        let length = s.count
        var minLength = 1000
        
        for size in 1...length {
            var result = ""
            var i = 0
            while(i < length - size) {
                let startingIndex = s.index(s.startIndex, offsetBy: i)
                let endingIndex = s.index(startingIndex, offsetBy : size)
                let range = startingIndex..<endingIndex
                
                if i % size != 0 {
                    result += s[startingIndex...startingIndex]
                    i += 1
                    continue
                }
                var count = 0
                count = checkRight(str: String(s[startingIndex..<s.endIndex]), word: String(s[range]), wordSize: size, count: &count)
                
                if count <= 1 {
                    result += s[startingIndex...startingIndex]
                    i += 1
                } else {
                    result += "\(count)" + String(s[range])
                    i += count * size
                }
            }
            result += s.substring(from: s.index(s.startIndex, offsetBy: i))
    
            if minLength > result.count { minLength = result.count }
        }
        
        return minLength
    }
    
    func checkRight(str : String, word : String, wordSize : Int, count : inout Int) -> Int {
        if str.count >= wordSize {
            if str[str.startIndex..<str.index(str.startIndex, offsetBy : wordSize)] == word {
                count += 1
                checkRight(str : str.substring(from: str.index(str.startIndex, offsetBy: wordSize)), word : word, wordSize : wordSize, count : &count)
            }
        }
        return count
    }
    ```
    
    - ***if i % size != 0 { ... }*** 부분 :
        - 인덱스 스텝 단위가 사이즈 단위로 만들기 위함
        - 뒤에 추가한 부분이라서 사실상 낭비인 부분
    - ***func checkRight(str : String, word : String, wordSize : Int, count : inout Int) -> Int { ... }***
        - **recursive** function
        - inout keyword는 static constant 대신 function scope 외 부분의 실제 변수 사용하기 위함
        - 해당 인덱스부터 끝까지 검사하고 횟수 (count) 리턴 해주는 함수
        
