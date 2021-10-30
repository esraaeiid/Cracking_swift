//
//  Configurator.swift
//  Expandable Sections
//
//  Created by Esraa on 30/10/2021.
//

import UIKit

protocol Configurator {
    func execute()
}


class AppDelegateConfigurator {
    let actions: [Configurator] = [Notifications()]
}


protocol BackendConfiguring {
    func configureBackend()
}

extension BackendConfiguring {
  func configureBackend() {
    print("BackendConfiguring")
  }
}
