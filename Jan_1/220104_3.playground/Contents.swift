import Foundation

func solution(_ s:String) -> Int {
    let length = s.count
    let size = 2
    var result = ""
    //var minResult = length
    
    var previousWord = s[s.startIndex...s.index(s.startIndex, offsetBy : size)]
    
    // for size in 0..<length // 1~8
    var i = 0
    while(i < length-size) {
        var count = 0
        let startingIndex = s.index(s.startIndex, offsetBy: i)
        let endingIndex = s.index(startingIndex, offsetBy : size)
        let range = startingIndex..<endingIndex // substring range
       
        //count = checkRight(str: s, word: String(s[range]), wordSize: size, count: &count)
        
        print("previous substring : " + previousWord + " /// current substring : " + s[range])
        
        if i != 0 {
            if previousWord == s[range] {
                i+=(size+1)
                result += s[range]
            } else {
                result += s[startingIndex...startingIndex]
            }
        }
        print("\(i)"+result)
        //print(s[startingIndex...endingIndex])
        previousWord = s[range]
        
        i+=1
    }
    
    print ("result : " + result)
    return length
}

// recursive function
func checkRight(str : String, word : String, wordSize : Int, count : inout Int) -> Int {
    if str.count > wordSize {
        if str[str.startIndex..<str.index(str.startIndex, offsetBy : wordSize)] == word {
            count += 1
            checkRight(
                str : str.substring(from: str.index(str.startIndex, offsetBy: wordSize)),
                word : word,
                wordSize : wordSize,
                count : &count
            )
        }
    }
    return count
}

let testString = "aabbaccc"
//print(solution(testString))
var count = 0
print(checkRight(str: "abababc", word: "ab", wordSize: 2, count: &count))
