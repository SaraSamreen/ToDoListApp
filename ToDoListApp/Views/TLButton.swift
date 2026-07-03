//
//  TLButton.swift
//  ToDoListApp
//
//  Created by Mac on 03/07/2026.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    . foregroundColor(background)
                    .frame(height: 45)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Value", background: .pink){
        //Action
    }
}

 
