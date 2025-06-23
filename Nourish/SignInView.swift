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
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(Color("MainGreen"))
            
            Spacer()
            
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                    TextField("email address", text: $email)
                        .foregroundColor(Color(red: 0.502, green: 0.478, blue: 0.478))
                }
                .padding()
                .background(Color("Gray2"))
                .cornerRadius(20)
                .frame(maxWidth: 350)
                .frame(maxWidth: .infinity, alignment: .center)
                
                VStack(alignment: .trailing, spacing: 4) {
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.black)
                        SecureField("password", text: $password)
                            .foregroundColor(Color(red: 0.502, green: 0.478, blue: 0.478))
                    }
                    .padding()
                    .background(Color("Gray2"))
                    .cornerRadius(20)
                    .frame(maxWidth: 350)
                    .frame(maxWidth: .infinity, alignment: .center)

                    NavigationLink(destination: ForgotPasswordView()) {
                        Text("forgot password?")
                            .font(.system(size: 14))
                            .foregroundColor(Color("Gray3"))
                            .underline()
                    }
                    .padding(.trailing, 8)
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            Button(action: {
                // handle log in
            }) {
                Text("login")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .frame(maxWidth: 207)
                    .padding()
                    .background(Color("MainGreen"))
                    .cornerRadius(20)
            }
            .padding(.horizontal, 60)
            
            Spacer()
            Spacer()
            
            Divider()
                .frame(height: 1)
                .background(Color(.black))
            
            HStack {
                
                Text("or continue with")
                    .foregroundColor(Color("Gray3"))
                    .font(.system(size: 16))
                
            }
            
            
            
            Button(action: {
                // sign in with Apple
            }) {
                HStack {
                    Image(systemName: "applelogo")
                    Text("sign in with apple")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Gray2"))
                .foregroundColor(.black)
                .cornerRadius(20)
            }
            .padding(.horizontal, 50)
            
            Button(action: {
                // sign in with Google
            }) {
                HStack {
                    Image("image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 13, height: 13)
                    Text("sign in with google")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Gray2"))
                .foregroundColor(.black)
                .cornerRadius(20)
            }
            .padding(.horizontal, 50)
            
            Spacer()
            
            HStack {
                Text("new here?")
                    .foregroundColor(Color("Gray3"))
                NavigationLink(destination: SignUpView()) {
                    Text("sign up!")
                        .foregroundColor(Color("Gray3"))
                        .underline()
                }
            }
            .font(.system(size: 14))
            .padding(.top, 8)
            
            Spacer()
        }
        .padding()
        .background(Color("Gray1").ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
