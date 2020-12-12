//
//  Example04View.swift
//  FuncCollectionApp
//
//  Created by Hyunsu Bong on 2020/12/12.
//

import SwiftUI

struct Example04View: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var isAuto: Bool = true
    @State var notifivationEnabled: Bool = false
    @State private var previewIndex = 0
    var previewOptions = ["항상", "사용자 설정"]
    
    
    var body: some View {
        NavigationView {
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
                        Spacer()
                        Text("0.0.1")
                    }
                }
                
                Section {
                    Button(action: {
                        print("action")
                    }) {
                        Text("Reset")
                    }
                }
            }
            .navigationBarTitle("설정")
        }
    }
}

struct Example04View_Previews: PreviewProvider {
    static var previews: some View {
        Example04View()
    }
}
