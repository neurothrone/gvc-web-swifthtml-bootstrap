//
//  BackendRouter.swift
//  
//
//  Created by Zaid Neurothrone on 2022-06-26.
//

import Vapor

struct BackendRouter: RouteCollection {
  
  let controller = BackendController()
  
  func boot(routes: RoutesBuilder) throws {
    routes.post(use: controller.calculateHandler)
  }
}

