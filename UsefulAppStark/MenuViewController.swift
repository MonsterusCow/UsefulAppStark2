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
    static var flashCardArray: [Flashcard]!
    static var flashcardSets: [FlashcardSet]!
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

    @IBOutlet weak var flashcardTitle: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flashcardTitle.text = Info.curFlashcardSet.name
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.hidesBackButton = true
        Info.prevTabBar = 0
        
    }
    

   
    @IBAction func setSelectAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
}
