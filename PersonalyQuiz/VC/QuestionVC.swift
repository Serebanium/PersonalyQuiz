//
//  QuestionVC.swift
//  PersonalyQuiz
//
//  Created by Сергей Иванов on 17/01/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {

    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multiplyStackView: UIStackView!
    @IBOutlet weak var rangedStackView: UIStackView!
    
    var questionIndex = 0
    
    var questions: [Question] = [
        
        Question(text: "Как часто вы покупаете новые вещи?",
                 type: .single,
                 answers: [
                    Answer(text: "Один раз в полгода и реже", type: .lapot),
                    Answer(text: "Каждые два месяца", type: .ked),
                    Answer(text: "Один раз в месяц", type: .botinok),
                    Answer(text: "Несколько раз в месяц", type: .crosovok),
                ]
                 ),
        
        Question(text: "Какой принт рубашки вам нравится?",
                 type: .multiple,
                 answers: [
                    Answer(text: "В полоску", type: .ked),
                    Answer(text: "В клетку", type: .botinok),
                    Answer(text: "С принтом", type: .crosovok),
                    Answer(text: "Однотонная", type: .lapot),
            ]
        ),
        
        Question(text: "Сколько вы тратили на футболку или рубашку?",
                 type: .ranged,
                 answers: [
                    Answer(text: "100", type: .lapot),
                    Answer(text: "3000", type: .ked),
                    Answer(text: "6000", type: .botinok),
                    Answer(text: "10000", type: .crosovok),
                    
                    ]
        ),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multiplyStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        
        let question = questions[questionIndex]
        
        switch question.type {
        case .single:
            singleStackView.isHidden = false
        case .multiple:
            multiplyStackView.isHidden = false
        case .ranged:
            rangedStackView.isHidden = false
        
        }
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
