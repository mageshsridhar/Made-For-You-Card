//
//  ContentView.swift
//  Made For You Card
//
//  Created by Magesh Sridhar on 12/29/24.
//

import SwiftUI

/// Where a background blob sits at one end of the animation.
private struct BlobPose {
    let x: CGFloat
    let y: CGFloat
    let degrees: Double
    let axis: (x: CGFloat, y: CGFloat, z: CGFloat)
}

/// One blurred, coloured shape in the animated gradient background.
private struct Blob {
    let shape: AnyShape
    let color: Color
    let blur: CGFloat
    var opacity: Double = 1
    /// Pose when `animate` is false.
    let rest: BlobPose
    /// Pose when `animate` is true.
    let moved: BlobPose
}

private let blobs: [Blob] = [
    Blob(shape: AnyShape(Circle()), color: .red, blur: 10,
         rest: BlobPose(x: 130, y: 160, degrees: 0, axis: (0.5, 0.7, 0)),
         moved: BlobPose(x: 10, y: 20, degrees: 30, axis: (0, 0.2, 0.4))),
    Blob(shape: AnyShape(RoundedRectangle(cornerRadius: 10)), color: .pink, blur: 20,
         rest: BlobPose(x: 10, y: 20, degrees: 20, axis: (0, 0.1, 0.5)),
         moved: BlobPose(x: -120, y: -100, degrees: 80, axis: (0.4, 0, 0))),
    Blob(shape: AnyShape(Rectangle()), color: .green, blur: 30,
         rest: BlobPose(x: 20, y: 140, degrees: 50, axis: (0, 0.2, 0.3)),
         moved: BlobPose(x: -60, y: 5, degrees: 20, axis: (0, 0.4, 0.9))),
    Blob(shape: AnyShape(Capsule()), color: .mint, blur: 40,
         rest: BlobPose(x: 0, y: 140, degrees: 0, axis: (0.1, 0.3, 0.4)),
         moved: BlobPose(x: 60, y: -10, degrees: -30, axis: (0.6, 0.2, 0.1))),
    Blob(shape: AnyShape(Circle()), color: .blue, blur: 50,
         rest: BlobPose(x: -10, y: 40, degrees: 0, axis: (0.6, 0, 0.4)),
         moved: BlobPose(x: 90, y: -90, degrees: 10, axis: (0.4, 0.1, 0.6))),
    Blob(shape: AnyShape(RoundedRectangle(cornerRadius: 10)), color: .teal, blur: 60,
         rest: BlobPose(x: 40, y: -20, degrees: 10, axis: (0.2, 0, 0)),
         moved: BlobPose(x: -90, y: 90, degrees: -20, axis: (0, 0, 0.4))),
    Blob(shape: AnyShape(Capsule()), color: .yellow, blur: 70, opacity: 0.4,
         rest: BlobPose(x: 170, y: -150, degrees: 0, axis: (0.1, 0.1, 0.6)),
         moved: BlobPose(x: 10, y: 0, degrees: 30, axis: (0, 0.5, 0.2))),
]

struct ContentView: View {
    @State private var animate = false

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ForEach(blobs.indices, id: \.self) { i in
                    let blob = blobs[i]
                    let pose = animate ? blob.moved : blob.rest
                    blob.shape
                        .fill(blob.color)
                        .blur(radius: blob.blur)
                        .offset(x: pose.x, y: pose.y)
                        .opacity(blob.opacity)
                        .rotation3DEffect(.degrees(pose.degrees), axis: pose.axis)
                }

                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 15) {
                            HStack(spacing: 2) {
                                Image(systemName: "applelogo")
                                    .font(.title2)
                                Text("Music").font(.title)
                            }
                            Text("Get Up!")
                                .font(.system(size: 40, weight: .heavy))
                            Text("Mix")
                                .font(.system(size: 40, weight: .regular))
                                .padding(.vertical, -25)
                        }
                        Spacer()
                    }
                    .padding(32)
                    Spacer()
                    Text("Imagine Dragons, Adele, Justin Bieber, Dua Lipa, Selena Gomez, John Legend, Harry Styles, The Weeknd, Ariana Grande...")
                        .font(.subheadline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                        .multilineTextAlignment(.center)
                }
                .foregroundStyle(.white)
            }
            .frame(width: UIScreen.main.bounds.width - 60, height: UIScreen.main.bounds.height / 2)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black.opacity(0.25), radius: 25, x: 0, y: 20)
            .onAppear {
                withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
                    animate.toggle()
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
