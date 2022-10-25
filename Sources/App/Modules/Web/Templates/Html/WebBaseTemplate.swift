//
//  WebBaseTemplate.swift
//  
//
//  Created by Zaid Neurothrone on 2022-06-26.
//

import SwiftHtml
import Vapor

public struct WebBaseTemplate: TemplateRepresentable {
  
  public var context: WebBaseContext
  var body: Tag
  
  public init(_ context: WebBaseContext, @TagBuilder _ builder: () -> Tag) {
    self.context = context
    self.body = builder()
  }
  
  @TagBuilder
  public func render(_ req: Request) -> Tag {
    Html {
      Head {
        Meta()
          .charset("utf-8")
        Meta()
          .name(.viewport)
          .content("width=device-width, initial-scale=1")
        
        Link(rel: .shortcutIcon)
          .href("/images/favicon.ico")
          .type("image/x-icon")
        //                Link(rel: .stylesheet)
        //                    .href("https://cdn.jsdelivr.net/gh/feathercms/feather-core@1.0.0-beta.44/feather.min.css")
        
        Comment("Core Bootstrap CSS")
        Link(rel: .stylesheet)
          .href("https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css")
          .crossorigin(.anonymous)
          .integrity("sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor")
        
        Comment("Custom CSS")
        Link(rel: .stylesheet)
          .href("/css/main.css")
        
        Title(context.title)
      }
      Body {
        Header {
          H1(context.title)
        }
        .class(["container", "mt-3", "text-center"])
        
        Main {
          body
        }
        .class("container")
        
        Footer {
          Div {
            P {
              Text("This site is powered by ")
              A("Swift")
                .href("https://swift.org")
                .target(.blank)
              Text(" & ")
              A("Vapor")
                .href("https://vapor.codes")
                .target(.blank)
            }
            P("Neurothrone &copy; 2022")
          }
        }
        .class(["container", "text-center"])
        
        Comment("Core Bootstrap JS")
        Script()
          .type(.javascript)
          .src("https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js")
          .crossorigin(.anonymous)
          .integrity("sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2")
        
        Comment("Custom JS")
        Script()
          .type(.javascript)
          .src("/js/main.js")
      }
    }
    .lang("en-US")
  }
}

