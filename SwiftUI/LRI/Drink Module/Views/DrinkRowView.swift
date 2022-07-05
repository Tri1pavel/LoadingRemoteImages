//
//  DrinkRowView.swift
//  LRI
//
//  Created by Development on 05.07.2022.
//

import SwiftUI
import CachedAsyncImage

struct DrinkRowView: View {
    private let item: DrinkItem
    
    init(item: DrinkItem) {
        self.item = item
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Group {
                    /// Image of drink
                    CachedAsyncImage(url: URL(string: item.strDrinkThumb), urlCache: .shared) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ZStack {
                            Image("placeholder")
                                .resizable()
                                .scaledToFill()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        }
                    }

                    /// Name of drink
                    VStack {
                        Spacer()
                        ZStack {
                            Text("\(item.strDrink)")
                                .font(Font.system(size: 25.0))
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                                .padding(.all, 10.0)
                                .frame(width: geometry.size.width,
                                       alignment: .leading)
                                .background {
                                    Rectangle()
                                        .opacity(0.7)
                                }
                                
                        }
                        
                    }
                }
                .frame(width: geometry.size.width, height: 230.0)
            }
        }
    }
}
