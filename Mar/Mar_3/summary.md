## 2022.03.13. ~ 2022.03.19.
|번호|레벨|문제이름|링크|문제유형(선택)||
|---|---------|----|---------------------|----------------|-|
|문제1|Level 2|`조이스틱`|https://programmers.co.kr/learn/courses/30/lessons/42860|Greedy|😥|
|문제2|Level 3|`순위`|https://programmers.co.kr/learn/courses/30/lessons/49191|Graph|😥|
|문제3|Level 3|`여행경로`|https://programmers.co.kr/learn/courses/30/lessons/43164|탐색|✅|

# 문제 1 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/42860">```조이스틱 (Level 2)```</a>
```swift
let alphabets = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"] // 26

func indexDistance(cur : Int, next : Int, length : Int) -> Int {
    if next > cur {
        let distanceRight = next - cur
        let distanceLeft = cur + length - next
        
        if distanceRight < distanceLeft { return distanceRight }
        else { return distanceLeft }
    } else { // cur > next
        let distanceRight = cur - next
        let distanceLeft = next + length - cur
        
        if distanceRight < distanceLeft { return distanceRight }
        else { return distanceLeft }
    }
}

func alphaDistance(next : String) -> Int {
    let distanceTop = alphabets.firstIndex(of: next)! - alphabets.firstIndex(of: "A")!
    let distanceDown = alphabets.firstIndex(of: "A")! + 26 - alphabets.firstIndex(of: next)!
    if distanceTop < distanceDown { return distanceTop }
    else { return distanceDown }
}

func findNextDistance(cur : Int, candidate : [Int], length : Int) -> (Int, Int) {
    var min = 20
    var minIndex = 0
    
    // Determine Left or Right move
    let S = cur - length/2 < 0 ? cur + length/2 : cur - length/2
    var leftCount = 0
    var rightCount = 0
    
    if cur < S {
        // count left
        for index in S..<length { if candidate.contains(index) { leftCount += 1 } }
        for index in 0..<cur { if candidate.contains(index) { leftCount += 1 } }
        // count right
        for index in cur..<S { if candidate.contains(index) { rightCount += 1 } }
    } else { // S < cur
        // count left
        for index in S..<cur { if candidate.contains(index) { leftCount += 1 } }
        // count right
        for index in S..<length { if candidate.contains(index) { rightCount += 1 } }
        for index in 0..<cur { if candidate.contains(index) { rightCount += 1 } }
    }
    
    var check = false
    
    if leftCount > rightCount { check = false } // -> : minIndex must be larger than cur
    else { check = true } // <- : minIndex must be smaller than cur
    
    for c in (check ? candidate.reversed() : candidate)  {
        let temp = indexDistance(cur: cur, next: c, length: length)
        if temp < min {
            min = temp
            minIndex = c
        }
    }
    
    return (minIndex, min) // next index, distance
}

func solution(_ name:String) -> Int {
    let length = name.count
    let nameCopy = name.map { String($0) }
    var curIndex = 0
    var count = 0
    var indexToManipulate : [Int] = []
    for index in 0..<nameCopy.count { if nameCopy[index] != "A" { indexToManipulate.append(index) } }
    while !indexToManipulate.isEmpty {
        let temp = findNextDistance(cur: curIndex, candidate: indexToManipulate, length: length)
        count += (alphaDistance(next: nameCopy[temp.0]) + temp.1)
        curIndex = indexToManipulate.remove(at: indexToManipulate.firstIndex(of: temp.0)!)
    }

    return count
}
```
> * 방향을 중간에 전환하는 경우까지 해봤는데 .. 테스트 케이스 **3개 (13,23,25)** 가 도저히 안풀린다
> ```
> print(solution("JAZ"), 11)
> print(solution("JEROEN"), 56)
> print(solution("JAN"), 23)
> print(solution("ABAAAAAAAAABB"), 7)
> print(solution("BBABAAAABBBAAAABABB"), 26)
> print(solution("BBAAAAAABBBAAAAAABB"), 20)
> print(solution("BBAABB"), 8)
> print(solution("BBBAAAAABAAAAAAAAAAA"), 12)
> print(solution("BAAAAAAAAAABAAAAAABB"), 13)
> print(solution("AAABBAB"), 7)
> print(solution("BBBBAAAAAB"), 10)
> print(solution("BBBAAAAAAAB"), 8)
> print(solution("AAAZAAZA"), 7)
> print(solution("AAABAAAAAB"), 7)
> ```
> -> 사람들이 올려준 테스트 케이스는 다 맞는데 .. 

