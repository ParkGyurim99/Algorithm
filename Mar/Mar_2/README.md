## 2022.03.06. ~ 2022.03.12.
|번호|레벨|문제이름|링크|문제유형(선택)|
|---|---------|----|---------------------|:----------------:|
|문제1|Level 2|`JadenCase 문자열 만들기`|https://programmers.co.kr/learn/courses/30/lessons/12951|탐색|
|문제2|Level 2|`짝지어 제거하기`|https://programmers.co.kr/learn/courses/30/lessons/12973|스택|
|문제3|Level 2|`배달`|https://programmers.co.kr/learn/courses/30/lessons/12978|탐색|
|문제4|Level 3|`파괴되지 않은 건물`|https://programmers.co.kr/learn/courses/30/lessons/92344|누적합|

# 문제 1 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/12951">```JadenCase 문자열 만들기 (Level 2)```</a>
```swift
func solution(_ s:String) -> String {
    var answer = ""
    let str = s.lowercased().map { String($0) }
    var spaceCheck = true

    for index in str.indices {
        if spaceCheck == true { answer += str[index].uppercased() }
        else { answer += str[index] }
        
        spaceCheck = str[index]  == " " ? true : false
    }

    return answer
}
```
> * 문제조건 : `공백문자가 연속으로 나올 수 있습니다` -> 공백문자로 나눌 수 없음
> * `spaceCheck` 라는 Bool 변수 선언해서 공백 문자가 나오면 해당 변수를 true로 설정하고 다음 루프에서 `.uppercased()`
> * 공백문자는 `.uppercased()` 해도 공백이심
<details>
<summary><b>Result</b></summary>
<div markdown="1">
<img width="955" alt="res1" src="https://user-images.githubusercontent.com/45387886/158030610-c898a07c-6c96-43ea-9d1f-92f7ad128675.png">
</div>
</details>
<hr>

# 문제 2 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/12973">```짝지어 제거하기 (Level 2)```</a>
```swift
func solution(_ s:String) -> Int{
    let str = Array(s)//s.map { String($0) }
    var list = Array<Character>()

    for k in str {
        if list.last == k { list.removeLast() }
        else { list.append(k) }
    }
    
    return list.isEmpty ? 1 : 0
}
```
> * `Stack` 사용해서 이전과 다른 문자가 들어오면 `push`, 같은 문자가 들어오면 마지막 문자 `pop`
> * 효율성 통과를 못한다면 type casting 을 없애보자
<details>
<summary><b>Result</b></summary>
<div markdown="1">
<img width="953" alt="res2" src="https://user-images.githubusercontent.com/45387886/158030677-b9c6c63c-5993-4667-9aab-dd4b2cf3c81f.png">
</div>
</details>
<hr>

# 문제 3 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/12978">```배달 (Level 2)```</a>
```swift
func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var timeToVillage : [Int : Int] = [:]
    for n in 1...N { timeToVillage[n] = 500000 }
    func dfs(roads : ArraySlice<[Int]>, cur : Int, depth : Int) {
        timeToVillage[cur] = depth
        for index in 0..<roads.count {
            if depth + roads[index][2] <= k {
                if roads[index][0] == cur && depth + roads[index][2] <= timeToVillage[roads[index][1]]! {
                    dfs(roads : roads[0..<index] + roads[(index+1)...], cur : roads[index][1], depth : depth + roads[index][2])
                } else if roads[index][1] == cur && depth + roads[index][2] <= timeToVillage[roads[index][0]]! {
                    dfs(roads : roads[0..<index] + roads[(index+1)...], cur : roads[index][0], depth : depth + roads[index][2])
                }
            }
        }
    }
    
    dfs(roads : road[0...].filter{arr in arr[2] <= k}, cur: 1, depth: 0)
    return timeToVillage.values.filter({ $0 <= k}).count
}
```
> * `DFS` 로 푼 문제
>   * 탐색 중 k 이상 depth가 갈 것 같으면 중지
>   * 이미 사용한 road 는 재사용하지 않기 위해 다음 탐색시 제외
> * `다익스트라 (Dijkstra)` 또는 `플로이드 와셜 (Floyd Warshal)` 알고리즘으로 푸는게 정석? 같긴함. 
<details>
<summary><b>Result</b></summary>
<div markdown="1">
<img width="626" alt="res3" src="https://user-images.githubusercontent.com/45387886/158030751-71909fcb-5423-4d9a-94b5-580f39c137de.png">
</div>
</details>
<hr>

# 문제 4 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/92344">```파괴되지 않은 건물 (Level 3)```</a>
```swift
func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    let N = board.count // row
    let M = board[0].count // column
    var operation = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)
    var count = 0
    
    for s in skill {
        operation[   s[1]   ][   s[2]   ] += s[0] == 1 ? -s[5] :  s[5]
        operation[ s[3] + 1 ][   s[2]   ] += s[0] == 1 ?  s[5] : -s[5]
        operation[   s[1]   ][ s[4] + 1 ] += s[0] == 1 ?  s[5] : -s[5]
        operation[ s[3] + 1 ][ s[4] + 1 ] += s[0] == 1 ? -s[5] :  s[5]
    }

    // ➡️ 방향 누적합 구하기
    for i in 0...N {
        var temp = 0
        for j in 0...M {
            temp += operation[i][j]
            operation[i][j] = temp
        }
    }

    // ⬇️ 방향 누적합 구하기    
    for j in 0...M {
        var temp = 0
        for i in 0...N {
            temp += operation[i][j]
            operation[i][j] = temp
        }
    }

    for i in 0..<N {
        for j in 0..<M {
            if board[i][j] + operation[i][j] > 0 { count += 1 }
        }
    }
    
    return count
}
```
> * `누적합` 을 사용해야 하는 문제 (효율성 체크) 
> * Kakao 해설 : https://tech.kakao.com/2022/01/14/2022-kakao-recruitment-round-1/
> * 처음 문제를 풀때는 브루트포스로 접근했으나 효율성 이슈, 효율성 정답률 1.86% ㅋㅋ
<details>
<summary><b>Result</b></summary>
<div markdown="1">
<img width="1220" alt="res4" src="https://user-images.githubusercontent.com/45387886/158030923-e0b7364a-e48a-49af-8fe7-930bcc3f535a.png">
</div>
</details>
