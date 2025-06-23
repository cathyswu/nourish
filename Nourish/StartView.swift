//
//  StartView.swift
//  Nourish
//
//  Created by Cathy Wu on 6/22/25.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Gray1").ignoresSafeArea(.all)
                
                VStack() {
                    Spacer()
                    Text("nourish")
                        .font(.system(size: 64, weight: .bold))
                        .foregroundColor(Color("MainGreen"))
                    
                    Text("feel better, not perfect.")
                        .foregroundColor(Color("Gray3"))
                        .font(.system(size: 16))
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        NavigationLink(destination: SignUpView()) {
                            Text("get started")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("MainGreen"))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .font(.system(size: 16))
                        }
                        .padding(.horizontal, 60)
                        
                        NavigationLink(destination: SignInView()) {
                            Text("login")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("Gray2"))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .font(.system(size: 16))
                        }
                        .padding(.horizontal, 60)
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}