<details>
 <summary><b>Result</b></summary>
 <div markdown="1">
<img src = "https://user-images.githubusercontent.com/45387886/159170261-5e41fdf2-3dad-4d3d-bd66-dc5939d99624.png">
 </div>
 </details>
 <hr>

# 문제 2 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/49191">```순위 (Level 3)```</a>
```swift
import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var answer = 0
    var dic : [Int : [Set<Int>]] = [:]
    for i in 1...n { dic[i] = Array(repeating: [], count: 2) }
    
    for r in results {
        dic[r[0]]![0].insert(r[1])
        dic[r[1]]![1].insert(r[0])
    }
        
    func dfsWinner(depth : Int, start : Int, cur : Int, losers : Set<Int>) {
        if dic[cur]![0].isEmpty || depth > n - 2 {
            dic[start]![0] = losers
            return
        }

        for l in dic[cur]![0] { dfsWinner(depth : depth + 1, start : start, cur: l, losers: losers.union(dic[cur]![0])) }
    }
    
    func dfsLoser(depth : Int, start : Int, cur : Int, winners : Set<Int>) {
        if dic[cur]![1].isEmpty || depth > n - 2 {
            dic[start]![1] = winners
            return
        }

        for w in dic[cur]![1] { dfsLoser(depth : depth + 1, start : start, cur: w, winners: winners.union(dic[cur]![1])) }
    }
    
    for (key, value) in dic {
        dfsWinner(depth : 0, start: key, cur: key, losers: value[0])
        dfsLoser(depth : 0, start: key, cur: key, winners: value[1])
    }

    for (_, value) in dic {
        if value[0].count + value[1].count == (n - 1) { answer += 1 }
    }
    
    return answer
}
```
> * **DFS**로 해당 선수가 이긴 선수, 진 선수 찾기 (순위는 절대적이기라고 했기 때문에 A가 B를 이기고 B가 C를 이겼으면, A는 C를 이긴다.)
> * 하지만 결과는 시간초과? Depth 인자를 두고 종료시켜려도 어디선가 걸리는데 다시 찾아봐야함!

<details>
 <summary><b>Result</b></summary>
 <div markdown="1">
<img src = "https://user-images.githubusercontent.com/45387886/159170438-e2aac560-0e0a-43bb-a1aa-f4a93b523595.png">
 </div>
 </details>
 <hr>

# 문제 3 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/43164">```여행경로 (Level 3)```</a>
```swift
func solution(_ tickets:[[String]]) -> [String] {
    var answer : [[String]] = []
    
    func dfs(cur : String, route : [String], tickets : [[String]]) {
        if tickets.isEmpty {
            answer.append(route)
            return
        }
        var nextDest = ""
        
        for index in tickets.indices {
            if tickets[index][0] == cur {
                nextDest = tickets[index][1]
                
                var tempRoute = route
                tempRoute.append(nextDest)
                var tempTicket = tickets
                tempTicket.remove(at: index)
                dfs(cur : tickets[index][1], route: tempRoute, tickets: tempTicket)
            }
        }
        
        if nextDest == "" { return }
    }
    
    dfs(cur : "ICN", route: ["ICN"], tickets: tickets)
    
    answer.sort { arr1, arr2 in
        let temp1 = arr1.joined()
        let temp2 = arr2.joined()
        if temp1 < temp2 { return true }
        else { return false }
    }
    
    return answer[0]
}
```
> * **DFS로 가능한 모든 경로를 탐색!**
> * 현재 공항을 출발지로 하는 티켓을 찾고 다음 목적지를 설정한 후에 해당 티켓을 삭제함 
>   -> 티켓을 모두 소진할때 까지 OR 다음 목적지가 설정되지 않을때까지 DFS 탐색이 이루어짐
> * `만일 가능한 경로가 2개 이상일 경우 알파벳 순서가 앞서는 경로를 return 합니다.` 조건
>   여기서 고민을 했는데.. 경로가 [String] 인 상태에서 ```.joined()``` 시켜서 String으로 만들어 알파벳 순서로 정렬했다 이건 좀 섹시.

<details>
 <summary><b>Result</b></summary>
 <div markdown="1">
<img src  = "https://user-images.githubusercontent.com/45387886/159170675-f347e3e5-26e6-421c-b5d4-4fa9fc1f5404.png">
 </div>
 </details>
