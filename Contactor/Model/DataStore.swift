//
//  DataStore.swift
//  Contactor
//
//  Created by Max Kiselyov on 10/26/23.
//

import Foundation

final class DataStore {

    static let shared = DataStore().getData()
    var isShuffled = false
    
    private var data: [Person] = []
    private var names = ["Harry", "Mason", "Jonatta", "Marcelo", "Loreta", "Sarah", "Johny", "George", "Vladimir", "Innokentiy"]
    private var lastNames = ["Potter", "Marrow", "Traves", "Fangus", "Pyneccile", "Connor", "Rappid", "Gregory", "Zhirinovskiy", "Sheremet"]
    private var emails = ["ololo@me.com", "777@azino.ru", "original-do-brazil@lemonfit.pt", "kiticat@lemonfit.pt", "teacher@swiftbook.il", "proizvodstvo_trub@yandex.ru", "android-haiter@icloud.com", "stefanya_shalava@hogwarts.co.uk", "george@theking.pt", "news@fre.es"]
    private var phones = ["+49 176 69 500800", "+351 912127466", "+351 543231311", "+7 912 255 7 255", "+351 9128213722", "+7 343 3543707", "+351 913983223", "0 6732 8882 4", "02", "8 800 3533539"]
    
    private func shuffleArrays() {
        names.shuffle()
        lastNames.shuffle()
        emails.shuffle()
        phones.shuffle()
    }
    
    private func getMinElements(_ arrays: Array<Any>...) -> Int {
        var min = 1000
        for array in arrays {
            if array.count <= min {
                min = array.count
            }
        }
        return min
    }
    
    func getData() -> [Person] {
        if !isShuffled {
            shuffleArrays()
            isShuffled = !isShuffled
        }
        let minElements = getMinElements(names, lastNames, emails, phones)
        for counter in 0..<minElements {
            data.append(Person(
                name: names[counter],
                lastName: lastNames[counter],
                phone: phones[counter],
                email: emails[counter]
            ))
        }
        return data
    }
}
