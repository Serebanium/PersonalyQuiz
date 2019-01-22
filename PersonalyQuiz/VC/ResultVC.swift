//
//  ResultVC.swift
//  PersonalyQuiz
//
//  Created by Сергей Иванов on 17/01/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    
    var answers: [Answer]? {
        didSet {
            print(#function, answers ?? "nil")
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        var lapotIndex = 0
        var kedIndex = 0
        var botinokIndex = 0
        var crosovokIndex = 0
        
        for i in answers! {
            switch i.type {
            case .lapot:
                lapotIndex += 1
            case .ked:
                kedIndex += 1
            case .botinok:
                botinokIndex += 1
            case .crosovok:
                crosovokIndex += 1
                
            }
            
        }

        var maxIndex = 0
        var maxType = ""
        
        if lapotIndex > maxIndex {
            maxIndex = lapotIndex
            maxType = "Лапоть"
        }
        
        if kedIndex > maxIndex {
            maxIndex = kedIndex
            maxType = "Кед"
        }
        
        if botinokIndex > maxIndex {
            maxIndex = botinokIndex
            maxType = "Ботинок"
        }
        
        if crosovokIndex > maxIndex {
            maxIndex = crosovokIndex
            maxType = "Кросовок"
        }
        
        switch maxType {
        case "Лапоть":
            imageView.image = UIImage(named: "1.png")
            label.text = "Вы совсем не модный человек! Странно, что вы не носите лапти. Вам срочно нужна помощь стилиста!"
        case "Кед":
            imageView.image = UIImage(named: "2.png")
            label.text = "Вы не достаточно разбираетесь в моде. Валенки на свадьбу вы не надеваете, но вам не помешают подсказки стилиста."
        case "Ботинок":
            imageView.image = UIImage(named: "3.png")
            label.text = "Вы неплохо разбираетесь в моде и у вас есть свой стиль. Рекомендуем пообщаться с нашими стилистами для расширения вашего гардероба."
        case "Кросовок":
            imageView.image = UIImage(named: "4.png")
            label.text = "В погоне за модой вы теряете свой стиль, обратитесь к нашим стилистам и они подскажут вам как тратить меньше и выглядеть лучше."
        default:
            return
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
