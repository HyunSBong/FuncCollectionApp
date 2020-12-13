//
//  Example05View.swift
//  FuncCollectionApp
//
//  Created by Hyunsu Bong on 2020/12/08.
//

import SwiftUI

struct Example05View: View {
    @State var circleSize: Float = 20.0
    @State var stepperValue: Int = 0

    var body: some View {
        VStack { // 두 개 이상의 UI의 수직배열을 위함
            VStack {
                Text("5. Stepper 구현하기").font(.title)
                Spacer().frame(height: 10)
                Text("원의 크기 조정하기").font(.title2)
            }
            HStack { // 수평 배열
                Spacer() // 공란
                Stepper("Size (MAX : 300) : \(circleSize, specifier: "%.1f")", value: $circleSize, in: 10...300, step: 0.5) // 크기 정보가 cicleSize 변수에 바인딩됨
//                    .frame(width: 100, height: 50)
                Spacer() // 공란
            }
            Spacer().frame(height: 30)
            Circle()
                .frame(width: CGFloat(circleSize), height: CGFloat(circleSize)) // circleSize 정보를 가져와 반영
                .foregroundColor(.blue)
                .animation(.easeIn)
            
            Spacer()
            Spacer()
        }.padding()
    }
}

struct Example05View_Previews: PreviewProvider {
    static var previews: some View {
        Example05View()
    }
}
