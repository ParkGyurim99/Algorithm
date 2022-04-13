import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var result : [String] = []
    let source = number.map { String($0) }
    let length = number.count - k
    
    var maxIndex = 0
    var startIndex = 0
    
    while(result.count < length) {
        maxIndex = startIndex
        
        // 0,1,2,3,4,5,6,7,8 // count : 9
        //source.count - startIndex == length - result.count
        if source.count - startIndex == length - result.count {
        //if startIndex == k + result.count {
            result += source[startIndex...]
            return result.joined()
        }
        for i in startIndex...(source.count - (length - result.count)) {
           if source[i] == "9" {
               maxIndex = i
               break
           } else if source[maxIndex] < source[i] { maxIndex = i }
        }
        
        result.append(source[maxIndex])
        startIndex = maxIndex + 1
    }
    
    return result.joined()
}


var answer =
//solution("1924", 2)
//solution("1231234", 3)
solution("4177252841", 4)

print(answer)

/*
import Foundation

func solution(_ number:String, _ k:Int) -> String {
 var result : [String] = []
 var source = number.map { String($0) } //Array(number) -> [Charater]
 let length = number.count - k
 if length == 0 { return number }
 var maxIndex = 0

 while(result.count < length) {
     maxIndex = 0
     if source.count == length - result.count { // Test 7,9
         result += source
         return result.joined()
     }
     for i in 0...(source.count - (length - result.count)) {
         if source[i] == "9" {
             maxIndex = i
             break
         } else if source[maxIndex] < source[i] { maxIndex = i }
     }
     result.append(source[maxIndex])
     source.removeFirst(maxIndex + 1)
     //result += source.removeFirst()
 }
 
 return result.joined()
}
*/
