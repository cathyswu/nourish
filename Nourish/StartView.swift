//
//  StartView.swift
//  Nourish
//
//  Created by Cathy Wu on 6/22/25.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                
                Text("nourish")
                    .font(.system(size: 48, weight: .semibold))
                    .foregroundColor(Color("Green"))
                
                Text("feel better, not perfect.")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                
                Spacer()
                
                NavigationLink(destination: SignUpView()) {
                    Text("get started")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("Green"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                NavigationLink(destination: SignInView()) {
                    Text("login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}
