- **2022.01.23. ~ 2022.01.29.**
    
    ### 문제 1 : [소수 만들기](https://programmers.co.kr/learn/courses/30/lessons/12977)
    
    ***<Swift>*** 
    
    ```swift
    import Foundation
    
    func solution(_ nums:[Int]) -> Int { 
        return getCombination(nums)
    }
    
    func isPrime(n : Int) -> Bool {
        for i in 2...n/2 { 
            if n % i == 0 { return false } 
        }
        
        return true
    }
    
    func getCombination(_ source : [Int]) -> Int {
        var sourceCopy = source
        var count = 0
        
        for _ in 0..<source.count-2 { // count - n + 1
            let src1 = sourceCopy.removeFirst()
            
            for j in 0..<sourceCopy.count {
                let src2 = sourceCopy.removeFirst()
                
                for i in 0..<sourceCopy.count-j {                
                    if isPrime(n: (sourceCopy[i] + src1 + src2)) { count += 1 }
                }
                sourceCopy.append(src2)
            }
        }
        
        return count
    }
    ```
    
    - Combination 수가 3개일때만 한정,,;;
    - Combination 구현 방법에 대해서 조금 더 고민해보자. → Recursive?
    - Test Result
        
        ![Untitled](parkgyurim%20d2376/Untitled%203.png)
        
    
    ***<Python>***
    
    ```python
    import itertools
    
    def solution(nums):
        answer = 0
        combinations = itertools.combinations(nums, 3)
        
        for combi in list(combinations) :
            if isPrime(sum(combi)) : 
                answer += 1
    
        return answer
    
    def isPrime(num) :
        for i in range(2, int(num/2)) :
            if num % i == 0 : return False 
        
        return True
    ```
    
    - Test Result
        
        ![Untitled](parkgyurim%20d2376/Untitled%204.png)
        
    
    ---
    
    ### 문제 2 : **[뉴스 클러스터링](https://programmers.co.kr/learn/courses/30/lessons/17677?language=swift)**
    
    ***<Swift>***
    
    ```swift
    import Foundation
    
    func solution(_ str1:String, _ str2:String) -> Int {
        let src1 = Array(str1.lowercased())
        let src2 = Array(str2.lowercased())
        
        var arr1 = [String]()
        var arr2 = [String]()
        
        for i in 0..<src1.count-1 {
            if "abcdefghijklmnopqrstuvwzxyz".contains(src1[i]) && "abcdefghijklmnopqrstuvwzxyz".contains(src1[i + 1]) {
                arr1.append(String(src1[i]) + String(src1[i+1]))
            }
        }
        
        for i in 0..<src2.count-1 {
            if "abcdefghijklmnopqrstuvwzxyz".contains(src2[i]) && "abcdefghijklmnopqrstuvwzxyz".contains(src2[i + 1]) {
                arr2.append(String(src2[i]) + String(src2[i+1]))
            }
        }
    
        var multiSet1 : [String : Int] = [ : ]
        var multiSet2 : [String : Int] = [ : ]
    
        for e in arr1 {
            if let _ = multiSet1[e] { multiSet1[e]! += 1 }
            else { multiSet1[e] = 1 }
        }
    
        for e in arr2 {
            if let _ = multiSet2[e] { multiSet2[e]! += 1 }
            else { multiSet2[e] = 1 }
        }
        
        var multiSetForUnion : [String : Int] = [ : ]
        var multiSetForInterSection : [String : Int] = [ : ]
        
        for (key, value) in multiSet1 {
            if let _ = multiSet2[key] {
                multiSetForUnion[key] = multiSet2[key]! > value ? multiSet2[key]! : value
                multiSetForInterSection[key] = multiSet2[key]! > value ? value : multiSet2[key]!
            } else { multiSetForUnion[key] = value }
        }
    
        for (key, value) in multiSet2 {
            if let _ = multiSet1[key] {
                multiSetForUnion[key] = multiSet1[key]! > value ? multiSet1[key]! : value
                multiSetForInterSection[key] = multiSet1[key]! > value ? value : multiSet1[key]!
            } else { multiSetForUnion[key] = value }
        }
        
        if multiSetForInterSection.isEmpty && multiSetForUnion.isEmpty {
            return 65536
        } else if multiSetForInterSection.isEmpty || multiSetForUnion.isEmpty {
            return 0
        } else {
            var unionCount = 0
            var intersectionCount = 0
            
            multiSetForUnion.forEach { (key, value) in unionCount += value }
            multiSetForInterSection.forEach { (key, value) in intersectionCount += value }
            
            return Int(Double(intersectionCount) / Double(unionCount) * 65536)
        }
    }
    ```
    
    - ***multiSet*** : 길이 2로 슬라이싱된 문자열을 담기위한 다중 집합 표현 딕셔너리
        
        → **key** : 문자열, **value** : 개수
        
    - ***multiSetForUnion*** : 두 다중집합의 합집합 (Dictionary)
        
        → 공동된 key의 value중 높은 값, 그리고 공동으로 갖고 있지 않은 key도 추가한다.
        
    - ***multiSetForIntersection*** : 두 다중집합의 교집합 (Dictionary)
        
        → 공동된 key의 value중 낮은 값
        
    - Print Example
        - ***Case 1 : "FRANCE", "french"***
            
            arr1 : **["fr", "ra", "an", "nc", "ce"]**
            
            arr2 : **["fr", "re", "en", "nc", "ch"]**
            
            multiSetForUnion : **["en": 1, "ra": 1, "an": 1, "nc": 1, "ce": 1, "ch": 1, "fr": 1, "re": 1]**
            
            multiSetForIntersection : **["fr": 1, "nc": 1]**
            
            → 2 / 8 * 65536 ****= **16384**
            
        
        - *C**ase 2 : "handshake", "shake hands"***
            
            arr1 : **["ha", "an", "nd", "ds", "sh", "ha", "ak", "ke"]**
            
            arr2 : **["sh", "ha", "ak", "ke", "ha", "an", "nd", "ds"]**
            
            multiSetForUnion : **["ke": 1, "nd": 1, "sh": 1, "ak": 1, "ds": 1, "ha": 2, "an": 1]**
            
            multiSetForIntersection : **["ke": 1, "ha": 2, "an": 1, "ds": 1, "sh": 1, "ak": 1, "nd": 1]**
            
            → 8 / 8 * 65536 = **65536**
            
    - Test Result
        
        ![Untitled](parkgyurim%20d2376/Untitled%205.png)
        
    
    ---
    
    ### 문제 3 : [멀쩡한 사각형](https://programmers.co.kr/learn/courses/30/lessons/62048)
    
    ```swift
    import Foundation
    
    func solution(_ w : Int, _ h : Int) -> Int64 {
        var answer : Int64 = 0
    
        for x in 1..<w { answer += Int64(Double(h) * Double(x) / Double(w)) }
    
        return answer * 2
    }
    ```
    
    - **y = kx 직선에 x 값을 대입하며 나온 y 값을 내림한 값이 박스의 개수. 승열이 베끼려고 들어왔나  스위프트 읽을줄 모른다 시발련아**
    - Floating-Point Precision problem
        - 원래 코드에선 기울기 변수 gradient = (h / w) 를 선언하고 Int64(gradient * x)
            
            → Test Case #6 실패 (w와 h값의 차이가 큰 경우로 예상)
            
        
        ✓ **Floting-Point는 연산할수록 부정확한 값을 가지게 된다.**
        
        ✓ 나누기가 소수점 아래 값을 만들 확률이 높기 때문에 나눈 후 곱하기를 하면 좀 더 정확한 값 도출
        
    - Test Result
        
        ![스크린샷 2022-01-28 03.58.37.png](parkgyurim%20d2376/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-01-28_03.58.37.png)
        
    - 초기 코드 (시간 초과)
        
        ```swift
        import Foundation
        
        func solution(_ w : Int, _ h : Int) -> Int64 {
            var answer : Int64 = 0
            let inclination : Double = Double(h) / Double(w) // y = inclination * x
            
            for y in 1..<h {
                for x in 1..<w {
                    if Double(y) >= inclination * Double(x) { answer += 1 }
                }
            }
            
            return answer * 2
        }
        ```
        
        - nested for loop 에서 첫 값이 맞으면 early exit을 해봤는데 시간은 반틈정도로 줄일 수 있었지만 테스트케이스[12, 17] 여전히 시간 초과
        - source size가 너무 크다. (w, h 1억 이하의 자연수)
        - 굳이 모든 (x,y) 값을 접근할 필요가 없을까 생각 → 해결
        - Test Result
            
            ![스크린샷 2022-01-28 02.55.36.png](parkgyurim%20d2376/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-01-28_02.55.36.png)


