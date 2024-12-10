//
//  ConfigViewController.swift
//  UsefulAppStark
//
//  Created by RYAN STARK on 11/11/24.
//

import UIKit

class ConfigViewController: UIViewController {
    
    @IBOutlet weak var selectQuizLabel: UILabel!
    @IBOutlet weak var normalQuizLabel: UILabel!
    @IBOutlet weak var normalBackground: UIButton!
    @IBOutlet weak var endlessQuizLabel: UILabel!
    @IBOutlet weak var endlessBackground: UIButton!
    @IBOutlet weak var staredQuizLabel: UILabel!
    @IBOutlet weak var staredBackground: UIButton!
    @IBOutlet weak var wordQuizLabel: UILabel!
    @IBOutlet weak var workBackground: UIButton!
    @IBOutlet weak var defQuizLabel: UILabel!
    @IBOutlet weak var defBackground: UIButton!
    var choice = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        staredBackground.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        normalBackground.tintColor = UIColor(red: 117/255, green: 114/255, blue: 106/255, alpha: 1)
        normalQuizLabel.backgroundColor = UIColor(red: 117/255, green: 114/255, blue: 106/255, alpha: 1)
        endlessBackground.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        workBackground.tintColor = UIColor(red: 117/255, green: 114/255, blue: 106/255, alpha: 1)
        wordQuizLabel.backgroundColor = UIColor(red: 117/255, green: 114/255, blue: 106/255, alpha: 1)
        defBackground.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (Info.flashCardArray.count < 4){
            notEnoughCardsError(alertMessage: "Create 4 flashcards first to take a quiz", alertTitle: "Create Some Flashcards")
        } else {
            Info.prevTabBar = 4
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func normalQuizSet(_ sender: Any) {
        Settings.quizLength = "normal"
        Settings.resett = true
        normalBackground.tintColor = UIColor(red: 117/255, green: 114/255, blue: 106/255, alpha: 1)
        normalQuizLabel.backgroundColor = UIColor(red: 117/255, green: 114/255, blue: 106/255, alpha: 1)
        endlessBackground.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        endlessQuizLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func endlessQuizSet(_ sender: Any) {
        Settings.quizLength = "endless"
        Settings.resett = true
        endlessBackground.tintColor = UIColor(red: 117/255, green: 114/255, blue: 106/255, alpha: 1)
        endlessQuizLabel.backgroundColor = UIColor(red: 117/255, green: 114/255, blue: 106/255, alpha: 1)
        normalBackground.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        normalQuizLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func staredQuizSet(_ sender: Any) {
        var checkArray = [Bool]()
        for i in 0..<Info.flashCardArray.count{
            if Info.flashCardArray[i].stared {
                checkArray.append(Info.flashCardArray[i].stared)
            }
        }
        if checkArray.count > 3 {
            Settings.resett = true
            if Settings.quizType == "normal"{
                Settings.quizType = "stared"
                staredQuizLabel.backgroundColor = UIColor(red: 117/255, green: 114/255, blue: 106/255, alpha: 1)
                staredBackground.tintColor = UIColor(red: 117/255, green: 114/255, blue: 106/255, alpha: 1)
            } else {
                Settings.quizType = "normal"
                staredQuizLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                staredBackground.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            }
        } else {
            notEnoughCardsError(alertMessage: "There are not enough starred cards to do a starred quiz", alertTitle: "Not enough starred")
        }
    }
    
    @IBAction func goQuiz(_ sender: Any) {
        performSegue(withIdentifier: "goQuiz", sender: nil)
    }
    
    
    @IBAction func quizWord(_ sender: Any) {
//        let alert = UIAlertController(title: "Test word?", message: "Would you like quiz using the word and answer with the definition?", preferredStyle: UIAlertController.Style.alert)
//        let noAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
//        let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default){ (action) in
        Settings.resett = true
            Settings.wordd = true
            Settings.deff = false
            self.workBackground.tintColor = UIColor(red: 117/255, green: 114/255, blue: 106/255, alpha: 1)
            self.wordQuizLabel.backgroundColor = UIColor(red: 117/255, green: 114/255, blue: 106/255, alpha: 1)
            self.defBackground.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            self.defQuizLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//        }
//        alert.addAction(yesAction)
//        alert.addAction(noAction)
//        self.present(alert, animated: true)
    }
    
    @IBAction func quizDef(_ sender: Any) {
//        let alert = UIAlertController(title: "Test definition?", message: "Would you like quiz using the definition and answer with the word?", preferredStyle: UIAlertController.Style.alert)
//        let noAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
//        let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default){ (action) in
            Settings.wordd = false
            Settings.deff = true
            Settings.resett = true
            self.defBackground.tintColor = UIColor(red: 117/255, green: 114/255, blue: 106/255, alpha: 1)
            self.defQuizLabel.backgroundColor = UIColor(red: 117/255, green: 114/255, blue: 106/255, alpha: 1)
            self.workBackground.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            self.wordQuizLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//        }
//        alert.addAction(yesAction)
//        alert.addAction(noAction)
//        self.present(alert, animated: true)
    }
    
    
    
    func createAlert(alertMessage: String, alertTitle: String){
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        let noAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default){ (action) in
        }
        let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default){ (action) in
        }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true)
        
    }
    func notEnoughCardsError(alertMessage: String, alertTitle: String)
    {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){ (action) in
            self.tabBarController?.selectedIndex = Info.prevTabBar
        }
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}
