//
//  ContentView.swift
//  Project1Fix
//
//  Created by Cameron Eric Scott on 9/13/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: ScrollCardView()) {
                    HStack {
                        Image(systemName: "tortoise")
                            .font(.title)
                        Text("SF Image")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .background(Color.gray)
                    .cornerRadius(15)
                }
                
                NavigationLink(destination: LargeSFImageView()) {
                    HStack {
                        Image(systemName: "tray")
                            .font(.title)
                        Text("ScrollView")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .background(Color.gray)
                    .cornerRadius(15)
                }
                
                NavigationLink(destination: ShapeArtView()) {
                    HStack {
                        Image(systemName: "ant")
                            .font(.title)
                        Text("Crazy Image")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .background(Color.gray)
                    .cornerRadius(15)
                }
            }
            .padding(.horizontal, 30)
            .navigationTitle("My First Content View")
        }
    }
}

// MARK: - View 1: Cards About You (Horizontal ScrollView)
struct ScrollCardView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                CardView(imageName: "house.fill", title: "Hometown", description: "I was born and raised in Alpharetta, Georgia.")
                CardView(imageName: "graduationcap.fill", title: "Education", description: "Graduated from Kennesaw State University with a BA in Journalism and Emerging Media.")
                CardView(imageName: "books.vertical.fill", title: "Graduate Studies", description: "Currently pursuing a Master's in Journalism and Mass Communication at UGA.")
                CardView(imageName: "figure.hiking", title: "Outdoors", description: "I enjoy spending time backpacking and exploring nature trails with friends.")
            }
            .padding()
        }
        .navigationTitle("Cards About You")
    }
}

struct CardView: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        VStack(spacing: 15) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .foregroundColor(.white)
            
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.horizontal)
        }
        .frame(width: 300, height: 450)
        .background(Color.red)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

// MARK: - View 2: Large SF Symbol
struct LargeSFImageView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(systemName: "person.crop.circle.fill.badge.checkmark")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.teal, Color.red)
                    .font(.system(size: 140))
                
                ZStack {
                    Circle()
                        .trim(from: 0.2, to: 0.8)
                        .stroke(Color.teal, lineWidth: 16)
                        .frame(width: 260, height: 260)
                        .rotationEffect(.degrees(180))
                    
                    Circle()
                        .trim(from: 0.2, to: 0.8)
                        .stroke(Color.teal, lineWidth: 16)
                        .frame(width: 180, height: 180)
                        .rotationEffect(.degrees(180))
                }
            }
        }
        .navigationTitle("Large SF Symbol")
    }
}

// MARK: - View 3: Shape Art
struct ShapeArtView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.yellow.opacity(0.4), Color.orange.opacity(0.3)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                Rectangle()
                    .fill(Color.green.opacity(0.85))
                    .frame(height: 280)
            }
            .ignoresSafeArea()
            
            ZStack {
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 130, height: 130)
                    .offset(y: -90)
                
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 240, height: 340)
                    .rotationEffect(.degrees(45))
                    .offset(x: -85, y: -10)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.8))
                    .frame(width: 240, height: 340)
                    .rotationEffect(.degrees(-45))
                    .offset(x: 85, y: -10)
                
                VStack {
                    Spacer()
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(width: 55, height: 320)
                }
            }
        }
        .navigationTitle("Shape Art")
    }
}

#Preview {
    ContentView()
}
