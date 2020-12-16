//
//  Example02View.swift
//  FuncCollectionApp
//
//  Created by Hyunsu Bong on 2020/11/20.
//

import SwiftUI
import Combine
import UIKit
// 이미지 프레임 참고
//https://www.simpleswiftguide.com/swiftui-image-tutorial/

struct photoView: View {
    //만약 리스트뷰와 토글 뷰가 나뉘어 토글에 따라 리스트를 바꿔야 하는 경우처럼 두 개의 뷰가 동시에 하나의 State를 참조해야 하는 경우가 생길 수 있다. 이때 @Binding을 사용할수 있다.
    @Binding var nameList: String
    @Binding var imgList: String
    @Binding var showPictureView: Bool

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("이름입력", text: $nameList)
                    Button(action: {
                        print("consol : 리셋버튼 눌림")
                    }) {
                        Text("사진 가져오기")
                    }
                }
            }
        }
    }
}

struct Example02View: View {
    
    @State var showPictureView = false // 객체 추가 버튼 변수
    @State private var name : String = ""
    @State var nameList: [String] = ["Cat", "Dog", "PONGKI", "Hyuji"]
    @State var imgList: [String] = ["IMG_0078", "IMG_1405", "IMG_1405", "IMG_0078"]
    
    @State private var selected = 0
    
    var body: some View {
        return VStack(alignment: .leading) {
            
            VStack {
                //타이틀
//                Spacer().frame(height: 30)
                
                // Picker 만들기
                // $가 붙으면 값을 수정가능한 Binding 타입을 참조한다
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
            }.navigationBarTitle(Text("2. Picker 구현하기"), displayMode: .inline)
            
        }.onAppear(){
        }.padding(.all, 16.0)
        .navigationBarTitle(Text("설정"), displayMode: .inline)
            
        // 사용자 추가 버튼
        .navigationBarItems(trailing:
            Button(action: {
                self.showPictureView.toggle()
                print("consol : 네비게이션 바 우측 버튼 눌림")
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(Font.system(.title))
            }
        ) // 네비게이션 바 우측에 버튼 추가
            .sheet(isPresented: $showPictureView) {
                SheetView(showSheetView: self.$showPictureView)
            }
    }
}

struct Example02_Previews: PreviewProvider {
    static var previews: some View {
        Example02View()
    }
}
