//
//  Login.swift
//  PhoneAuth
//
//  Created by Pierce Goulimis on 2022-06-18.
//

import SwiftUI

struct Login: View {
    
    @StateObject var loginData = LoginViewModel()
    
    var body: some View {
        
        VStack {
            VStack {
                
                Text("Continue With Phone")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                
                
                
                Text("You'll receive a 4 digit code\n to verify next")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding()
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                
                //Mobile Number Field
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Text("Enter Your Number")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("+ \(loginData.getCountryCode()) \(loginData.phNo)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .tracking(2)
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button {
                        //Some action
                    } label: {
                        Text("Continue")
                            .foregroundColor(.black)
                            .padding(.vertical, 18)
                            .padding(.horizontal, 38)
                            .background(loginData.phNo == "" ? Color.gray.opacity(0.2) : Color.yellow)
                            .cornerRadius(15)
                    }
                    .disabled(loginData.phNo == "" ? true : false)
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
                
                
                
            } //End VStack
            .frame(height: UIScreen.main.bounds.height / 1.8)
            .background(Color.white)
            .cornerRadius(20)
            
            
            //Custom Number pad
            
            GeometryReader { reader in
                
                VStack {
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 15) {
                        
                        ForEach(rows, id: \.self) { value in
                            
                            Button(action: {buttonAction(value: value)}) {
                                
                                ZStack {
                                    
                                    if value == "delete.left" {
                                        
                                        Image(systemName: value)
                                            .font(.title2)
                                            .foregroundColor(.black)
                                        
                                    } else {
                                        
                                        Text(value)
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        
                                    }
                                    
                                }
                                .frame(width: getWidth(frame: reader.frame(in: .global)), height: getHeight(frame: reader.frame(in: .global)))
                                .background(Color.white)
                                .cornerRadius(10)
                                
                                
                                
                            }
                            
                            //Disable button for empty action
                            .disabled(value == "" ? true : false)
                            
                        }
                        
                    }
                    
                } //End VStack
                
            }
            .padding()
            
            
        } //End VStack
//        .background(Color.gray.opacity(0.1))
    }
    
    //Getting height and width for dynamic sizing
    
    func getWidth(frame: CGRect) -> CGFloat {
        
        let width = frame.width
        
        let actualWidth = width - 40
        
        return actualWidth / 3
        
    }
    
    func getHeight(frame: CGRect) -> CGFloat {
        
        let height = frame.height
        
        let actualHeight = height - 30
        
        return actualHeight / 4
        
    }
    
    func buttonAction(value: String) {
        
        if value == "delete.left" && loginData.phNo != "" {
            
            loginData.phNo.removeLast()
            
        }
        
        if value != "delete.left" {
            loginData.phNo.append(value)
        }
        
    }
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

//Number Data

var rows = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "", "0", "delete.left"]
