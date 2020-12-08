//
//  Example01View.swift
//  FuncCollectionApp
//
//  Created by Hyunsu Bong on 2020/11/20.
//

import SwiftUI

struct Example01View: View {
    var body: some View {
        VStack {
            //타이틀
            Text("1. 텍스트 표시하기")
                .font(.title)
            Spacer().frame(height: 30)
            Text("Hello, Swift!!")
        }
    }
}

struct Example01View_Previews: PreviewProvider {
    static var previews: some View {
        Example01View()
    }
}
