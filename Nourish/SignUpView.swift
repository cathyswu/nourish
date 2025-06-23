//
//  SignUpView.swift
//  Nourish
//
//  Created by Cathy Wu on 6/22/25.
//

import SwiftUI
import AuthenticationServices
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift
import Firebase

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Text("sign up")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(Color("MainGreen"))

            Spacer()

            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                    TextField("email address", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .foregroundColor(Color(red: 0.502, green: 0.478, blue: 0.478))
                }
                .padding()
                .background(Color("Gray2"))
                .cornerRadius(20)
                .frame(maxWidth: 350)
                .frame(maxWidth: .infinity, alignment: .center)

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
            }
            .padding(.horizontal, 24)

            Spacer()

            Button(action: {
                handleEmailSignUp()
            }) {
                Text("sign up")
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

            // Apple Sign In
            SignInWithAppleButton(
                .signUp,
                onRequest: { request in
                    request.requestedScopes = [.fullName, .email]
                },
                onCompletion: { result in
                    AppleSignInCoordinator.handle(result: result)
                }
            )
            .signInWithAppleButtonStyle(.black)
            .frame(height: 45)
            .cornerRadius(20)
            .padding(.horizontal, 50)

            // Google Sign In
            GoogleSignInButton(action: handleGoogleSignIn)
                .frame(height: 50)
                .padding(.horizontal, 50)

            Spacer()

            HStack {
                Text("have an account?")
                    .foregroundColor(Color("Gray3"))
                NavigationLink(destination: SignInView()) {
                    Text("log in!")
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

    // MARK: - Email/Password Sign Up
    func handleEmailSignUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Email sign-up error: \(error.localizedDescription)")
            } else if let user = result?.user {
                print("Email sign-up success: \(user.email ?? "unknown")")
                // Navigate or store user info
            }
        }
    }

    // MARK: - Google Sign In
    func handleGoogleSignIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        guard let rootViewController = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first?.windows
            .first?.rootViewController else {
                print("No root view controller found.")
                return
        }

        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            if let error = error {
                print("Google Sign-In Error: \(error.localizedDescription)")
                return
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                print("Missing Google user or token")
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)

            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase Sign-In Error: \(error.localizedDescription)")
                    return
                }

                print("Google signed in as: \(authResult?.user.email ?? "Unknown")")
                // Navigate to home or store session
            }
        }
    }
}

// MARK: - Apple Sign-In Coordinator
struct AppleSignInCoordinator {
    static func handle(result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let authResults):
            if let credential = authResults.credential as? ASAuthorizationAppleIDCredential {
                let userID = credential.user
                let email = credential.email
                let name = credential.fullName

                print("Apple ID: \(userID)")
                print("Email: \(email ?? "Not provided")")
                print("Name: \(name?.givenName ?? "") \(name?.familyName ?? "")")

                // TODO: Create credential and sign in with Firebase if desired
            }
        case .failure(let error):
            print("Apple Sign-In failed: \(error.localizedDescription)")
        }
    }
}
