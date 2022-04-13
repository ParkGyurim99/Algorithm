import Foundation

//func solution(_ A:[Int], _ B:[Int]) -> Int {
//    var ans = 0
//    let size = A.count
//
//    var arrA = A
//    var arrB = B
//    for _ in 0..<size {
//        if let a = arrA.min(), let b = arrB.max() {
//            ans += a * b
//            print("\(a) X \(b) = \(ans)")
//            arrA.remove(at: arrA.index(arrA.startIndex, offsetBy: arrA.firstIndex(of: a)!))
//            arrB.remove(at: arrB.index(arrB.startIndex, offsetBy: arrB.firstIndex(of: b)!))
//        }
//    }
//
//    return ans
//}

func solution(_ A:[Int], _ B:[Int]) -> Int {
    var ans = 0
    let arrA = A.sorted()
    let arrB = B.sorted(by: {$0 > $1})
    for i in 0..<A.count { ans += arrA[i] * arrB[i] }

    return ans
}
//print("\(arrA[i]) X \(arrB[i]) = \(ans)")

solution([1, 4, 2], [5, 4, 4])
//solution([1,2], [3,4])
