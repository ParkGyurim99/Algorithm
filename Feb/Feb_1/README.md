- **2022.01.30. ~ 2022.02.05.**
    
    ### 문제 1 : [키패드 누르기](https://programmers.co.kr/learn/courses/30/lessons/67256)
    
    ```swift
    import Foundation
    
    struct location {
        var x : Int
        var y : Int
        
        init(_ x : Int, _ y : Int) {
            self.x = x
            self.y = y
        }
    }
    
    func solution(_ numbers:[Int], _ hand:String) -> String {
        var result : String = ""
        var lLocation : location = .init(3, 1)
        var rLocation : location = .init(3, 3)
        var h = Array(hand)[0]
        
        for n in numbers {
            var p = n / 3
            var q = n % 3
            if q == 0 {
                p -= 1
                q = 3
            }
            if n == 0 {
                p = 3
                q = 2
            }
            
            switch q {
                case 1 :
                    h = "l"
                case 3 :
                    h = "r"
                default : // q == 2
                    if abs(lLocation.x - p) + abs(lLocation.y - q) < abs(rLocation.x - p) + abs(rLocation.y - q) {
                        h = "l" // 왼손이 더 가까울때
                    } else if abs(lLocation.x - p) + abs(lLocation.y - q) == abs(rLocation.x - p) + abs(rLocation.y - q) {
                        h = Array(hand)[0]
                    } else {
                        h = "r" // 오른손이 더 가까울때
                    }
            }
            
            switch h {
                case "r" :
                    rLocation = location(p, q)
                    result += "R"
                case "l" :
                    lLocation = location(p, q)
                    result += "L"
                default : break
            }
        }
        
        return result
    }
    ```
    
    - 접근
        
        ```swift
        /*
        # [row, col] => row * 3 + col (1...3)
         
         1    2     3   -> 0+1 0+2 0+3
         4    5     6   -> 3+1 3+2 3+3
         7    8     9   -> 6+1 6+2 6+3
         *    0     #
        왼손 가까운 손 오른손
         
         - 3으로 나눴을때 나머지가 1 : 왼손
         - 3으로 나눴을때 나머지가 2 : 가까운 손
         - 3으로 나눴을때 나머지가 0 : 오른손
         
        이동은 상하좌우 1칸씩
        거리가 같으면 편한 손 사용
         
        */
        ```
        
    - 상하좌우로 1칸식 움직이는 거리를 계산하기 때문에 **x좌표 차이 + y좌표 차이로 거리 계산**
    - 예외처리
        - 3으로 나누기 때문에 나머지가 0일 경우 → 몫을 1 줄이고 나머지 3으로 처리
        - 누를 숫자가 0 일 경우 규칙이 없기때문
    - **Test Result**
        
        ![Untitled](parkgyurim%20d2376/Untitled%206.png)
        
    
    ---
    
    ### 문제 2 : [큰 수 만들기](https://programmers.co.kr/learn/courses/30/lessons/42883)
    
    ```swift
    import Foundation
    
    func solution(_ number:String, _ k:Int) -> String {
        var result : [String] = []
        let source = number.map { String($0) }
        let length = number.count - k
        
        var maxIndex = 0
        var startIndex = 0
        
        while(result.count < length) {
            maxIndex = startIndex
            
            if startIndex == k + result.count {
                result += source[startIndex...]
                return result.joined()
            }
            for i in startIndex...(source.count - (length - result.count)) {
               if source[i] == "9" {
                   maxIndex = i
                   break
               } else if source[maxIndex] < source[i] { maxIndex = i }
            }
            
            result.append(source[maxIndex])
            startIndex = maxIndex + 1
        }
        
        return result.joined()
    }
    ```
    
    - 앞에 배열을 삭제하는 방식에서 테케 10번 절대 통과 못하길래, 필요 없는 배열을 날리지않고 startIndex 를 움직이는 방식을 사용
    - 타입 캐스팅이 생각보다 많은 시간을 사용하는 듯, 굳이 정수형 변환 없이 문자 그대로도 대소비교가 됨.
    - **Test Result**
        
        ![스크린샷 2022-02-04 21.31.56.png](parkgyurim%20d2376/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-02-04_21.31.56.png)
        
    
    - 배열 삭제 방식
        
        ```swift
        import Foundation
        
        func solution(_ number:String, _ k:Int) -> String {
         var result : [String] = []
         var source = number.map { String($0) } //Array(number) -> [Charater]
         let length = number.count - k
         if length == 0 { return number }
         var maxIndex = 0
        
         while(result.count < length) {
             maxIndex = 0
             if source.count == length - result.count { // Test 7,9
                 result += source
                 return result.joined()
             }
             for i in 0...(source.count - (length - result.count)) {
                 if source[i] == "9" {
                     maxIndex = i
                     break
                 } else if source[maxIndex] < source[i] { maxIndex = i }
             }
             result.append(source[maxIndex])
             source.removeFirst(maxIndex + 1)
             //result += source.removeFirst()
         }
         
         return result.joined()
        }
        ```
        
        ![스크린샷 2022-02-04 20.45.19.png](parkgyurim%20d2376/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2022-02-04_20.45.19.png)
        
        처음에 테스트 7~10에서 시간초과
        
        1. Type Casting 을 줄여서 7,9 해결
        2. 9일때 early exit 조건을 줘서 8 해결
        3. 10번은 씨~발새끼임
    
    ---
    
    ### 문제 3 : [캐시](https://programmers.co.kr/learn/courses/30/lessons/17680)
    
    ```swift
    import Foundation
    
    func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
        var time = 0
        var cache : [String] = []
        var city = ""
    
        if cacheSize == 0 { return 5 * cities.count } // 캐시 0 예외처리
    
        var index = 0
        while(cache.count < cacheSize) { 
            city = cities[index].lowercased()
            
            if cache.contains(city) { // cache hit - remove and append
                cache.remove(at: cache.firstIndex(of: city)!)
                cache.append(city)
                time += 1
            } else { // cache miss - append
                cache.append(city)
                time += 5
            }        
            index += 1
        }
        for n in index..<cities.count {
            city = cities[n].lowercased()
    
            if cache.contains(city) { // cache hit - remove and append
                cache.remove(at: cache.firstIndex(of: city)!)
                cache.append(city)
                time += 1
            } else { // cache miss - removeFirst and append
                cache.removeFirst()
                cache.append(cities[n].lowercased())
                time += 5
            }
        }
    
        return time
    }
    ```
    
    - 캐시가 가득 차기 전에 hit 나는 경우도 생각. ***승열아 이거 참고해 !!***
    - **Test Result**
        
        ![Untitled](parkgyurim%20d2376/Untitled%207.png)
        
    
    ---
    
    ### 보너스 문제 : [체육복](https://programmers.co.kr/learn/courses/30/lessons/42862)
    
    ```swift
    import Foundation
    
    func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
        var stdt : [Int] = Array(repeating: 1, count: n + 2)
    		// padding [0], [n+1]
        stdt[0] = 0
        stdt[n + 1] = 0
        
        for i in lost { stdt[i] -= 1 }
        for i in reserve { stdt[i] += 1 }
        for i in 1...n {
            if stdt[i] == 0 { 
                if stdt[i-1] == 2 {
                    stdt[i - 1] -= 1
                    stdt[i] = 1
                    continue
                } else if stdt[i+1] == 2 {
                    stdt[i + 1] -= 1
                    stdt[i] = 1
                }
            }
        }
        
        return stdt.filter{$0 > 0}.count
    }
    ```
    
    - **Test Result**
        
        ![Untitled](parkgyurim%20d2376/Untitled%208.png)

