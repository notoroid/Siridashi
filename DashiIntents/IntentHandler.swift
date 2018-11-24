//
//  IntentHandler.swift
//  DashiIntents
//
//  Created by 能登 要 on 2018/11/13.
//  Copyright © 2018年 Kaname Noto. All rights reserved.
//

import Intents
import DashiKit

// https://medium.com/@pietropizzi/a-beginners-guide-to-developing-custom-intent-siri-shortcuts-for-ios-12-a3627b7011af

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        if intent is DashiSendIntent {
            return DashiSendIntentHandler()
        }
        
        return self
    }
    
}

extension IntentHandler : INCreateNoteIntentHandling
{
    func handle(intent: INCreateNoteIntent, completion: @escaping (INCreateNoteIntentResponse) -> Void) {
        
        if let textContent = intent.content as? INTextNoteContent {
            PostUseCase.shared.post(textContent.text ?? "" ) { (error) in
                if let error = error {
                    let response = INCreateNoteIntentResponse(code: .failure, userActivity: nil)
                    completion(response)
                } else {
                    let response = INCreateNoteIntentResponse(code: .success , userActivity: nil)
                    response.createdNote = INNote(title: INSpeakableString(spokenPhrase: "general"), contents: [intent.content!], groupName: nil, createdDateComponents: nil, modifiedDateComponents: nil, identifier: nil)
                    
                    completion(response)
                }
            }
        }else{
            let response = INCreateNoteIntentResponse(code: .failure, userActivity: nil)
            completion(response)
        }
    }
}

