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
    static var prevTabBar = 0
}

class Error {
    
}

import UIKit

class MenuViewController: UIViewController {

    var defaults = UserDefaults.standard
    var encoder = JSONEncoder()
    var decoder = JSONDecoder()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //enable for one run to clear saved cards
//        defaults.set(nil, forKey: "cards")
        
        //disable for auto flashcards to be removed:
//        Info.flashCardArray = [Flashcard(word: "Word 1", def: "Definition 1", stared: true), Flashcard(word: "Word 2", def: "Definition 2", stared: false), Flashcard(word: "Word 3", def: "Definition 3", stared: true), Flashcard(word: "Word 4", def: "Definition 4", stared: false), Flashcard(word: "Word 5", def: "Definition 5", stared: false), Flashcard(word: "Word 6", def: "Definition 6", stared: false)]
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        if let cardstuff = defaults.data(forKey: "cards"){
            if let decoded = try? decoder.decode([Flashcard].self, from: cardstuff){
                Info.flashCardArray = decoded
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Info.prevTabBar = 0
    }
    

    @IBAction func saveCardsAction(_ sender: Any) {
        if let something = try? encoder.encode(Info.flashCardArray){
            defaults.set(something, forKey: "cards")
        }
        saved()
    }
    
    func saved(){
       let alert = UIAlertController(title: "Cards saved", message: "Your flashcards have been saved", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okAction)
        self.present(alert, animated: true)
   }
}
