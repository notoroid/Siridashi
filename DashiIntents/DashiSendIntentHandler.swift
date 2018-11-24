//
//  DashiSendIntentHandler.swift
//  Siridashi
//
//  Created by 能登 要 on 2018/11/14.
//  Copyright © 2018年 Kaname Noto. All rights reserved.
//

import UIKit
import DashiKit

class DashiSendIntentHandler: NSObject,DashiSendIntentHandling {
    
    func handle(intent: DashiSendIntent, completion: @escaping (DashiSendIntentResponse) -> Void) {
        if let sendContents = intent.sendContents {
            PostUseCase.shared.post(sendContents) { (error) in
                if error != nil {
                    let response = DashiSendIntentResponse(code: .failure, userActivity: nil)
                    completion(response)
                } else {
                    let response = DashiSendIntentResponse.success(sendContents: intent.sendContents ?? "" )
                    completion(response)
                }
            }
        } else {
            let response = DashiSendIntentResponse(code: .failure, userActivity: nil)
            completion(response)
        }
    }

}
