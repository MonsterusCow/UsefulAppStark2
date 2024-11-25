//
//  ViewController.swift
//  UsefulAppStark
//
//  Created by RYAN STARK on 10/28/24.
//



import UIKit

class ViewController: UIViewController {
    
    

    
    
    
    
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
    
    
}

