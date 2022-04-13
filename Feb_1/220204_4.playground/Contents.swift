import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var stdt : [Int] = Array(repeating: 1, count: n + 2)
    stdt[0] = 0
    stdt[n + 1] = 0 // padding
    
    for i in lost { stdt[i] -= 1 }
    for i in reserve { stdt[i] += 1 }
    
    print(stdt)
    
    for i in 1...n {
        if stdt[i] == 0 { // 체육복이 없어!
            if stdt[i-1] == 2 { // 앞에 놈
                stdt[i - 1] -= 1
                stdt[i] = 1
                continue
            } else if stdt[i+1] == 2 { // 뒤에 놈
                stdt[i + 1] -= 1
                stdt[i] = 1
            }
        }
    }
    
    return stdt.filter{ $0 > 0 }.count
}

solution(5, [2, 4], [1, 3, 5])
