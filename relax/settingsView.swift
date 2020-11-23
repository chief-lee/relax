//
//  settingsView.swift
//  relax
//
//  Created by 李锦 on 2020/11/20.
//

import SwiftUI

struct settingsView: View {
    @Environment(\.presentationMode) var presentationMode
    var confirmSettingsAction:(String,String)->Void
    @State var relaxInterval :String = "30"
    @State var relaxTime :String = "30"
    var body: some View {
        if #available(OSX 11.0, *) {
            VStack {
                HStack {
                    Text("自定义休息间隔")
                        .padding()
                    HStack {
                        TextField("",text: $relaxInterval)
                            .frame(width: 50, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                            .padding()
                        Text("分钟")
                            .frame(width: 30, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
                HStack {
                    Text("自定义休息时长")
                        .padding()
                    HStack {
                        TextField("",text: $relaxTime)
                            .frame(width: 50, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                            .padding()
                        Text("秒")
                            .frame(width: 30, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
                HStack {
                    HStack {
                        Button(action: {
                            self.confirmSettingsAction(self.relaxInterval,self.relaxTime)
                        }){
                            Text("确定")
                                .padding(5)
                                .background(Color.gray)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .bold))

                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Button(action: {
                            NSApp.hide(nil)
                        }){
                            Text("取消")
                                .padding(5)
                                .background(Color.gray)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .bold))

                        }
                        .buttonStyle(PlainButtonStyle())
//                        Button("取消")
//                        {
//                            self.presentationMode.wrappedValue.dismiss()
//                        }
                    }
                    .padding()
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        settingsView{_,_ in self.test(a: "", b: "")}
    }
    static func test(a:String,b:String)
    {
        
    }
}
