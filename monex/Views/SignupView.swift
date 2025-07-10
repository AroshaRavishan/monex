//
//  SignupView.swift
//  monex
//
//  Created by Arosha on 2025-07-10.
//

import SwiftUI

struct SignupView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    @State private var fullName = ""
    @State private var birthYear = ""
    @State private var gender = ""
    var onLogin: (() -> Void)? = nil
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
            Text("Create Account")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 24)
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Full Name")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    TextField("Your full name", text: $fullName)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Birth Year")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    TextField("e.g. 1995", text: $birthYear)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Gender")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    TextField("Gender", text: $gender)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Email address")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    TextField("Your email", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Password")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    HStack {
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                        } else {
                            SecureField("Password", text: $password)
                        }
                        Button(action: { isPasswordVisible.toggle() }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 24)
            Button(action: {}) {
                Text("Create Account")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color.blue)
                    .cornerRadius(14)
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 16)
            HStack {
                Text("Already have an account?")
                    .foregroundColor(.gray)
                Button(action: { onLogin?() }) {
                    Text("Sign in")
                        .foregroundColor(Color.blue)
                }
            }
            Spacer()
        }
        .background(Color.white.ignoresSafeArea())
    }
} 
