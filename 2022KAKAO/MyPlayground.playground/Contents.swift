import Foundation

enum baseURL : String {
    case dev = "dev server address"
    case prd = "prd server address"
    var str : String {
        return self.rawValue
    }
}

print(baseURL.dev.rawValue)
print(baseURL.dev.str)
