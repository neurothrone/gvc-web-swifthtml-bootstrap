//
//  WebLinkTemplate.swift
//  
//
//  Created by Zaid Neurothrone on 2022-06-26.
//

import SwiftHtml
import Vapor

struct WebLinkTemplate: TemplateRepresentable {
  
  var context: WebLinkContext
  
  init(_ context: WebLinkContext) {
    self.context = context
  }
  
  @TagBuilder
  func render(_ req: Request) -> Tag {
    A(context.label)
      .href(context.url)
  }
}
