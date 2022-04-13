import Foundation

struct Coor {
    var x : Int
    var y : Int
    
    init(_ X : Int, _ Y : Int) {
        x = X
        y = Y
    }
}

func move(prev : Coor? = nil, cur : Coor, heading : String, row : Int, col : Int, dir : Int? = nil, preDir : inout Int) -> Coor {
    var direction : Int = 0
    
    if dir == nil, prev != nil {
        if cur.x - prev!.x == -1 { direction = 0 } // arrow top : 0
        else if cur.x - prev!.x == 1 { direction = 1 } // arrow down : 1
        else if cur.y - prev!.y == 1 { direction = 2 } // arrow right : 2
        else if cur.y - prev!.y == -1 { direction = 3 } // arrow left : 3
        else if cur.x == prev!.x && cur.y == prev!.y { direction = preDir }
    } else { direction = dir! }
    
    preDir = direction
    
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
    
    if result.x < 0 { result.x += col }
    else { result.x %= col }
    
    if result.y < 0 { result.y += row }
    else { result.y %= row }
    
    return result
}

func check(_ arr : [[[Int]]]) -> Bool {
    let row : Int = arr.count
    let col : Int = arr[0].count
    let depth : Int = arr[0][0].count
    
    for i in 0..<row {
        for j in 0..<col {
            for k in 0..<depth {
                if arr[i][j][k] == 0 { return false }
            }
        }
    }
    
    return true
}

func solution(_ grid:[String]) -> [Int] {
    var result : [Int] = []
    let row = grid[0].count
    let col = grid.count
    let gridCopy : [[String]] = grid.map { $0.map { String($0) } }
    var record : [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: 4), count: row), count: col)
    
    for direction in 0..<4 {
        record = Array(repeating: Array(repeating: Array(repeating: 0, count: 4), count: row), count: col)
        
        let startCoor = Coor(0,0)
        var prevCoor = startCoor
        var preDirection = direction
        var headingFirst : String {
            switch direction {
            case 0 : // top
                return gridCopy[row-1][0]
            case 1 : // down
                return gridCopy[1%row][0]
            case 2 : // right
                return gridCopy[0][1%col]
            default : // left
                return gridCopy[0][col-1]
            }
        }
        print(record)
        record[prevCoor.x][prevCoor.y][preDirection] = 1
        var curCoor = move(cur: prevCoor, heading: headingFirst, row: row, col: col, dir: direction, preDir: &preDirection)
        record[curCoor.x][curCoor.y][preDirection] = 1
        var count = 2 // 1 + 첫 시행

        var nextCoor = Coor(0,0)
        
        while(true) {
            print(record)
            nextCoor = move(prev: prevCoor, cur: curCoor, heading: gridCopy[curCoor.x][curCoor.y], row: row, col: col, preDir: &preDirection)
            if count > (row+col)*(row+col) { break }
            
            if (nextCoor.x == startCoor.x && nextCoor.y == startCoor.y) {
                if check(record) {
                    if !result.contains(count) {
                        result.append(count)
                    }
                    count = 0
                    break
                }
            }
            
            count += 1
            record[nextCoor.x][nextCoor.y][preDirection] += 1
            
            prevCoor = curCoor
            curCoor = nextCoor
        }
        print("")
    }
    
    return result.sorted()
}

print(solution(["SL", "LR"]))
