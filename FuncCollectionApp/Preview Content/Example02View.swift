//
//  Example02View.swift
//  FuncCollectionApp
//
//  Created by Hyunsu Bong on 2020/11/20.
//

import SwiftUI
import Combine
// 이미지 프레임 참고
//https://www.simpleswiftguide.com/swiftui-image-tutorial/

struct Example02View: View {
    
    @State private var name : String = ""
    var nameList = ["Cat", "Dog", "PONGKI", "Hyuji"]
    var imgList = ["IMG_0078", "IMG_1405", "IMG_1405", "IMG_0078"]
    
    @State private var selected = 0
    
    var body: some View {
        return VStack(alignment: .leading) {
            
            VStack {
                //타이틀
//                Spacer().frame(height: 30)
                Text("2. Picker 구현하기")
                    .font(.title)
                
                // Picker 만들기
                Picker(selection: $selected, label: Text("동물")) {
                    ForEach(0 ..< nameList.count) {
                        Text(self.nameList[$0])
                    }
                }
                Text("선택 : \(nameList[selected])")
                Image(imgList[selected])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350.0, height: 350.0, alignment: .center)
            }
            
        }.onAppear(){
        }.padding(.all, 16.0)
    }
}

struct Example02_Previews: PreviewProvider {
    static var previews: some View {
        Example02View()
    }
}
