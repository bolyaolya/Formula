//
//  RaceLocalization.swift
//  Formula 1
//
//  Created by Olya Boyko on 16.07.2024.
//

import Foundation

class RaceLocalization {
    static func localizedRaceName(for englishName: String) -> String {
        switch englishName {
        case "Bahrain Grand Prix":
            return "Гран При Бахрейна"
        case "Saudi Arabian Grand Prix":
            return "Гран При Саудовской Аравии"
        case "Australian Grand Prix":
            return "Гран При Австралии"
        case "Japanese Grand Prix":
            return "Гран При Японии"
        case "Chinese Grand Prix":
            return "Гран При Китая"
        case "Miami Grand Prix":
            return "Гран При Майами"
        case "Emilia Romagna Grand Prix":
            return "Гран При Эмилия-Романьи"
        case "Monaco Grand Prix":
            return "Гран При Монако"
        case "Canadian Grand Prix":
            return "Гран При Канады"
        case "Spanish Grand Prix":
            return "Гран При Испании"
        case "Austrian Grand Prix":
            return "Гран При Австрии"
        case "British Grand Prix":
            return "Гран При Великобритании"
        case "Hungarian Grand Prix":
            return "Гран При Венгрии"
        case "Belgian Grand Prix":
            return "Гран При Бельгии"
        case "Dutch Grand Prix":
            return "Гран При Нидерландов"
        case "Italian Grand Prix":
            return "Гран При Италии"
        case "Azerbaijan Grand Prix":
            return "Гран При Азербайджана"
        case "Singapore Grand Prix":
            return "Гран При Сингапура"
        case "United States Grand Prix":
            return "Гран При Соединенных Штатов"
        case "Mexico City Grand Prix":
            return "Гран При Мехико"
        case "São Paulo Grand Prix":
            return "Гран При Сан-Пауло"
        case "Las Vegas Grand Prix":
            return "Гран При Лас-Вегаса"
        case "Qatar Grand Prix":
            return "Гран При Катара"
        case "Abu Dhabi Grand Prix":
            return "Гран При Абу-Даби"
        default:
            return englishName
        }
    }
}
