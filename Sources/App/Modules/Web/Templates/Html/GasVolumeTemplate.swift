//
//  GasVolumeTemplate.swift
//  
//
//  Created by Zaid Neurothrone on 2022-06-26.
//

import GVCCore
import SwiftHtml
import Vapor


struct GasVolumeTemplate: TemplateRepresentable {
  
  var context: GasVolumeContext
  
  init(_ context: GasVolumeContext) {
    self.context = context
  }
  
  @TagBuilder
  func render(_ req: Request) -> Tag {
    WebBaseTemplate(.init(title: context.title)) {
      Form {
        Comment("NPS")
        Div {
          Label {
            WebLinkTemplate(context.link).render(req)
            Span(" | DN (mm)")
          }
          .for("npsPicker")
            .class("form-label")
                
                Select {
            for option in NPSSelection.allCases {
              Option(option.toString)
                .value(String(option.rawValue))
            }
          }
          .class("form-select")
          .id("npsPicker")
        }
        .class("mb-3")
        
        Comment("Length")
        Div {
          Label("Length (m)")
            .class("form-label")
          
          Input()
            .placeholder("Type in a length")
            .type(.number)
            .class("form-control")
            .id("lengthTextField")
            .name("length")
        }
        .class("mb-3")
        
        Comment("Pressure")
        Div {
          Label("Pressure (mbar)")
            .class("form-label")
            .for("pressurePicker")
                  
                  Select {
              for option in PressureSelection.allCases {
                Option(option.toString)
                  .value(option.toString)
              }
            }
            .class("form-select")
            .id("pressurePicker")
            .name("pressureSelection")
          
          Div {
            Label("Custom pressure (mbar)")
              .class("form-label")
              .hidden(true)
              .for("pressureTextField")
                    
                    Input()
                .placeholder("Type in a pressure")
                .type(.number)
                .class("form-control")
                .id("pressureTextField")
                .name("customPressure")
          }
          .class("mt-3")
        }
        .class("mb-3")
        
        Div {
          Input()
            .type(.submit)
            .value("Calculate")
            .class(["btn", "btn-primary"])
            .id("calculateButton")
        }
        .class("mb-3")
      }
      .action("/")
      .method(.post)
      
      Comment("Result")
      Div {
        H2("Gas Volume")
        P("0.0")
          .class("fs-2")
          .id("result")
      }
      .class("text-center")
      
    }
    .render(req)
  }
}
