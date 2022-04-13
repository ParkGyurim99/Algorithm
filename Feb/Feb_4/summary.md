## 2022.02.20. ~ 2022.02.26.
|번호|레벨|문제이름|링크|문제유형(선택)|
|---|---------|----|---------------------|----------------|
|문제1|Level 2|`타겟 넘버`|https://programmers.co.kr/learn/courses/30/lessons/43165|DFS/BFS|
|문제2|Level 2|`소수 찾기`|https://programmers.co.kr/learn/courses/30/lessons/42839|그리디|
|문제3|Level 2|`위장`|https://programmers.co.kr/learn/courses/30/lessons/42578|해시|
|문제4|Level 3|`가장 먼 노드`|https://programmers.co.kr/learn/courses/30/lessons/49189|그래프|

## 문제 1 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/43165">`타겟 넘버`</a>
```swift
func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result : [Int] = [numbers[0], numbers[0] * -1]
    var buffer : [Int] = []
    
    for n in 1..<numbers.count {
        for i in 0..<result.count {
            buffer.append(result[i] + numbers[n])
            buffer.append(result[i] - numbers[n])
        }
        result = buffer
        buffer.removeAll()
    }

    return result.filter { $0 == target }.count
}
```
> 연산자가 +, - 밖에 없고 순서가 정해져있기때문에 완전 이진 트리 (더한 결과 자식이 음수값, 양수값) 로 구성할 수 있었다.
<details>
<summary><b>Result</b></summary>
<div markdown="1">
<img src = "https://user-images.githubusercontent.com/45387886/155841742-831f2ed3-f8a2-41da-8476-9203e1d438d5.png">
</div>
</details>

## 문제 2 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/42839">`소수 찾기`</a>
```swift
func isPrime(_ n : Int) -> Bool {
    if n == 1 || n == 0 { return false }
    else if n < 4 { return true }
    else {
        for i in 2...Int(sqrt(Double(n))) {
            if n % i == 0 { return false }
        }
    }
    
    return true
}

func Permutation(_ arr : [String], depth : Int, _ res : inout [[String]]) {
    if depth == arr.count { return }
    var buffer : [[String]] = [] // Flush buffer
    
    for i in depth..<arr.count {
        var temp = arr
        temp.swapAt(depth, i)
        
        buffer.append(temp)
    }
    
    if buffer.count == 1 { res += buffer }
    
    _ = buffer.map { Permutation($0, depth: depth + 1, &res) }
}

func Combination(_ arr: [String], _ r: Int, _ res: inout [[String]], _ now: [String] = [String]()) {
    let n = arr.count
    guard n > 0 else { return }
    
    if r == 0 { res.append(now) }
    else if n == r { res.append(now + arr) }
    else {
        Combination(Array(arr[1...]), r - 1, &res, now + [arr.first!])
        Combination(Array(arr[1...]), r, &res, now)
    }
}

func solution(_ numbers:String) -> Int {
    let nums = numbers.compactMap { String($0) }
    
    var combinations : [[String]] = []
    var permutations : [[String]] = []
    
    for r in 1...nums.count { Combination(nums, r, &combinations) }
    
    for comb in combinations { Permutation(comb, depth: 0, &permutations) }
    
    let candidate : [Int] = permutations.compactMap { Int($0.joined()) }
    let candidateSet = Set(candidate)
    
    var count = 0
    _ = candidateSet.map { n in
        if isPrime(n) {
            count += 1
        }
    }
    
    return count
}
```
> Combination으로 가능한 모든 조합을 구하고 Permutation으로 결과 도출
> Permutation 구하는 공식 🔥
>
> <img src = "https://t1.daumcdn.net/cfile/tistory/9975B4335C2E010C0D">
<details>
<summary><b>Result</b></summary>
<div markdown="1">
<img src = "https://user-images.githubusercontent.com/45387886/155841746-107ba059-abd1-445d-a64d-0ab384c3e94a.png">
</div>
</details>

## 문제 3 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/42578">`위장`</a>
```swift
func solution(_ clothes:[[String]]) -> Int {
    var answer = 1
    var numOfClothes : [String : Int] = [:]
    
    for c in clothes {
        if let _ = numOfClothes[c[1]] { numOfClothes[c[1]]! += 1 }
        else { numOfClothes[c[1]] = 1 }
    }
    
    let nums : [Int] = numOfClothes.map { key, value in return value }
    
    nums.forEach { answer *= ($0 + 1) }
    
    return answer - 1
}
```
> 각 옷 종류 + 1 ➡️ 안입는 경우 수 더한것
> 종류별로 곱해서 경우의 수 구하기
> -1 ➡️ 아무것도 안입은 경우
<details>
<summary><b>Result</b></summary>
<div markdown="1">
<img src = "https://user-images.githubusercontent.com/45387886/155841748-c6f1f770-be4a-4011-a231-722ee6212aee.png">
</div>
</details>

