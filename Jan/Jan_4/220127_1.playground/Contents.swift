import Foundation

func solution(_ nums:[Int]) -> Int {
    return getCombination(nums)
}

func isPrime(n : Int) -> Bool {
    for i in 2...n/2 {
        if n % i == 0 { return false }
    }
    
    return true
}

func getCombination(_ source : [Int]) -> Int {
    var sourceCopy = source
    var count = 0
    
    for _ in 0..<source.count-2 { // count - n + 1
        let src1 = sourceCopy.removeFirst()
        
        for j in 0..<sourceCopy.count {
            let src2 = sourceCopy.removeFirst()
            
            for i in 0..<sourceCopy.count-j {
                if isPrime(n: (sourceCopy[i] + src1 + src2)) { count += 1 }
            }
            sourceCopy.append(src2)
        }
    }
    
    return count
}
