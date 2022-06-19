//
//  LoginViewModel.swift
//  PhoneAuth
//
//  Created by Pierce Goulimis on 2022-06-18.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var phNo = ""
    
    @Published var code = ""
    
    //Getting country Phone Code
    
    func getCountryCode() -> String {
        
        let regionCode = Locale.current.regionCode ?? ""
        
        return countries[regionCode] ?? ""
        
    }
    
}
