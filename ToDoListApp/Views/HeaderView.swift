//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Mac on 03/07/2026.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(background)
                    .rotationEffect(Angle(degrees: angle))
                    .frame(width: geo.size.width * 3, height: 360)
                
                VStack{
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                    Text(subtitle)
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                }
                .padding(.top, 100)
            }
            .frame(width: geo.size.width, height: 300)
            .offset(y: -150)
        }
         .frame(height: 300)
    }
}

#Preview {
    HeaderView(title:"Title", subtitle: "Subtitle", angle: 15, background: .blue)
}
