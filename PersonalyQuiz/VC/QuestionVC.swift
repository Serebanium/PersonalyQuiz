//
//  QuestionVC.swift
//  PersonalyQuiz
//
//  Created by Сергей Иванов on 17/01/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {

    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multiplyStackView: UIStackView!
    @IBOutlet var multyLabels: [UILabel]!
    @IBOutlet var multySwitches: [UISwitch]!
    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rengedSlider: UISlider!
    
    
    @IBOutlet weak var progressView: UIProgressView!
    
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
        
        Question(text: "Сколько вы тратили на джинсы или брюки?",
                 type: .ranged,
                 answers: [
                    Answer(text: "100", type: .lapot),
                    Answer(text: "3000", type: .ked),
                    Answer(text: "6000", type: .botinok),
                    Answer(text: "10000", type: .crosovok),
                    
                    ]
        ),
        
        Question(text: "Какой фасон брюк вы предпочитаете?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Укороченные", type: .crosovok),
                    Answer(text: "Зауженные", type: .botinok),
                    Answer(text: "Прямые", type: .ked),
                    Answer(text: "Свободные", type: .lapot),
                    ]
        ),
        
        Question(text: "Какая обувь вам нравится?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Кеды", type: .ked),
                    Answer(text: "Кроссовки", type: .crosovok),
                    Answer(text: "Ботинки", type: .botinok),
                    Answer(text: "Сандали", type: .lapot),
                    ]
        ),
        
    ]
    
    var answersChosen = [Answer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        
        rengedSlider.value = 0.5
        
        for i in multySwitches {
            i.isOn = false
        }
        
        singleStackView.isHidden = true
        multiplyStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let question = questions[questionIndex]
        let answers = question.answers
        let progress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        questionLabel.text = question.text
        progressView.setProgress(progress, animated: true)
        
        switch question.type {
        case .single:
            updateSingleStack(with: answers)
        case .multiple:
            updateMultipleStack(with: answers)
        case .ranged:
            updateRangedStack(with: answers)
        
        }
    }

    func updateSingleStack (with answers: [Answer]) {
        singleStackView.isHidden = false
        guard singleButtons.count <= answers.count else {return}
        singleButtons.enumerated().forEach { $0.element.setTitle(answers[$0.offset].text, for: .normal) }
    }
    
    func updateMultipleStack (with answers: [Answer]) {
        multiplyStackView.isHidden = false
        guard multyLabels.count <= answers.count else {return}
        multyLabels.enumerated().forEach { $0.element.text = answers[$0.offset].text}
    }
    
    func updateRangedStack (with answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinetionVC: ResultVC = segue.destination as! ResultVC
        destinetionVC.answers = answersChosen
        
    }
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let answers = questions[questionIndex].answers
        guard let index = singleButtons.index(of: sender) else {return}
        let answer = answers[index]
        
        answersChosen.append(answer)
        print(#function, answer)
        print()
        nextQuestion()
    }
    
    
    @IBAction func multipleButtonPressed(_ sender: UIButton) {
        let answers = questions[questionIndex].answers
        multySwitches.enumerated().forEach { if $0.element.isOn {
            let answer = answers[$0.offset]
            answersChosen.append(answer)
            print(#function, answer)
            }
            
        }
        print()
        nextQuestion()
    }
    
    
    @IBAction func rangedButtonPressed(_ sender: UIButton) {
        let answers = questions[questionIndex].answers
        
        let index = Int(round(rengedSlider.value * Float(answers.count - 1)))
        let answer = answers[index]
        answersChosen.append(answer)
        print(answer)
        nextQuestion()
    }
    
    func nextQuestion() {
        
        if questionIndex < questions.count - 1{
            questionIndex += 1
            updateUI()
        } else {
           performSegue(withIdentifier: "toResult", sender: nil)
        }
        updateUI()
    }
    
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        
    }
}
