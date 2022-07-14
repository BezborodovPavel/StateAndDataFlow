//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import Foundation
import Combine

class UserManager: ObservableObject {
    @Published var isRegister: Bool {
        didSet {
            UserDefaults.standard.set(isRegister, forKey: "isRegister")
        }
    }
    var name: String {
        didSet {
            UserDefaults.standard.set(name, forKey: "userName")
        }
    }
    
    init() {
        isRegister = UserDefaults.standard.bool(forKey: "isRegister")
        name = UserDefaults.standard.string(forKey: "userName") ?? ""
    }
}

