//
//  LoggerFacadeImpl.swift
//  RickMorty
//
//  Created by Oluwatosin Solarin on 09/07/2024.
//

import Foundation
import Logger

class LoggerFacadeImpl: LoggerFacade {
    func log(error: String) {
        do {
            try FileLogger.shared?.log(error: error)
        } catch {
            print(error)
        }
    }
}
