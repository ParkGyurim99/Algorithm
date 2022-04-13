- 2022.02.06. ~ 2022.02.12.
    
    ### 문제 1 : [숫자 문자열과 영단어](https://programmers.co.kr/learn/courses/30/lessons/81301)
    
    ```swift
    func solution(_ s:String) -> Int {
        let wordToNum : [String : String] = ["zero" : "0", "one" : "1", "two" : "2", "three" : "3", "four" : "4",
                                         "five" : "5", "six" : "6", "seven" : "7", "eight" : "8", "nine" : "9" ]
        let str = Array(s)
        var result = ""
        var temp = ""
        
        for e in str {
            if "1234567890".contains(e) { // if e.isNumber {
                result.append(e)
            } else {
                temp += String(e)
                if temp.count > 2 {
                    if let n = wordToNum[temp] {
                        result += n
                        temp = ""
                    }
                }
            }
        }
        
        return Int(result)!
    }
    ```
    
    - **Test Result**
        
        ![Untitled](parkgyurim%20d2376/Untitled%209.png)
        
    
    - ***replacingOccurences(of : String, with : String)***
        
        ```swift
        func solution2(_ s:String) -> Int {
            let wordToNum : [String : String] = ["zero" : "0", "one" : "1", "two" : "2", "three" : "3", "four" : "4",
                                             "five" : "5", "six" : "6", "seven" : "7", "eight" : "8", "nine" : "9" ]
            var result = s
            
            for (key, value) in wordToNum {
                result = result.replacingOccurrences(of: key, with: value)
            }
            
            return Int(result)!
        }
        ```
        
        ![Untitled](parkgyurim%20d2376/Untitled%2010.png)
        
        ![Untitled](parkgyurim%20d2376/Untitled%2011.png)
        
    
    ---
    
    ### 문제 2 : [최소값 만들기](https://programmers.co.kr/learn/courses/30/lessons/12941)
    
    ```swift
    func solution(_ A:[Int], _ B:[Int]) -> Int {
        var ans = 0
        let arrA = A.sorted()
        let arrB = B.sorted(by: {$0 > $1})
        for i in 0..<A.count { ans += arrA[i] * arrB[i] }
    
        return ans
    }
    ```
    
    - **Test Result**
        
        ![Untitled](parkgyurim%20d2376/Untitled%2012.png)
        
    
    ---
    
    ### 문제 3 : [기능개발](https://programmers.co.kr/learn/courses/30/lessons/42586)
    
    ```swift
    func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
        var result : [Int] = []
        let remainProgress = progresses.map { 100 - $0 }
        let size = progresses.count
        var remainDay : [Int] = []
        for i in 0..<size {
            var remain = remainProgress[i] / speeds[i]
            if remainProgress[i] % speeds[i] != 0 { remain += 1 }
            remainDay.append(remain)
        }
        var k = remainDay[0]
        var count = 1
        for i in 1..<size {
            if remainDay[i] > k {
                k = remainDay[i]
                result.append(count)
                count = 1
            } else { count += 1 }
        }
        result.append(count)
        
        return result
    }
    ```
    
    - **Test Result**
        
        ![Untitled](parkgyurim%20d2376/Untitled%2013.png)
        
        11 min
        
    
    ---
    
    ### 문제 4 : [2 * n 타일링](https://programmers.co.kr/learn/courses/30/lessons/12900)
    
    ```swift
    func factorial(_ n : Int) -> Int {
        if n == 0 { return 1 }
        else { return n * factorial(n - 1) }
    }
    
    func solution(_ n : Int) -> Int {
        var ans = 0
        for i in 0...n/2 { ans += factorial(n - i) / (factorial(i) * factorial(n - 2 * i)) }
        
        return ans
    }
    ```
    
    ```python
    def numComb(n, r) :
        var1 = 1
        var2 = 1
        if r == 0 : return 1
    
        for i in range(0, r) :  var1 *= n - i
        for i in range(1, r+1) :  var2 *= i
            
        return var1 // var2
        
    def solution(n):
        answer = 0
        
        for i in range(0, int(n/2) + 1) : 
            # j = n - 2*i
            if 3*i > n : answer += numComb(n-i, n - 2*i)
            else : answer += numComb(n-i, i)
            answer %= 1000000007
            
        return answer
    ```

