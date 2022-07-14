//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var user: UserManager
    @State private var name = ""
    
    private var valid: Bool {
        name.count < 3 ? false : true
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                Text("\(name.count)")
                    .foregroundColor(valid ? Color.green : Color.red)
                    .tint(Color.green)
            }
            .padding()
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
            .disabled(!valid)
        }
    }
}

extension RegisterView {
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
