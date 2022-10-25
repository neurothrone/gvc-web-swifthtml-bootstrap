//
//  BackendModule.swift
//  
//
//  Created by Zaid Neurothrone on 2022-06-26.
//

import Vapor

struct BackendModule: ModuleInterface {
  
  let router = BackendRouter()
  
  func boot(_ app: Application) throws {
    try router.boot(routes: app.routes)
  }
}
