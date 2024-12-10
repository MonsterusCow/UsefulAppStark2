//
//  FlashcardSet.swift
//  UsefulAppStark
//
//  Created by MATTHEW FITCH on 12/10/24.
//

import Foundation

class FlashcardSet: Codable
{
    var name: String
    var flashcards: [Flashcard]
    
    init(name: String, flashcards: [Flashcard]) {
        self.name = name
        self.flashcards = flashcards
    }
}
