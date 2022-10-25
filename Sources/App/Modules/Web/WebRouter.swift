//
//  WebRouter.swift
//  
//
//  Created by Zaid Neurothrone on 2022-06-26.
//

import Vapor

struct WebRouter: RouteCollection {
  
  let controller = WebFrontendController()
  
  func boot(routes: RoutesBuilder) throws {
    routes.get(use: controller.gasVolumeView)
  }
}