### Failure Case
```swift
func Combination(_ arr: [Int], _ r: Int, _ res: inout [[Int]], _ now: [Int] = [Int]()) {
    let n = arr.count
    guard n > 0 else { return }
    
    if r == 0 { res.append(now) }
    else if n == r { res.append(now + arr) }
    else {
        Combination(Array(arr[1...]), r - 1, &res, now + [arr.first!])
        Combination(Array(arr[1...]), r, &res, now)
    }
}

func solution(_ clothes:[[String]]) -> Int {
    var answer = 0
    var numOfClothes : [String : Int] = [:]
    var combinations : [[Int]] = []
    
    for c in clothes {
        if let _ = numOfClothes[c[1]] { numOfClothes[c[1]]! += 1 }
        else { numOfClothes[c[1]] = 1 }
    }
    
    let nums : [Int] = numOfClothes.map { key, value in return value }

    for r in 1...nums.count { Combination(nums, r, &combinations) }
    var result : [Int] = []
    var temp = 0
    for n in combinations {
        temp = 1
        n.forEach { temp *= $0 }
        answer += temp
    }
   
    return answer
}
```
<details>
<summary><b>Result</b></summary>
<div markdown="1">
<img src = "https://user-images.githubusercontent.com/45387886/155841747-f48a9187-9e45-4b79-9a81-5a8fc166487c.png">
</div>
</details>



## 문제 4 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/49189">`가장 먼 노드`</a>
```swift
func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var vertex = edge + edge.map { arr in return [arr[1], arr[0]] }
    vertex.sort { arr1, arr2 in arr1[0] < arr2[0] }
    
    var adjacentNode = Dictionary<Int,[Int]>()
    vertex.forEach { arr in
        if let _ = adjacentNode[arr[0]] { adjacentNode[arr[0]]!.append(arr[1]) }
        else { adjacentNode[arr[0]] = [arr[1]] }
    }
    //print(adjacentNode)
    
    // init
    var nodeQueue = [1]
    var queueBuffer = nodeQueue
    var visited : [Bool] = Array(repeating: false, count: n)
    visited[0] = true
    
    while !nodeQueue.isEmpty {
        queueBuffer = nodeQueue
        
        for _ in 0..<nodeQueue.count {
            let node = nodeQueue.removeFirst()
            //print("\nPopped Node : ", node)
            
            for n in adjacentNode[node]! {
                if visited[n - 1] == false {
                    //print("Append and Toggle \(n - 1)")
                    nodeQueue.append(n)
                    visited[n - 1] = true
                }
            }
        }
    }
    
    return queueBuffer.count
}
```
> 처음에 접근을 DFS로 했어서 Depth를 자꾸 신경쓰고 있어서 BFS 구현이 힘들었음
> 근데 생각해보니 제일 먼 노드들의 개수만 구하면 돼서 마지막 큐의 길이를 구하면 됐음 ㅋㅋ
<details>
<summary><b>Result</b></summary>
<div markdown="1">
<img src = "https://user-images.githubusercontent.com/45387886/155841752-08416932-8fa0-4d6b-965f-7376e31b5bf7.png">
</div>
</details>

### Failure Case - DFS
```swift
var distances : [Int : Int] = [ : ]

func dfs(vertex : [[Int]], visited : [Bool], distance : Int, current : Int, target : Int) {
    let candidate : [[Int]] = vertex.filter { arr in arr[0] == current && visited[current - 1] == false }
    
    if current == target {
        if let d = distances[target] {
            //if distance < d { distances[target] = distance }
            distances[target] = distance
        } else { distances[target] = distance }
        
        return
    } else if visited.allSatisfy({ $0 == true }) { return }
    
    if let d = distances[target] { if distance >= d { return } }
    
    for v in candidate {
        var visitedCopy = visited
        visitedCopy[current - 1] = true
        
        dfs(vertex: vertex, visited: visitedCopy, distance: distance + 1, current: v[1], target: target)
    }
}

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var vertex = edge
    vertex += edge.map { arr in return [arr[1], arr[0]] }
    //vertex.sort { arr1, arr2 in arr1[0] < arr2[0] }
    
    for i in 2...n { dfs(vertex: vertex, visited: Array(repeating: false, count: n), distance: 0, current: 1, target: i) }
    
    var distanceCount : [Int : Int] = [:]
    for (_, value) in distances {
        if let _ = distanceCount[value] { distanceCount[value]! += 1 }
        else { distanceCount[value] = 1 }
    }

    let maxDistance = distanceCount.keys.max()!
    let answer = distanceCount[maxDistance]!
    
    return answer
}
```
<details>
<summary><b>Result</b></summary>
<div markdown="1">
<img src = "https://user-images.githubusercontent.com/45387886/155841750-e775c1db-f6d4-4da7-91d5-8b709a19a09e.png">
</div>
</details>
