//
//  ViewController.swift
//  PersonalyQuiz
//
//  Created by Сергей Иванов on 17/01/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        
    }

    @IBAction func unwindToBack(_ : UIStoryboardSegue) -> Void {}
}

