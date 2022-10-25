//
//  BackendController.swift
//  
//
//  Created by Zaid Neurothrone on 2022-06-26.
//

import GVCCore
import Vapor

struct BackendController {
  
  internal struct InData: Content {
    let nps: Int
    let length: Double
    let pressureSelection: String
    var customPressure: String
  }
  
  internal struct OutData: Content {
    let gasVolume: Double
    let isValid: Bool
  }
  
  func calculateHandler(_ req: Request) async throws -> OutData {
    let inData = try req.content.decode(InData.self)
    
    guard let nps = NPSSelection(rawValue: inData.nps) else {
      return OutData(
        gasVolume: 0.0,
        isValid: false
      )
    }
    
    let length = inData.length
    let pressure: Double
    
    if inData.pressureSelection == PressureSelection.custom.rawValue {
      guard let unwrappedPressure = inData.customPressure.toDouble() else {
        return OutData(
          gasVolume: 0.0,
          isValid: false
        )
      }
      
      pressure = unwrappedPressure
    } else {
      guard let unwrappedPressure = inData.pressureSelection.toDouble() else {
        return OutData(
          gasVolume: 0.0,
          isValid: false
        )
      }
      
      pressure = unwrappedPressure
    }
    
    let gasVolume = GVCCore.calculateGasVolume(nps: nps, length: length, pressure: pressure)
    
    return OutData(
      gasVolume: gasVolume,
      isValid: true
    )
  }
}
