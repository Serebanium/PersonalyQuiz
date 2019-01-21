//
//  QuestionData.swift
//  PersonalyQuiz
//
//  Created by Сергей Иванов on 21/01/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import Foundation


struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: ModaType
}

enum ModaType: Character {
    case lapot = "Л", ked = "К", botinok = "Б", crosovok = "С"
    
    var definition: String {
        switch  self {
        case .lapot:
            return "Вы совсем не модный человек! Странно, что вы не носите лапти. Вам срочно нужна помощь стилиста!"
        case .ked:
            return "Вы не достаточно разбираетесь в моде. Валенки на свадьбу вы не надеваете, но вам не помешают подсказки стилиста."
        case .botinok:
            return "Вы неплохо разбираетесь в моде и у вас есть свой стиль. Рекомендуем пообщаться с нашими стилистами для расширения вашего гардероба."
        case .crosovok:
            return "В погоне за модой вы теряете свой стиль, обратитесь к нашим стилистам и они подскажут вам как тратить меньше и выглядеть лучше."
        }
    }
}
