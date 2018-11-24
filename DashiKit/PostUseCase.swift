//
//  PostUsecase.swift
//  DashiKit
//
//  Created by 能登 要 on 2018/11/22.
//  Copyright © 2018年 Kaname Noto. All rights reserved.
//

import UIKit
import SlackKit

public typealias PostUseCaseCompletionBlock = (_ error: Error?) -> Void

public class PostUseCase: NSObject {
    public static let shared = PostUseCase()
    
    private let slack = SlackKit()
    private func setupSlask() {
        slack.addWebAPIAccessWithToken(Strings.AccessToken)
    }
    
    override init() {
        super.init()
        setupSlask()
    }

    public func post(_ message:String, completion:@escaping PostUseCaseCompletionBlock ){
        if let webAPI = self.slack.webAPI {
            webAPI.sendMessage(channel: Strings.Channel, text: message, success: { (ts,ch) in
                print("send succeeded")
                completion(nil)
            }, failure: { (error) in
                print("not found webAPi:error=\(error.localizedDescription)")
                completion(error)
            })
        }else{
            print("not found webAPi")
            completion(nil)
        }
    }
    
}
