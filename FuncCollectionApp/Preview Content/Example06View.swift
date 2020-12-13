//
//  Example06View.swift
//  FuncCollectionApp
//
//  Created by Hyunsu Bong on 2020/12/13.
//

import SwiftUI

struct Example06View: View {
    
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var image: UIImage?
    
    var body: some View {
            VStack {
                HStack {
                    Text("사진을 가져오려면 우측 상단의 버튼을 누르세요.")
                }
                Image(uiImage: image ?? UIImage(named: "placeholder")!) // 사진이 표시될 공간
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300, alignment: .center).padding()
            }.navigationBarTitle(Text("앨범사진 가져오기"), displayMode: .inline)
            
            // 사용자 추가 버튼
            .navigationBarItems(trailing:
                Button(action: {
                    self.showSheet.toggle()
                    print("consol : 네비게이션 바 우측 버튼 눌림")
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(Font.system(.title))
                }.actionSheet(isPresented: $showSheet) {
                    ActionSheet(title: Text("사진 선택"),
                                message: Text("선택"), buttons:[
                                    .default(Text("사진 앨범")) {
                        self.showImagePicker = true
                        self.sourceType = .photoLibrary
                    },
                    .default(Text("카메라")) {
                    self.showImagePicker = true
                    self.sourceType = .camera
                    },
                    .cancel()
                    ])
                }
            ) // 네비게이션 바 우측에 버튼 추가
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
            }
    }
}

struct Example06View_Previews: PreviewProvider {
    static var previews: some View {
        Example06View()
    }
}
