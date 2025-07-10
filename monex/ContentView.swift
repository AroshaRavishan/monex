//
//  ContentView.swift
//  monex
//
//  Created by Arosha on 2025-07-10.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    @State private var showOnboard = false
    @State private var showLogin = false
    @State private var showSignup = false
    var body: some View {
        ZStack {
            if showSplash {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            showSplash = false
                            showOnboard = true
                        }
                    }
            } else if showOnboard {
                OnboardView(
                    onSignIn: {
                        showOnboard = false
                        showLogin = true
                    },
                    onSignup: {
                        showOnboard = false
                        showSignup = true
                    }
                )
            } else if showLogin {
                LoginView(onSignup: {
                    showLogin = false
                    showSignup = true
                })
            } else if showSignup {
                SignupView(onLogin: {
                    showSignup = false
                    showLogin = true
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
