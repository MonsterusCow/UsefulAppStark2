//
//  ViewController.swift
//  UsefulAppStark
//
//  Created by RYAN STARK on 10/28/24.
//

class Flashcard: Codable{

    var word: String
    var def: String
    
    init(word: String, def: String) {
        self.word = word
        self.def = def
    }
    
}

class Info{
    static var flashCardArray = [Flashcard]()
}

import UIKit

class ViewController: UIViewController {
    
    var defaults = UserDefaults.standard
    var encoder = JSONEncoder()
    var decoder = JSONDecoder()

    override func viewDidLoad() {
        super.viewDidLoad()
        //enable for one run to clear saved cards
//        defaults.set(nil, forKey: "cards")
        self.navigationItem.setHidesBackButton(true, animated: true)
        if let cardstuff = defaults.data(forKey: "cards"){
            if let decoded = try? decoder.decode([Flashcard].self, from: cardstuff){
                Info.flashCardArray = decoded
            }
        }
        //disable for auto flashcards to be removed:
        /*Info.flashCardArray = [Flashcard(word: "Word 1", def: "Definition 1"), Flashcard(word: "Word 2", def: "Definition 2"), Flashcard(word: "Word 3", def: "Definition 3"), Flashcard(word: "Word 4", def: "Definition 4"), Flashcard(word: "Word 5", def: "Definition 5"), Flashcard(word: "Word 6", def: "Definition 6")]*/
    }

    @IBAction func saveCardsAction(_ sender: Any) {
        if let something = try? encoder.encode(Info.flashCardArray){
            defaults.set(something, forKey: "cards")
        }
        saved()
    }
    
    
    
    @IBAction func studyAction(_ sender: Any) {
        if Info.flashCardArray.count == 0 {
            nuhUH(alertText: "You havent made any flashcards yet")
        } else {
            performSegue(withIdentifier: "study", sender: nil)
        }
    }
    @IBAction func lookAction(_ sender: Any) {
        if Info.flashCardArray.count == 0 {
            nuhUH(alertText: "You havent made any flashcards yet")
        } else {
            performSegue(withIdentifier: "view", sender: nil)
        }
    }
    
    @IBAction func quizAction(_ sender: Any) {
        if Info.flashCardArray.count <= 3 {
            nuhUH(alertText: "You must have 4 or more flashcards to do a quiz")
        } else {
            performSegue(withIdentifier: "quiz", sender: nil)
        }
    }
    
    func nuhUH(alertText: String){
        let alert = UIAlertController(title: "Error", message: alertText, preferredStyle: UIAlertController.Style.alert)
                let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                
                alert.addAction(alertAction)
                self.present(alert, animated: true)
    }
    
    func saved(){
       let alert = UIAlertController(title: "Cards saved", message: "Your flashcards have been saved", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okAction)
        self.present(alert, animated: true)
   }
}

