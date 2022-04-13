import Foundation

func factorial(_ n : Int) -> Int {
    if n == 1 { return 1 }
    else { return n * factorial(n - 1) }
}

func solution(_ n : Int) -> Int {
    var ans = 0
    
    for i in 0...n/2 {
        let j = n - 2 * i
        print("(\(i), \(j))")
        //print(factorial(i + j) / (factorial(i) + factorial(j)))
        
        //ans = factorial(i + j) / (factorial(i) + factorial(j))
    }
    
    return 0
}

solution(3)

// n+r-1Cr

/*
 2 * i + 1 * j = n
            (i , j)
 - 2 -> 2 (0,2) = 2! / 2! = 1
          (1,0) = 1! = 1
 
 - 3 -> 3 (0,3) = 3! / 3! = 1
          (1,1) = 2! = 2
 
 
 - 4 -> 5
 (0,4) = 4P4 / 4! = 4! / 4! = 1
 (1,2) + 2 = 3P3 / 2! = 3! / 2! = 3 = 3
 (2,0) = 2P2 / 2! = 2! / 2! = 1
 
 i,j 경우의 수 구하고
 (i + j)! / i! * j!
*/

/*
( i + j )! / i! * j!
 
 (n - i)! / i! * (n - 2i)!
 
 n-i * n-i-1 / i!
 i번
 
 let upper = 0
 for k in 0..<i {
    upper *= n - k
 }
 upper /= factorial(i)
 
*/

/*
 
 (i+j)Cj / i!
 */

/*
 
 answer += factorial(n - i) / (factorial(i) * factorial(n - 2*i))
 
 n = 6, i = 2
 -> (2,2)
 
 6! / (2! * 2!)
 
 4!/2!
 
 4C2
 
 n = 7, i = 3
 -> (3,1)
 
 7! / (3! * 1!)
 
 6!/3!
 
 6C3
 n-2i C i
 
 n = 9, i = 4
 -> (4,1)
 
 9! / (4! * 1!)
 
 8!/4!
 
 8C4
 */
