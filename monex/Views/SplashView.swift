//
//  SplashView.swift
//  monex
//
//  Created by Arosha on 2025-07-10.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "bolt.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.blue)
                .padding(.bottom, 24)
            Text("monex")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(Color(.label))
                .padding(.bottom, 32)
            Text("Gain total control\nof your money")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 8)
            Text("Become your own money manager and make every cent count")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.bottom, 32)
            Button(action: {}) {
                Text("Let's Go")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color.blue)
                    .cornerRadius(14)
            }
            .padding(.horizontal, 32)
            Spacer()
        }
        .background(Color.white.ignoresSafeArea())
    }
} 
