import Foundation

func solution(_ numbers:[Int]) -> String {
    var numbersCopy : [String] = numbers.map { String($0) }
    numbersCopy = numbersCopy.sorted { $0+$1 > $1+$0 }
    let answer = numbersCopy.joined()
    if answer.first == "0" {
        let temp = Int(answer)!
        return String(temp)
    }
    
    return answer
}

print(solution([6, 10, 2]))
print(solution([3, 30, 34, 333, 5, 51, 9]))
print(solution([0, 0, 0]))
