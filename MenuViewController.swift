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
        //enable for one run to clear saved sets
//        defaults.set(nil, forKey: "allSets")
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Info.prevTabBar = 0
    }
    

   
    @IBAction func setSelectAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
}
