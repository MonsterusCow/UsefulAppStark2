//
//  MenuViewController.swift
//  UsefulAppStark
//
//  Created by RYAN STARK on 11/22/24.
//
class Flashcard: Codable {

    var word: String
    var def: String
    var stared: Bool
    
    init(word: String, def: String, stared: Bool) {
        self.word = word
        self.def = def
        self.stared = stared
    }
}

class Info {
    static var flashCardArray = [Flashcard]()
    static var flashcardSets = [FlashcardSet]()
    static var curFlashcardSet: FlashcardSet!
    static var prevTabBar = 0
    static var defaults = UserDefaults.standard
    static var encoder = JSONEncoder()
    static var decoder = JSONDecoder()
}

class Error {
    
}

import UIKit

class MenuViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //enable for one run to clear saved cards
//        defaults.set(nil, forKey: "cards")
        
        //disable for auto flashcards to be removed:
        Info.flashCardArray = [Flashcard(word: "Word 1", def: "Definition 1", stared: true), Flashcard(word: "Word 2", def: "Definition 2", stared: false), Flashcard(word: "Word 3", def: "Definition 3", stared: true), Flashcard(word: "Word 4", def: "Definition 4", stared: false), Flashcard(word: "Word 5", def: "Definition 5", stared: false), Flashcard(word: "Word 6", def: "Definition 6", stared: false)]
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Info.prevTabBar = 0
    }
    

   
    @IBAction func setSelectAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
}
