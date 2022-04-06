//
//  NewsArticle.swift
//  SpaceNewsProject
//
//  Created by Hana Keinan on 4/5/22.
//


import SwiftUI
import CachedAsyncImage

// data class
struct NewsArticle: View {
    let title: String
    let imageURL: String
    let siteName: String
    let summary: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(siteName)")
                .foregroundColor(.blue)
                .italic()
            
            HStack(alignment: .center) {
                CachedAsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .easeInOut)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .transition(.opacity)
                    } else {
                        HStack {
                            Color.init(red: 0.23, green: 0.100, blue: 0.13)
                                .frame(width: 200, height: 100, alignment: .center)
                                .cornerRadius(10)
                                
                        }
                    }
                }
            }
            Text(title)
                .font(.headline)
                .padding(8)
                
            
            Text(summary)
                .lineLimit(6)
                .font(.subheadline)
                .padding(8)
        }
    }
    
}

struct NewsArticle_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticle(title: "Title", imageURL: "testurl", siteName: "", summary: "")
    }
}

