//
//  RoutesFetcher.swift
//  NCUBUS
//
//  Created by royyaha on 09.02.20.
//  Copyright © 2020 royyaha. All rights reserved.
//

import Foundation
import Combine

protocol RoutesFetchable {
    func allRoutes() -> AnyPublisher<RoutesResponse, RoutesError>
}

class RoutesFetcher {
//    api use
    private let session: URLSession
    var cancellableSet: Set<AnyCancellable> = []

    init(session: URLSession = .shared) {
      self.session = session
    }
}

extension RoutesFetcher: RoutesFetchable
{
    /*
        1. find the hin und zuruck train by route id?
        2. 
    */
    /*  to do list:
        1. sort by the stops sequence
        2. urlfetch
    */
    
    func allRoutes() -> AnyPublisher<RoutesResponse, RoutesError> {
        guard let url = makeRoutesComponents().url else {
            let error = RoutesError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
//        let url = URL(string: "http://150.116.160.64/app/Traffic/Bus/route/0")!
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                .network(description: error.localizedDescription)
        }
        .flatMap(maxPublishers: .max(1)) { pair in
          decode(pair.data)
        }
        .eraseToAnyPublisher()
    }
    
        
}

private extension RoutesFetcher {
  struct RoutesAPI {
    static let scheme = "http"
    static let host = "150.116.160.64"
    static let path = "/app/Traffic/Bus/route/0"
  }
  
  func makeRoutesComponents() -> URLComponents {
    var components = URLComponents()
    components.scheme = RoutesAPI.scheme
    components.host = RoutesAPI.host
    components.path = RoutesAPI.path
    
    return components
  }
}
