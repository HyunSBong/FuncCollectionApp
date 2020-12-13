//
//  Example04View.swift
//  FuncCollectionApp
//
//  Created by Hyunsu Bong on 2020/12/12.
//

import SwiftUI

struct UserView: View { // 사용자 추가 뷰
    @Binding var showUserView: Bool

    var body: some View {
        NavigationView {
            Text("사용자 추가 화면입니다.")
            .navigationBarTitle(Text("사용자 추가"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    print("consol : 완료버튼 눌림")
                    self.showUserView = false
                }) {
                    Text("완료").bold()
                })
        }
    }
}

struct Example04View: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var isAuto: Bool = true
    @State var notifivationEnabled: Bool = false
    @State private var previewIndex = 0
    @State var showUserView = false // 사용자 추가 버튼 변수
    var previewOptions = ["항상", "사용자 설정"]
    
    
    var body: some View {
//        NavigationView {
            Form {
                Section(header: Text("프로파일")) {
                    TextField("UserName", text: $username)
                    TextField("PassWord", text: $password)
                    Toggle(isOn: $isAuto) {
                        Text("Automatic Login")
                    }
                }
                Section(header: Text("알림")) {
                    Toggle(isOn: $notifivationEnabled) {
                        Text("알림 허용")
                    }
                    Picker(selection: $previewIndex, label: Text("알림 형태")) {
                        ForEach(0 ..< previewOptions.count) {
                            Text(self.previewOptions[$0])
                        }
                    }
                }

                Section(header: Text("ABOUT")) {
                    HStack {
                        Text("Version")
                        Text("0.0.1")
                    }
                }

                Section {
                    Button(action: {
                        print("consol : 리셋버튼 눌림")
                    }) {
                        Text("Reset")
                    }
                }
            }
//            .navigationBarItems(trailing:
//                    Button(action: {
//                        self.showSheetView.toggle()
//                        print("consol : 네비게이션 바 우측 버튼 눌림")
//                    }) {
//                        Image(systemName: "bell.circle.fill")
//                            .font(Font.system(.title))
//                    }
//                ) // 네비게이션 바 우측에 버튼 추가
//        }.sheet(isPresented: $showUserView) {
//            SheetView(showUserView: self.$showUserView)
//        }
            
        .navigationBarTitle(Text("설정"), displayMode: .inline)
            
        // 사용자 추가 버튼
        .navigationBarItems(trailing:
            Button(action: {
                self.showUserView.toggle()
                print("consol : 네비게이션 바 우측 버튼 눌림")
            }) {
                Image(systemName: "bell.circle.fill")
                    .font(Font.system(.title))
            }
        ) // 네비게이션 바 우측에 버튼 추가
            .sheet(isPresented: $showUserView) {
                SheetView(showSheetView: self.$showUserView)
            }
    }
}



struct Example04View_Previews: PreviewProvider {
    static var previews: some View {
        Example04View()
    }
}
