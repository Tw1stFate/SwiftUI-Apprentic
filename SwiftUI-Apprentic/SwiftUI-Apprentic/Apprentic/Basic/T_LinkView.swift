//
//  T_LinkView.swift
//  SwiftUI-Apprentic
//
//  Created by zzz on 2022/5/16.
//

import SwiftUI

struct T_LinkView: View {
    @Environment(\.openURL) var openURL
    var aStr: AttributedString {
        var a = AttributedString("Kavsoft")
        a.link = URL(string: "https://www.youtube.com/c/Kavsoft")
        return a
    }
    var body: some View {
        VStack {
            // 普通
            Link("前往 www.youtube.com", destination: URL(string: "http://www.youtube.com")!)
                .buttonStyle(.borderedProminent)
            Link(destination: URL(string: "https://twitter.com/Kavsoft")!) {
                Label("Kavsoft's Twitter", systemImage: "message.circle.fill")
            }
            
            // AttributedString 链接
            Text(aStr)
            
            // markdown 链接
            Text("[Go YouTube](https://www.youtube.com)")
            
            // 控件使用 OpenURL
            Link("Open Kavsoft", destination: URL(string: "https://www.youtube.com/c/Kavsoft")!)
                .environment(\.openURL, OpenURLAction { url in
                    return .systemAction
                    /// return .handled 不会返回系统打开浏览器动作，只会处理 return 前的事件。
                    /// .discard 和 .handled 类似。
                    /// .systemAction(URL(string: "https://www.anotherurl.com")) 可以返回另外一个 url 来替代指定的url
                })
            
            // 扩展 View 后更简洁的使用 OpenURL
            Link("Kavsoft", destination: URL(string: "https://www.youtube.com/c/Kavsoft")!)
                .goOpenURL { url in
                    print(url.absoluteString)
                    return .systemAction
                }
            
            // 根据内容返回不同链接
            Text("SwiftUI videos in [Youtube Home](https://www.youtube.com), [Kavsoft](https://www.youtube.com/c/Kavsoft)")
                .environment(\.openURL, OpenURLAction { url in
                    switch url.absoluteString {
                    case "YouTube":
                        return .systemAction(URL(string: "https://www.youtube.com")!)
                    case "Kavsoft":
                        return .systemAction(URL(string: "https://www.youtube.com/c/Kavsoft")!)
                    default:
                        return .handled
                    }
                })
        } // end VStack
        .padding()
        
    }
    
    // View 支持 openURL 的能力
    func goUrl(_ url: URL, done: @escaping (_ accepted: Bool) -> Void) {
        openURL(url, completion: done)
    }
}

// 为 View 扩展一个 OpenURL 方法
extension View {
    func goOpenURL(done: @escaping (URL) -> OpenURLAction.Result) -> some View {
        environment(\.openURL, OpenURLAction(handler: done))
    }
}

struct T_LinkView_Previews: PreviewProvider {
    static var previews: some View {
        T_LinkView()
    }
}
