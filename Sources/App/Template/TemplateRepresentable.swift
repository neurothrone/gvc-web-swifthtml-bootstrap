//
//  File.swift
//  
//
//  Created by Zaid Neurothrone on 2022-06-26.
//

import SwiftSgml
import Vapor

public protocol TemplateRepresentable {
  
  @TagBuilder
  func render(_ req: Request) -> Tag
}
