//
//  WebFrontendController.swift
//  
//
//  Created by Zaid Neurothrone on 2022-06-26.
//

import Vapor

struct WebFrontendController {
  
  func gasVolumeView(req: Request) async throws -> Response {
    let ctx = GasVolumeContext(
      title: "Gas Volume Calculator",
      link: .init(
        label: "Nominal Pipe Size",
        url: "https://en.wikipedia.org/wiki/Nominal_Pipe_Size#NPS_tables_for_selected_sizes"
      )
    )
    
    return req.templates.renderHtml(GasVolumeTemplate(ctx))
  }
}
