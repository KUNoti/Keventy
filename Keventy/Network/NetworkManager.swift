//
//  NetworkManager.swift
//  Keventy
//
//  Created by Kul Boonanake on 23/2/24.
//

import Moya

protocol Networkable {
    var provider: MoyaProvider<API> { get }
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> ())
    func fetchUserDetail(userId: Int, completion: @escaping (Result<User, Error>) -> ())
}

class NetworkManager: Networkable {
    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> ()) {
        request(target: .users, completion: completion)
    }
    
    func fetchUserDetail(userId: Int, completion: @escaping (Result<User, Error>) -> ()) {
        request(target: .userDetail(userId: userId), completion: completion)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

// Usage
//private func loadUsers(userId: Int) {
//        startLoading()
//        networkManager.fetchUserDetail(userId: userId, completion: { [weak self] result in
//            guard let strongSelf = self else { return }
//            strongSelf.stopLoading()
//            switch result {
//            case .success(let userResponse):
//                strongSelf.setData(userResponse)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        })
//    }
