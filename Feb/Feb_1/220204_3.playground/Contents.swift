import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var time = 0
    var cache : [String] = []
    var city = ""
    if cacheSize == 0 { return 5 * cities.count }
    
//    for n in 0..<cacheSize {
//        cache.append(cities[n].lowercased())
//        time = 5 * cacheSize
//    }
    // 빈 캐시가 찰 때 까지
    var index = 0
    while(cache.count < cacheSize) {
        city = cities[index].lowercased()
        
        if cache.contains(city) {
            cache.remove(at: cache.firstIndex(of: city)!)
            cache.append(city)
            time += 1
        } else {
            cache.append(city)
            time += 5
        }
        
        index += 1
    }
    
    for n in cacheSize..<cities.count {
        city = cities[n].lowercased()

        // cache hit - remove and append
        if cache.contains(city) {
            cache.remove(at: cache.firstIndex(of: city)!)
            cache.append(city)
            time += 1
        }

        // cache miss - removeFirst and append
        else {
            cache.removeFirst()
            cache.append(cities[n].lowercased())
            time += 5
        }

        print(cache)
    }

    return time
}
// 11 16 19 20
print(solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))
