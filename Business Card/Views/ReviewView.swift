//
//  ReviewView.swift
//  Business Card
//
//  Created by Tim Bausch on 10/15/22.
//

import SwiftUI

struct ReviewView: View {
    let title: String
    let rating: Int
    let comment: String
    var body: some View {
        VStack(alignment: .center) {
            Text(title)
                .fontWeight(.bold)
            HStack(alignment: .center, spacing: 1) {
                ForEach(1..<6) { index in
                    if index <= rating {
                        Image(systemName: "star.fill")
                            .renderingMode(.template)
                            .foregroundColor(.purple)
                    }
                    else {
                        Image(systemName: "star")
                            .renderingMode(.template)
                            .foregroundColor(.purple)
                    }
                }
            }
            Divider()
            VStack(alignment: .leading) {
                Text(comment)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding([.leading, .trailing, .bottom])
        }
        .padding()
    }
}


