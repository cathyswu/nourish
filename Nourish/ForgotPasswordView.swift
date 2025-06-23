//
//  ForgotPasswordView.swift
//  Nourish
//
//  Created by Cathy Wu on 6/23/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email = ""

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Text("forgot password")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(Color("MainGreen"))

            Text("we'll send you a link to reset your password.")
                .font(.system(size: 16))
                .foregroundColor(Color("Gray3"))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)

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
            .padding(.horizontal, 24)
            
            Spacer()

            Button(action: {
                // handle password reset link send
            }) {
                Text("send reset link")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .frame(maxWidth: 207)
                    .padding()
                    .background(Color("MainGreen"))
                    .cornerRadius(20)
            }
            .padding(.horizontal, 60)

            Spacer()
        }
        .padding()
        .background(Color("Gray1").ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
    }
}
