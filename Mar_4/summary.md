## 2022.03.20. ~ 2022.03.26.
|번호|레벨|문제이름|링크|문제유형||
|:---:|:---------:|:----:|:---------------------:|:----------------:|:-:|
|문제1|Level2 |`올바른 괄호`|https://programmers.co.kr/learn/courses/30/lessons/12909|스택|🎯|
|문제2|Level2 |`게임 맵 최단거리`|https://programmers.co.kr/learn/courses/30/lessons/1844|탐색|🎯|
|문제3|Level2|`피보나치 수`|https://programmers.co.kr/learn/courses/30/lessons/12945|구현|🎯|
|문제4|Level3 |`양과 늑대`|https://programmers.co.kr/learn/courses/30/lessons/92343|트리|😥|

# 문제 1 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/12909">```올바른 괄호 (Level 2)```</a>
 ```swift
func solution(_ s:String) -> Bool {
    let source = s.map { String($0) }
    var need = 0
    
    if source.count % 2 != 0 { return false }
    
    for src in source {
        if src == "(" { need += 1 }
        else if src == ")" { need -= 1 }
        
        if need < 0 { break }
    }
    
    return need == 0
}
```
> * 우선 Length가 홀수이면 괄호 짝이 맞을 수가 없기때문에 바로 ```return false```
> * 왼쪽 괄호 ```(``` 가 나오면 +1, 오른쪽 괄호 ```)```가 나오면 -1
> * 첫번째 인덱스부터 시작해서 탐색하다가 중간에 값이 음수가 되면 바로 탐색을 중단하고 결국 ```return false```
> * 이게 가능한 이유는 올바른 괄호일 경우 항상 왼쪽 괄호부터 시작을해서 양수값을 유지할 수 있기때문임.

<details>
  <summary><b>Result</b></summary>
  <div markdown="1">
<img alt="res1" src="https://user-images.githubusercontent.com/45387886/160245399-16e91b69-0b31-4554-8e90-3e0fa0e9124e.png">
  </div>
  </details>
  <hr>

# 문제 2 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/1844">```게임 맵 최단거리 (Level 2)```</a>
 ```python
def solution(maps):
    map = maps
    n = len(maps)
    m = len(maps[0])
    
    map = [ [0] * (m + 2) ]
    for i in range(n) : map.append([0] + maps[i] + [0])
    map.append( [0] * (m + 2) )
    
    buffer = [(1,1)]
    
    while buffer :
        temp = buffer
        
        buffer = []
        for cur in temp :
            if cur[0] == n and cur[1] == m : 
                return map[cur[0]][cur[1]]

            if map[cur[0]][cur[1] - 1] == 1 : # 왼쪽
                map[cur[0]][cur[1] - 1] = map[cur[0]][cur[1]] + 1
                buffer.append((cur[0], cur[1] - 1))
            if map[cur[0] + 1][cur[1]] == 1 : # 아래
                map[cur[0] + 1][cur[1]] = map[cur[0]][cur[1]] + 1
                buffer.append((cur[0] + 1, cur[1]))
            if map[cur[0] - 1][cur[1]] == 1 : # 위
                map[cur[0] - 1][cur[1]] = map[cur[0]][cur[1]] + 1
                buffer.append((cur[0] - 1, cur[1]))
            if map[cur[0]][cur[1] + 1] == 1 : # 오른쪽
                map[cur[0]][cur[1] + 1] = map[cur[0]][cur[1]] + 1
                buffer.append((cur[0], cur[1] + 1))

    return -1
```
> * 처음에는 ```depth``` 변수를 유지하면서 `while loop`가 반복할때마다 값을 1 씩 증가시키고 목적지에 도달하면 depth를 리턴했음.
> * 근데 효율성 검사를 못 통과함 계속. . 변수 범위? 때문인듯한데 정확한 이유는 모르겠음
> * 그래서 이전 위치보다 ```+1``` 값을 다음 위치에 주고 ```map``` 변수를 visited용도와  depth 정보 저장 용도로 동시에 사용
> * depth가 필요한 bfs에서는 queue가 필요 없을 수도 있다. 실제 deque를 사용하지 않으니까 효율성이 2배 가까이 좋아졌음!!

<details>
  <summary><b>Result</b></summary>
  <div markdown="1">
<img src = "https://user-images.githubusercontent.com/45387886/160245511-68a8d905-4c0a-4ee9-bcfa-c16644f55cbd.png">
  </div>
  </details>
  <hr>

# 문제 3 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/12945">```피보나치 수 (Level 2)```</a>
```swift
func fibonacci(n : Int) -> Int {
    if n == 0 { return 0 }
    else if n == 1 { return 1 }
    
    return fibonacci(n: n - 1) + fibonacci(n: n - 2)
}

func solution(_ n:Int) -> Int {
    var fiboArray : [Int] = [0, 1]
    for index in 2...n {
        fiboArray.append(fiboArray[index - 2] + fiboArray[index - 1])
    }
    
    return fiboArray[n]
}
```
> * 처음에는 위에 있는 ```fibonacci``` 함수로 재귀 탐색을 했는데.. 재귀 호출 깊이가 너무 커지니까 예상하지 못한 오류가 발생
> * 그래서 배열을 이용해서 풀었음, level 2 보다는 쉽다고 생각

<details>
  <summary><b>Result</b></summary>
  <div markdown="1">
<img alt="res3" src="https://user-images.githubusercontent.com/45387886/160245819-a9dd93fd-e1a2-44a4-a5ae-0f58236a59a2.png">
  </div>
  </details>
  <hr>

# 문제 4 : <a href = "https://programmers.co.kr/learn/courses/30/lessons/92343">```양과 늑대 (Level 3)```</a>
```swift
```
