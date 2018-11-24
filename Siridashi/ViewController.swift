//
//  ViewController.swift
//  Siridashi
//
//  Created by 能登 要 on 2018/11/13.
//  Copyright © 2018年 Kaname Noto. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        donateInteraction()
    }
    
    func donateInteraction() {
        
        let intent = DashiSendIntent()
        intent.suggestedInvocationPhrase = "出勤報告"
        intent.sendContents = "出勤しました."

        let interaction = INInteraction( intent: intent, response: nil)
        interaction.donate { (error) in
            if let error = error as NSError? {
                print("interaction donation failed: \(error.localizedDescription)")
            }else{
                print("Successfully donated interaction")
            }
        }
    }

}

