//
//  Core.swift
//  OnBoardingFlow
//
//  Created by Sergey on 12/15/20.
//

import Foundation

class Core {
    
    static let shared = Core()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    ///Call it after onbording flow to not show it again
    func setIsNotNewUser() {
        UserDefaults.standard.setValue(true, forKey: "isNewUser")
    }
    
}
