//
//  ImageButton.swift
//  Instancing
//
//  Created by Reza Ali on 1/21/21.
//  Copyright © 2020 Reza Ali. All rights reserved.
//

import SwiftUI

struct ImageButton: View {
    var image: String
    var imageSize: CGFloat
    var imagePadding: CGFloat
    var color: Color
    var action: (() -> Void)
    var body: some View {
        let size = imageSize + imagePadding * 2.0
        #if os(macOS)
            return Button(action: action, label: {
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: imageSize, height: imageSize)
                    .aspectRatio(contentMode: .fit)
                    .padding(imagePadding)
                    .foregroundColor(color)
            })
                .buttonStyle(BorderlessButtonStyle())
            .frame(width: size, height: size)
        #else
            return Button(action: action, label: {
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: imageSize, height: imageSize)
                    .aspectRatio(contentMode: .fit)
                    .padding(imagePadding)
                    .foregroundColor(color)
            })
                .frame(width: size, height: size)
        #endif
    }
}

struct ImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButton(
            image: "Face",
            imageSize: 24,
            imagePadding: 8,
            color: Color("Icon"),
            action: {print("hello")})
    }
}
