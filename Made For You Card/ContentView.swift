//
//  ContentView.swift
//  Made For You Card
//
//  Created by Magesh Sridhar on 12/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = false
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Circle()
                    .fill(.red)
                    .blur(radius: 10)
                    .offset(x:animate ? 10 : 130,y:animate ? 20 : 160)
                    .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.5, y: animate ? 0.2 : 0.7, z: animate ? 0.4 : 0))
                RoundedRectangle(cornerRadius: 10)
                    .fill(.pink)
                    .blur(radius: 20)
                    .offset(x: animate ? -120 : 10,y :animate ? -100 : 20)
                    .rotation3DEffect(.degrees(animate ? 80 : 20), axis: (x: animate ? 0.4 : 0, y: animate ? 0 : 0.1, z: animate ? 0 : 0.5))
                Rectangle()
                    .fill(.green)
                    .blur(radius: 30)
                    .offset(x: animate ? -60 : 20,y: animate ? 5 : 140)
                    .rotation3DEffect(.degrees(animate ? 20 : 50), axis: (x: animate ? 0 : 0, y: animate ? 0.4 : 0.2, z: animate ? 0.9 : 0.3))
                Capsule()
                    .fill(.mint)
                    .blur(radius: 40)
                    .offset(x: animate ? 60 : 0,y: animate ? -10 : 140)
                    .rotation3DEffect(.degrees(animate ? -30 : 0), axis: (x: animate ? 0.6 : 0.1, y: animate ? 0.2 : 0.3, z: animate ? 0.1 : 0.4))
                Circle()
                    .fill(.blue)
                    .blur(radius: 50)
                    .offset(x: animate ? 90 : -10,y:animate ? -90 : 40)
                    .rotation3DEffect(.degrees(animate ? 10 : 0), axis: (x: animate ? 0.4 : 0.6, y: animate ? 0.1 : 0, z: animate ? 0.6 : 0.4))
                RoundedRectangle(cornerRadius: 10)
                    .fill(.teal)
                    .blur(radius: 60)
                    .offset(x: animate ? -90 : 40,y:animate ? 90 : -20)
                    .rotation3DEffect(.degrees(animate ? -20 : 10), axis: (x: animate ? 0 : 0.2, y: animate ? 0 : 0 , z: animate ? 0.4 : 0))
                Capsule()
                    .fill(.yellow)
                    .blur(radius: 70)
                    .offset(x: animate ? 10 : 170 ,y:animate ? 0 : -150)
                    .opacity(0.4)
                    .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.1, y: animate ? 0.5 : 0.1, z: animate ? 0.2 : 0.6))
                
                VStack() {
                    HStack {
                        VStack(alignment:.leading,spacing:15) {
                            HStack(spacing: 2) {
                                Image(systemName: "applelogo")
                                    .font(.title2)
                                Text("Music").font(.title)
                            }
                            Text("Get Up!")
                                .bold()
                                .font(.system(size: 40, weight: .heavy))
                            Text("Mix")
                                .font(.system(size: 40, weight: .regular)).padding(.vertical,-25)
                        }
                        Spacer()
                    }.padding().padding()
                    Spacer()
                    Text("Imagine Dragons, Adele, Justin Beiber, Dua Lipa, Selena Gomez, John Legend, Harry Styles, The Weeknd, Ariana Grande...")
                        .font(.subheadline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                        .multilineTextAlignment(.center)
                }.foregroundColor(.white)
                
            }.frame(width: UIScreen.main.bounds.width - 60,height: UIScreen.main.bounds.height/2)
                .clipped()
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.25), radius: 25, x: 0, y: 20)
                .onAppear() {
                    withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
                        animate.toggle()
                    }
                }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
