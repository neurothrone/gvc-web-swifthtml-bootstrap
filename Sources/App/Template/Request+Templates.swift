//
//  File.swift
//  
//
//  Created by Zaid Neurothrone on 2022-06-26.
//

import Vapor

public extension Request {
  var templates: TemplateRenderer { .init(self) }
}
