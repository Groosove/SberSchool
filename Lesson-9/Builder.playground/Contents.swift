import UIKit

// Builder

struct URL {
    var transferProtocol: String?
    var host: String
    var domen: String
    var queryItems: [String: String]?
    var path: String?
    var port: String?
    var user: String?
    var password: String?
    
    lazy var url: String = {
        var url = String()
        url += (self.transferProtocol != nil) ? (self.transferProtocol! + "://") : ""
        url += (self.user != nil) ? self.user! + ":" : ""
        url += (self.password != nil) ? self.password! + "@" : ""
        url += self.host
        url += "." + self.domen
        url += (self.port != nil) ? (":" + self.port!) : ""
        url += self.path ?? ""
        if let query = self.queryItems {
            url += "?"
            for (key, value) in query {
                url += key + "=" + value + "&"
            }
            url.removeLast()
        }
        return url
    }()
    
    init(host: String, domen: String) {
        self.host = host
        self.domen = domen
    }
    
}

var url = URL(host: "example", domen: "ru")

url.transferProtocol = "http"
url.password = "1234"
url.user = "root"
url.port = "8080"
url.path = "/path/somePath"
url.queryItems = ["key":"0", "key2":"1"]
print(url.url)


