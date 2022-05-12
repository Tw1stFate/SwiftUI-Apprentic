//
//  VSyncImgView.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/5/12.
//

import SwiftUI

struct VSyncImgView: View {
    
    let url = URL(string: "https://uploadfile.huiyi8.com/2014/0210/20140210095802824.jpg.270.jpg")
    
    var body: some View {
        VStack {
//            AsyncImage(url: url)
            AsyncImage(url: url, scale: 1.0, content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 200, alignment: .center)
                    .cornerRadius(30)
                //Blur Effects
//                    .overlay(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30))
            }, placeholder: {
                Image(systemName: "photo.fill")
                    .resizable()
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .frame(width: 300, height: 200, alignment: .center)
            })
                .background(.green)
        }
        .navigationTitle("VSync Image")
    }
}

struct VSyncImgView_Previews: PreviewProvider {
    static var previews: some View {
        VSyncImgView()
    }
}
