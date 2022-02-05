//
//  RandomUserViewModel.swift
//  RandomUserList
//
//  Created by taese0ng on 2022/02/05.
//

import Foundation
import Combine
import Alamofire

class RandomUserViewModel: ObservableObject {
    
    // MARK: Properties
    var subscription = Set<AnyCancellable>()
    
    @Published var randomUsers = [RandomUser]()
    
    var baseUrl = "https://randomuser.me/api/?results=100"
    
    init() {
        print(#fileID, #function, #line, "")
        fetchRandomUsers()
    }
    
    func fetchRandomUsers() {
        print(#fileID, #function, #line, "")
        AF.request(baseUrl)
            .publishDecodable(type: RandomUserResponse.self)
            .compactMap{ $0.value } // 첫번째($0)로 들어오고있는 것을 언래핑한다. 그리고 RandomUserResponse 타입의 value 값으로 후에 사용한다는 뜻.
            .map{ $0.results }
            .sink(receiveCompletion: { completion in
                print("데이터스트림 완료")
            }, receiveValue: { (receivedValue: [RandomUser]) in
                print("받은 값: \(receivedValue.count)") // compactMap으로 언래핑되어서 사용가능, 원래 optional이라서 벗겨주는 작업을 해야한다.
                self.randomUsers = receivedValue
            }).store(in: &subscription) // 메모리날려주는? 그런역할
    }
}
