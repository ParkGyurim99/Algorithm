import Foundation

struct Coor {
    var x : Int
    var y : Int
    
    init(_ X : Int, _ Y : Int) {
        x = X
        y = Y
    }
}

func move(cur : Coor, heading : String, direction : Int) -> Coor { // direction ; 빛이 들어온 방향
    var result = Coor(0, 0) // nextCoor
    
    switch heading {
    case "R" :
        switch direction {
            case 0 : result = .init(cur.x, cur.y + 1)
            case 1 : result = .init(cur.x, cur.y - 1)
            case 2 : result = .init(cur.x + 1, cur.y)
            default : result = .init(cur.x - 1, cur.y)
        }
    case "L" :
        switch direction {
            case 0 : result = .init(cur.x, cur.y - 1)
            case 1 : result = .init(cur.x, cur.y + 1)
            case 2 : result = .init(cur.x - 1, cur.y)
            default : result = .init(cur.x + 1, cur.y)
        }
    default : // S
        switch direction {
            case 0 : result = .init(cur.x - 1, cur.y)
            case 1 : result = .init(cur.x + 1, cur.y)
            case 2 : result = .init(cur.x, cur.y + 1)
            default : result = .init(cur.x, cur.y - 1)
        }
    }
//
//    if result.x < 0 { result.x += col }
//    else { result.x %= col }
//
//    if result.y < 0 { result.y += row }
//    else { result.y %= row }
//
    return result
}

func checkAllRecord(record : [[[Int]]]) -> Bool {
    let row = record.count
    let col = record[0].count
    var sum = 0
    
    for i in 0..<row {
        for j in 0..<col {
            for k in 0..<record[i][j].count {
                sum += record[i][j][k]
            }
        }
    }
    if sum == row * col * row * col  {
         return true
    } else { return false }
}

func solution(_ grid:[String]) -> [Int] {
    var result : [Int] = []
    let row = grid[0].count
    let col = grid.count
    let gridCopy : [[String]] = grid.map { $0.map { String($0) } }
    var record : [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: 4), count: row), count: col)

    // #direction
    // top : 0
    // down : 1
    // right : 2
    // left : 3
    for firstDirection in 0..<4 {
        //var firstDirection = 2
        
        record = Array(repeating: Array(repeating: Array(repeating: 0, count: 4), count: row), count: col)
        var curCoor = Coor(0,0)
        var nextCoor = Coor(0,0)
        var direction = firstDirection
        var prevDirection = direction
        var count = 0
        
        while(true) {
            nextCoor = move(cur: curCoor, heading: gridCopy[curCoor.x][curCoor.y], direction: direction)
            
            if nextCoor.x - curCoor.x == -1 { direction = 0 } // arrow top : 0
            else if nextCoor.x - curCoor.x == 1 { direction = 1 } // arrow down : 1
            else if nextCoor.y - curCoor.y == 1 { direction = 2 } // arrow right : 2
            else if nextCoor.y - curCoor.y == -1 { direction = 3 } // arrow left : 3
            else if nextCoor.x == curCoor.x && nextCoor.y == curCoor.y { direction = prevDirection }
            
            count += 1
            
            if nextCoor.x < 0 { nextCoor.x += col }
            else { nextCoor.x %= col }
            if nextCoor.y < 0 { nextCoor.y += row }
            else { nextCoor.y %= row }
            
            record[nextCoor.x][nextCoor.y][direction] = 1
            
            print(curCoor, nextCoor, direction, count)
            print(record)
            
            curCoor = nextCoor
            prevDirection = direction
            
            if record[nextCoor.x][nextCoor.y][direction] == 1 {
                if checkAllRecord(record: record) {
                    print(record)
                    print(count)
                    result.append(count)
                    
                    break
                }
            }
            
            record[nextCoor.x][nextCoor.y][direction] = 1
        }
    }
    
    return result.sorted()
}

//print(solution(["SR", "LR"]))
print(solution(["R", "R"]))
