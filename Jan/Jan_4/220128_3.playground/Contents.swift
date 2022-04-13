import Foundation

func solution(_ w : Int, _ h : Int) -> Int64 {
    var answer : Int64 = 0
    let gradient : Float80 = Float80(h) / Float80(w) // y = inclination * x
    //let equation = { (x : Int) -> Double in return gradient * Double(x) }

    for x in 1..<w { answer += Int64(gradient * Float80(x)) }

    return answer * 2
}

print(solution(8, 12))
//print(solution(2, 98))
//print(solution(98, 2))

/*
Int : 8B
Int64 : 8B
Float : 4B
Double : 8B
Float80 : 16B
 
MemoryLayout.size(ofValue: gradient)
*/
