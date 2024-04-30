//
//  Tests.swift
//  HabitTracker
//
//  Created by Sol Morelli on 25/04/2024.
//

import Foundation

#if DEBUG
class HabitFactory {
    static let verbs = [
    "Make",
    "Invent",
    "Pet",
    "Shower",
    "Treat yourself to",
    "Buy",
    "Smile to",
    "Jump",
    "Find"
    ]
    
    static let nouns = [
    " a sandwich",
    " the dream machine",
    " a cat",
    " your own self",
    " a foot massage",
    " a zillion things",
    " a human being",
    " the shark",
    " a dog"
    ]
    
    static let details = [
    " for yourself",
    " 'cause I know you can",
    " so you'll be happy",
    " for once",
    ", you only live once",
    " that won't help",
    ", you won't be found out",
    ", you might as well",
    " and call it a good boy"
    ]
    
    static let verbos = [
    "Agarrar",
    "Inventar",
    "Acariciar",
    "Lavar",
    "Imaginar",
    "Comprar",
    "Molestar",
    "Saltar",
    "Encontrar"
    ]
    
    static let sustantivos = [
    " un chebusan",
    " un temardo",
    " un gatito",
    " a tus enemigos",
    " una realidad paralela",
    " unos papines",
    " a un desconocido",
    " un tiburon",
    "te"
    ]
    
    static let detalles = [
    " para vos",
    " porque si",
    " para ser feliz",
    " de una vez",
    ", solo se vive una vez",
    " con orgullo",
    ", nadie se va a enterar",
    ". Por que no?",
    " y dar las gracias"
    ]
    
    static func createHistory() -> [Int : [Int : Set<Int>]] {
        var history = [Int : [Int : Set<Int>]]()
        
        for year in 2019..<2030 {
            var months = [Int: Set<Int>]()
            
            for month in 1..<13 {
                var days = Set<Int>()
                
                for day in 1..<32 {
                    let insert = Bool.random()
                    if insert {
                        days.insert(day)
                    }
                }
                
                months[month] = days
            }
            
            history[year] = months
        }
        
        return history
    }
    
    static func createName() -> String {
        verbs.randomElement()! + nouns.randomElement()! + details.randomElement()!
    }
    
    static func crearNombre() -> String {
        verbos.randomElement()! + sustantivos.randomElement()! + detalles.randomElement()!
    }
    
    static func createHabit() -> Habit {
        Habit(createName(), color: Int.random(in: 0...7), calendar: createHistory())
    }
    
    static func crearHabito() -> Habit {
        Habit(crearNombre(), color: Int.random(in: 0...7), calendar: createHistory())
    }
}
#endif
