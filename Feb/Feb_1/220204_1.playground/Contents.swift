import Foundation

struct location {
    var x : Int
    var y : Int
    
    init(_ x : Int, _ y : Int) {
        self.x = x
        self.y = y
    }
}

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result : String = ""
    var lLocation : location = .init(3, 1)
    var rLocation : location = .init(3, 3)
    var h = Array(hand)[0]
    
    for n in numbers {
        var p = n / 3
        var q = n % 3
        if q == 0 {
            p -= 1
            q = 3
        }
        if n == 0 {
            p = 3
            q = 2
        }
        
        switch q {
            case 1 :
                h = "l"
            case 3 :
                h = "r"
            default : // q == 2
                if abs(lLocation.x - p) + abs(lLocation.y - q) < abs(rLocation.x - p) + abs(rLocation.y - q) {
                    h = "l" // 왼손이 더 가까울때
                } else if abs(lLocation.x - p) + abs(lLocation.y - q) == abs(rLocation.x - p) + abs(rLocation.y - q) {
                    h = Array(hand)[0]
                } else {
                    h = "r" // 오른손이 더 가까울때
                }
        }
        
        switch h {
            case "r" :
                rLocation = location(p, q)
                result += "R"
            case "l" :
                lLocation = location(p, q)
                result += "L"
            default : break
        }
    }
    
    return result
}

print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left"))
// Answer : LRLLRRLLLRR
// MYAnwer: LLRLRRLLLRR
//          LRLLRRLLLRR

/*
                # [row, col] => row * 3 + col
 
 1    2     3   -> 0+1 0+2 0+3
 4    5     6   -> 3+1 3+2 3+3
 7    8     9   -> 6+1 6+2 6+3
 *    0     #
왼손 가까운 손 오른손
 
 - 3으로 나눴을때 나머지가 1 : 왼손
 - 3으로 나눴을때 나머지가 2 : 가까운 손
 - 3으로 나눴을때 나머지가 0 : 오른손
 
이동은 상하좌우 1칸씩
거리가 같으면 편한 손 사용
 */
