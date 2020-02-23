//
//  Parsing.swift
//  NCUBUS
//
//  Created by royyaha on 17.02.20.
//  Copyright © 2020 royyaha. All rights reserved.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, RoutesError> {
  let decoder = JSONDecoder()
    // decoder.dateDecodingStrategy = .iso8601 // ??

  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      .parsing(description: error.localizedDescription)
    }
    .eraseToAnyPublisher()
}
