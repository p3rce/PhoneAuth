//
//  Verification.swift
//  PhoneAuth
//
//  Created by Pierce Goulimis on 2022-06-19.
//

import SwiftUI

struct Verification: View {
    
    @ObservedObject var loginData: LoginViewModel
    @Environment(\.presentationMode) var present
    
    var body: some View {
        
        VStack {
            VStack {
                
                HStack {
                    
                    Button {
                        
                        present.wrappedValue.dismiss()
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Text("Verify Phone")
                        .font(.title2)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    
                    Spacer()

                    
                }
                .padding()
                
                Text("Code sent to \(loginData.phNo)")
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Spacer(minLength: 0)
                
                
                HStack(spacing: 15) {
                    
                    ForEach(0..<6, id: \.self) { index in
                        
                        //Display code
                        CodeView(code: getCodeAtIndex(index: index))
                    }
                    
                }
                .padding()
                .padding(.horizontal, 20)
                
                
                Spacer(minLength: 0)
                
                HStack(spacing: 6) {
                    
                    Text("Didn't recieve code?")
                        .foregroundColor(.gray)
                    
                    Button(action: {}) {
                        
                        Text("Resend")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                    }
                    
                }
                
                Button(action: {}) {
                    
                    Text("Get via call")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                }
                .padding(.top, 6)
                
                Button(action: {}) {
                    
                    Text("Verify and Create Account")
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(.yellow)
                        .cornerRadius(15)
                    
                }
                
            }
            .frame(height: UIScreen.main.bounds.height / 1.8)
            .background(Color.white)
            .cornerRadius(20)
            
            Spacer()
        }
        .background(Color.white).ignoresSafeArea(.all, edges: .bottom)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
    
    //Getting code at each
    
    func getCodeAtIndex(index: Int) -> String {
        
        if loginData.code.count > index {
            
            let start = loginData.code.startIndex
            
            let current = loginData.code.index(start, offsetBy: index)
            
            return String(loginData.code[current])
            
        }
        
        return ""
        
    }
    
}

struct CodeView:View {
    
    var code: String
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Text(code)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .font(.title2)
            
            //Default frame
                .frame(height: 45)
            
            
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(height: 4)
            
        }
        
    }
    
}

//struct Verification_Previews: PreviewProvider {
//    static var previews: some View {
//        Verification()
//    }
//}
