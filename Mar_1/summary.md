# 2022.02.27. ~ 2022.03.05.
|번호|레벨|문제이름|링크|문제유형|
|:---:|:---------:|:----:|:---------------------:|:----------------:|
|문제1|Level 2|`주식가격`|https://programmers.co.kr/learn/courses/30/lessons/42584|스택/큐|
|문제2|Level 2|`다리를 지나는 트럭`|https://programmers.co.kr/learn/courses/30/lessons/42583|스택/큐|
|문제3|Level 2|`전력망을 둘로 나누기`|https://programmers.co.kr/learn/courses/30/lessons/86971|그래프|
|문제4|Level 3|`네트워크`|https://programmers.co.kr/learn/courses/30/lessons/43162|그래프|

# 문제 1 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/42584">```주식 가격 (Level 2)```</a> with C
```c
#include <stdio.h>

int* solution(int prices[], size_t prices_len) {
    int k = 0, temp = 0, size = prices_len;
    int* answer = (int*)malloc(sizeof(int) * size);

    for (int i = 0; i < size; i++) {
        k = 0;
        for (int j = i + 1; j < size; j++) {
            k++;
            if (prices[i] > prices[j]) { break; }
        }    
        answer[i] = k;
    }
    
    return answer;
}
```
> * 특별한 알고리즘을 사용하지 않았는데 풀렸다..?
<details>
<summary><b>Result</b></summary>
<div markdown="1">
<img width="956" alt="result_1" src="https://user-images.githubusercontent.com/45387886/156888645-63bcccca-4c34-430e-85f4-e899509e0296.png">
</div>
</details>
<hr>

# 문제 2 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/42583">```다리를 지나는 트럭 (Level 2)```</a> with Swift
```swift
func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var answer = bridge_length
    var onTheBridgeWeight = 0
    var onTheBridge : [Int] = Array(repeating: 0, count: bridge_length - 1)
    var index = 0
    
    while(index < truck_weights.count) {
        if onTheBridgeWeight + truck_weights[index] <= weight {
            onTheBridgeWeight += truck_weights[index]

            onTheBridge.append(truck_weights[index])
            index += 1
        } else { onTheBridge.append(0) }
        
        answer += 1
        print(onTheBridge)
        
        onTheBridgeWeight -= onTheBridge.removeFirst()
    }
    
    return answer
}
```
> * ```while```문의 위 아래에 각각 ```append```, ```remove```를 넣어서 ```onTheBride```의 길이가 항상 일정하게 ```bride_length``` 로 유지되는 큐로 만듦.
> * 다리 위에 자동차가 올라가지 않을때는 ```0```을 큐에 ```push```
> * ```0```을 ```push``` 하는 이유는 ```pop (remove)``` 한 자동차의 무게를 뺄때 따로 경우를 나누지 않기 위함과 자동차가 다리를 나가는 시점을 따로 계산하지 않기 위함.
<details>
<summary><b>Result</b></summary>
<div markdown="1">
<img width="1051" alt="result_2" src="https://user-images.githubusercontent.com/45387886/156888648-15ae571f-542f-4ee6-802c-a12324184ae9.png"></div>
</details>
<hr>

# 문제 3 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/86971">```전력망을 둘로 나누기 (Level 2)```</a> with Swift
```swift
func bfs(vertex : [[Int]], current : Int) -> Int {
    var count = 0
    var queue : [Int] = [current]
    var visited : [Int : Bool] = [current : true]
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let temp = queue.removeFirst()
            visited[temp] = true
            count += 1
            
            for v in vertex.filter({ arr in arr[0] == temp || arr[1] == temp }) {
                if v[0] == temp { if visited[v[1]] == nil { queue.append(v[1]) } }
                else { if visited[v[0]] == nil { queue.append(v[0]) } }
            }
        }
    }
    
    return count
}

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var vertex = wires
    var temp : [Int] = []
    var minDiff = 100
    
    for i in 0..<wires.count {
        vertex = wires
        temp = vertex.remove(at: i)
        let a = bfs(vertex: vertex, current: temp[0])
        let b = bfs(vertex: vertex, current: temp[1])
        
        let diff = abs(a - b)
        if diff == 0 { return 0 }
        else if diff < minDiff { minDiff = diff }
    }
    
    return minDiff
}
```
> * ```wires``` 의 모든 간선들을 제거해보고 최소값을 판단함..
> * 제거한 간선을 ```temp```에 저장하고 ```vertex```를 넘겨 실행하고, 다음 실행시에는 ```vertex = wires```로 초기화 시킴.
> * ```temp[0]```과 ```temp[1]``` 각각 bfs로 탐색을 하여 개수를 반환하고 차이값이 최소값인지 판단함.
> * 차이가 0인 경우 early exit
<details>
<summary><b>Result</b></summary>
<div markdown="1">
<img width="962" alt="solution_3" src="https://user-images.githubusercontent.com/45387886/156888650-6c0a0e20-c945-4529-9060-1421431d6253.png"></div>
</details>
<hr>

# 문제 4 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/43162">```네트워크 (Level 3)```</a> with Swift
```swift
func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var vertex : [[Int]] = []
    for i in 0..<n {
        for j in 0..<n {
            if computers[i][j] == 1 && i != j { vertex.append([i, j]) }
         }
    }
    
    var visited = Array(repeating: false, count: n)
    var count = 0
    
    func dfs(n : Int) {
        if visited[n] == true { return } else { visited[n] = true }
        
        for next in vertex.filter({ arr in arr[0] == n }) {
            dfs(n: next[1])
        }
    }
    
    while(true) {
        if visited.allSatisfy({ $0 == true }) { break }
        
        guard let index = visited.firstIndex(of: false) else { break }
        dfs(n: index)
        count += 1
    }
    
    return count
}
```
> * 먼저 간선을 보기 쉽게 정리함,,
> * dfs를 사용한 문제.. -> 해당 지점부터 dfs로 탐색하다가 더 이상 갈곳이 없으면 리턴하고, 방문하지 않은 점에서 다시 탐색
> * ```firstIndex(of : _ )``` 또는 ```filter``` 사용으로 코드 중복을 줄이고 가독성을 높일 수 있었다.
<details>
<summary><b>Result</b></summary>
<div markdown="1">
<img width="1089" alt="result_4" src="https://user-images.githubusercontent.com/45387886/156888649-e9379616-9ac0-439b-9f3a-0837605316ab.png"></div>
</details>
