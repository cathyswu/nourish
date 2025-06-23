//
//  SignInView.swift
//  Nourish
//
//  Created by Cathy Wu on 6/22/25.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Text("sign in")
                .font(.title)
                .bold()
                .foregroundColor(Color("Green"))
            
            TextField("email address", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)

            SecureField("password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)

            HStack {
                Spacer()
                Button("forgot password?") {
                    // handle reset
                }
                .font(.caption)
                .foregroundColor(.blue)
            }

            Button("login") {
                // handle login
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("Green"))
            .foregroundColor(.white)
            .cornerRadius(10)

            HStack {
                Divider()
                Text("continue with")
                Divider()
            }

            Button {
                // Sign in with Apple
            } label: {
                HStack {
                    Image(systemName: "applelogo")
                    Text("sign in with apple")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }

            Button {
                // Sign in with Google
            } label: {
                HStack {
                    Image(systemName: "g.circle")
                    Text("sign in with google")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }

            Spacer()

            HStack {
                Text("new here?")
                NavigationLink("sign up!", destination: SignUpView())
            }
            .font(.caption)
        }
        .padding()
    }
}
