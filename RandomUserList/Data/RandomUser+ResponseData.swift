//
//  RandomUser+ResponseData.swift
//  RandomUserList
//
//  Created by taese0ng on 2022/02/05.
//

import Foundation

struct RandomUser: Codable, Identifiable, CustomStringConvertible {
    var id = UUID()
    var name: Name
    var photo: Photo
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case photo = "picture" // 원래 json에선 picture로 되어있는 객체를 photo로 받아서 쓰겠다는 의미
    }
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return RandomUser(name: Name.getDummy(), photo: Photo.getDummy())
    }
    
    var profileImgUrl : URL {
        get {
            URL(string: photo.medium)!
        }
    }
    
    var description: String {
        return name.description
    }
}

struct Name: Codable, CustomStringConvertible {
    var title: String
    var first: String
    var last: String
    
    var description: String {
        return "[\(title)] \(last) \(first)"
    }
    
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Name(title: "개발자", first: "김", last: "매니저")
    }
}

struct Photo: Codable {
    var large: String
    var medium: String
    var thumbnail: String
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Photo(large: "https://randomuser.me/api/portaits/women/93.jpg",
                     medium: "https://randomuser.me/api/portaits/women/93.jpg",
                     thumbnail: "https://randomuser.me/api/portaits/women/93.jpg")
    }
}

struct Info: Codable {
    var seed: String
    var resultsCount: Int
    var page: Int
    var version: String
    private enum CodingKeys: String, CodingKey {
        case seed = "seed"
        case resultsCount = "results"
        case page = "page"
        case version = "version"
    }
}

struct RandomUserResponse: Codable, CustomStringConvertible {
    var results: [RandomUser]
    var info: Info
    private enum CodingKeys: String, CodingKey {
        case results, info
    }
    var description: String {
        return "results.count: \(results.count) / info : \(info.seed)"
    }
}
