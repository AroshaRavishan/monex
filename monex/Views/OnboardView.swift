//
//  OnboardView.swift
//  monex
//
//  Created by Arosha on 2025-07-10.
//

import SwiftUI

struct OnboardView: View {
    var onSignIn: (() -> Void)? = nil
    var onSignup: (() -> Void)? = nil
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "bolt.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(Color.blue)
                .padding(.bottom, 8)
            Text("monex")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(Color(.label))
                .padding(.bottom, 24)
            Image(systemName: "person.3.sequence.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 180)
                .foregroundColor(Color.blue)
                .padding(.bottom, 32)
            Text("Simple Money Management")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 8)
            Text("Get your notifications or alert when you do the over expenses")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.bottom, 32)
            VStack(spacing: 16) {
                Button(action: { onSignIn?() }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.blue)
                        .cornerRadius(14)
                }
                Button(action: { onSignup?() }) {
                    Text("Create account")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                }
            }
            .padding(.horizontal, 32)
            Spacer()
        }
        .background(Color.white.ignoresSafeArea())
    }
} 
