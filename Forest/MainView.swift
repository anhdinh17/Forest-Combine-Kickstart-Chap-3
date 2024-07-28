//
//  MainView.swift
//  Forest
//
//  Created by Anh Dinh on 7/28/24.
//

import Foundation
import SwiftUI

struct MainView {
    @StateObject private var link = Link()
}

extension MainView: View {
    var body: some View {
        VStack(spacing: 80) {
            Text(link.contents)
            
            Button {
                link.next()
            } label: {
                Text("Next")
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 100, height: 40)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 3))
            }
        }
    }
}
