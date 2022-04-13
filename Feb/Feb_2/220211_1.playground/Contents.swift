import Foundation

func solution(_ s:String) -> Int {
    let wordToNum : [String : String] = ["zero" : "0", "one" : "1", "two" : "2", "three" : "3", "four" : "4",
                                     "five" : "5", "six" : "6", "seven" : "7", "eight" : "8", "nine" : "9" ]
    let str = Array(s)
    var result = ""
    var temp = ""
    
    for e in str {
        //if "1234567890".contains(e) {
        if e.isNumber {
            result.append(e)
        } else {
            temp += String(e)
            if temp.count > 2 {
                if let n = wordToNum[temp] {
                    result += n
                    temp = ""
                }
            }
        }
    }
    
//    if let n = wordToNum[temp] {
//        result += n
//        temp = ""
//
//    }
    
    
    
    return Int(result)!
}

func solution2(_ s:String) -> Int {
    let wordToNum : [String : String] = ["zero" : "0", "one" : "1", "two" : "2", "three" : "3", "four" : "4",
                                     "five" : "5", "six" : "6", "seven" : "7", "eight" : "8", "nine" : "9" ]
    var result = s
    
    for (key, value) in wordToNum {
        result = result.replacingOccurrences(of: key, with: value)
    }
    
    return Int(result)!
}

print(solution2("one4seveneight"))
//print(solution("one4seveneight"))
//
//"zero1234".replacingOccurrences(of: "zero", with: "0")
