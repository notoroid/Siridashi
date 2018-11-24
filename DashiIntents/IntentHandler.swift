//
//  IntentHandler.swift
//  DashiIntents
//
//  Created by 能登 要 on 2018/11/13.
//  Copyright © 2018年 Kaname Noto. All rights reserved.
//

import Intents
import SlackKit

// https://medium.com/@pietropizzi/a-beginners-guide-to-developing-custom-intent-siri-shortcuts-for-ios-12-a3627b7011af

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        guard intent is DashiSendIntent else {
            fatalError("Unhandled intent type: \(intent)")
        }
        
        return DashiSendIntentHandler()
    }
    
}


