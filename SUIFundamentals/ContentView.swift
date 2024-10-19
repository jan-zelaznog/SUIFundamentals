//
//  ContentView.swift
//  SUIFundamentals
//
//  Created by Ángel González on 19/10/24.
//

import SwiftUI
struct ContentView: View {
    @State private var enRojo = false
    @State private var contador = 0
    @State private var alerta = false
    
    var body: some View {
        VStack {
            // UIImageView() = UIImage(syste:"globe")
            Image(systemName: "globe").imageScale(.large).foregroundStyle(.tint).padding(15)
            // UILabel().text = "Hello"
            Text("Hello, world!").foregroundColor(self.enRojo ? .red : .blue).padding(15)

            Toggle(isOn:$enRojo) {Text("cambia color")}.padding(50)
            
            Button {
                self.incremento()
            } label: {
                Text ("Tocaste \(self.contador) vez")
            }
            .padding(15)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button {
                self.pruebaAlert()
            } label: {
                Text ("Prueba tu suerte...")
            }
            .padding(15)
            .background(Color(red:0.0, green:0.1, blue:1.0)) // #FF993c
            .foregroundColor(.white)
            .cornerRadius(10)
            .alert(isPresented:$alerta, content: {
                Alert(title:Text("SUI"), message:Text("Bravo! Ganaste"), dismissButton: .default(Text("yeiiii")))
            })
        }.padding(15)
    }
    func incremento () {
        self.contador += 1
    }
    func pruebaAlert() {
        self.alerta = (self.contador == 10)
    }
}

#Preview {
    ContentView()
}
