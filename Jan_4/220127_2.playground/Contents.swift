import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    let src1 = Array(str1.lowercased())
    let src2 = Array(str2.lowercased())
    
    var arr1 = [String]()
    var arr2 = [String]()
    
    for i in 0..<src1.count-1 {
        if "abcdefghijklmnopqrstuvwzxyz".contains(src1[i]) && "abcdefghijklmnopqrstuvwzxyz".contains(src1[i + 1]) {
            arr1.append(String(src1[i]) + String(src1[i+1]))
        }
    }
    
    for i in 0..<src2.count-1 {
        if "abcdefghijklmnopqrstuvwzxyz".contains(src2[i]) && "abcdefghijklmnopqrstuvwzxyz".contains(src2[i + 1]) {
            arr2.append(String(src2[i]) + String(src2[i+1]))
        }
    }

    var multiSet1 : [String : Int] = [ : ]
    var multiSet2 : [String : Int] = [ : ]
    
//    Test Array
//    arr1.removeAll()
//    arr2.removeAll()
//
//    arr1 = ["1", "2", "4", "4", "4"] // ["a","a","b","b","c"]
//    arr2 = ["4", "4", "5", "6", "7", "8", "8"] // ["a","b","b","d","e"]
    
    print(arr1)
    print(arr2)
    
    for e in arr1 {
        if let _ = multiSet1[e] { multiSet1[e]! += 1 }
        else { multiSet1[e] = 1 }
    }

    for e in arr2 {
        if let _ = multiSet2[e] { multiSet2[e]! += 1 }
        else { multiSet2[e] = 1 }
    }
    
    var multiSetForUnion : [String : Int] = [ : ]
    var multiSetForInterSection : [String : Int] = [ : ]
    
    for (key, value) in multiSet1 {
        if let _ = multiSet2[key] {
            multiSetForUnion[key] = multiSet2[key]! > value ? multiSet2[key]! : value
            multiSetForInterSection[key] = multiSet2[key]! > value ? value : multiSet2[key]!
        } else { multiSetForUnion[key] = value }
    }

    for (key, value) in multiSet2 {
        if let _ = multiSet1[key] {
            multiSetForUnion[key] = multiSet1[key]! > value ? multiSet1[key]! : value
            multiSetForInterSection[key] = multiSet1[key]! > value ? value : multiSet1[key]!
        } else { multiSetForUnion[key] = value }
    }

    print(multiSetForUnion)
    print(multiSetForInterSection)
    
    if multiSetForInterSection.isEmpty && multiSetForUnion.isEmpty {
        return 65536
    } else if multiSetForInterSection.isEmpty || multiSetForUnion.isEmpty {
        return 0
    } else {
        var unionCount = 0
        var intersectionCount = 0
        
        multiSetForUnion.forEach { (key, value) in unionCount += value }
        multiSetForInterSection.forEach { (key, value) in intersectionCount += value }
        
        print("\(intersectionCount) / \(unionCount)")
        
        return Int(Double(intersectionCount) / Double(unionCount) * 65536)
    }
}

//print(solution("aa1+aa2", "AAAA12"))
//print(solution("e=m*c^2", "E=M*C^2"))
print(solution("FRANCE", "french"))
print(solution("handshake", "shake hands"))
//print(solution("aa+aa+ bb+bb", "AAAA+BBBB"))
//print(solution("aaa", "aaaa"))
//print(solution("aa aa bb bb cc", "aa bb bb dd ee"))
//print(solution("***", "***"))

