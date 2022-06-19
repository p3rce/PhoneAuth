//
//  ContentView.swift
//  PhoneAuth
//
//  Created by Pierce Goulimis on 2022-06-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            Login()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
