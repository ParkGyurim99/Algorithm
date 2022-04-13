import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var candidate : [[Int]] = []
    for i in 1...yellow {
        if yellow % i == 0 && i >= yellow/i {
            if (i + 2 + yellow/i) * 2 == brown { return [i + 2, yellow/i + 2] }
        }
    }
    
    return []
}

print(solution(10, 2))
print(solution(8, 1))
print(solution(24, 24))
