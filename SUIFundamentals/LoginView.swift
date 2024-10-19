//
//  LoginView.swift
//  SUIFundamentals
//
//  Created by Ángel González on 19/10/24.
//

import SwiftUI


struct LoginView : View {
    @State private var email:String=""
    @State private var password:String=""
    @State private var showModal:Bool=false
    @State private var navigate:Bool=false
    @State private var loginResult:String=""
    func doLogin() -> Void {
        if(self.email != "foo@bar.com" || self.password != "secret"){
            self.loginResult="Sorry, try again"
            self.showModal = true
        }
        else {
            self.navigate=true
        }
    }
    
    var body: some View {
        VStack{
            Text("User Login")
                .font(.title)
            HStack {
                Text("Email ").frame(width: 100, height: 40, alignment: .leading)
                TextField("your email", text:$email).textFieldStyle(.roundedBorder)
            }
            HStack {
                Text("Password ").frame(width: 100, height: 40, alignment: .leading)
                SecureField("your password", text:$password).textFieldStyle(.roundedBorder)
            }
            Button(action: {self.doLogin() }){
                Text("Login")
            }
            .alert(isPresented:$showModal) {
                Alert(title:Text("SUI"), message:Text(self.loginResult), dismissButton: .default(Text("OK")))
            }
        }.padding(30)
            .fullScreenCover(isPresented:$navigate, content: {
                ContentView()
            })
    }
}
