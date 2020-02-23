//
//  RouteError.swift
//  NCUBUS
//
//  Created by royyaha on 09.02.20.
//  Copyright © 2020 royyaha. All rights reserved.
//

import Foundation

enum RoutesError: Error {
  case parsing(description: String)
  case network(description: String)
}
