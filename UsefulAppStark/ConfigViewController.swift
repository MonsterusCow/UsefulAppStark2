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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func normalQuizSet(_ sender: Any) {
        Settings.quizLength = "normal"
        normalBackground.backgroundColor = UIColor(red: 117, green: 114, blue: 106, alpha: 1)
        normalQuizLabel.backgroundColor = UIColor(red: 117, green: 114, blue: 106, alpha: 1)
        endlessBackground.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        endlessQuizLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func endlessQuizSet(_ sender: Any) {
        Settings.quizLength = "endless"
        endlessBackground.backgroundColor = UIColor(red: 117, green: 114, blue: 106, alpha: 1)
        endlessQuizLabel.backgroundColor = UIColor(red: 117, green: 114, blue: 106, alpha: 1)
        normalBackground.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        normalQuizLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func staredQuizSet(_ sender: Any) {
        if Settings.quizType == "normal"{
            Settings.quizType = "stared"
            staredQuizLabel.backgroundColor = UIColor(red: 117/255, green: 114/255, blue: 106/255, alpha: 1)
            staredBackground.tintColor = UIColor(red: 117/255, green: 114/255, blue: 106/255, alpha: 1)
        } else {
            Settings.quizType = "normal"
            staredQuizLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            staredBackground.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    @IBAction func goQuiz(_ sender: Any) {
        performSegue(withIdentifier: "goQuiz", sender: nil)
    }
    
    
    @IBAction func quizWord(_ sender: Any) {
        let alert = UIAlertController(title: "Test word?", message: "Would you like quiz using the word and answer with the definition?", preferredStyle: UIAlertController.Style.alert)
        let noAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
        let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default){ (action) in
            Settings.wordd = true
            Settings.deff = false
        }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true)
    }
    
    @IBAction func quizDef(_ sender: Any) {
        let alert = UIAlertController(title: "Test definition?", message: "Would you like quiz using the definition and answer with the word?", preferredStyle: UIAlertController.Style.alert)
        let noAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
        let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default){ (action) in
            Settings.wordd = false
            Settings.deff = true
        }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true)
    }
    
    @IBAction func reset(_ sender: Any) {
        let alert = UIAlertController(title: "Reset?", message: "Would you like to reset the quiz?", preferredStyle: UIAlertController.Style.alert)
        let noAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
        let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default){ (action) in
            Settings.resett = true
        }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true)
    }
    
    func createAlert(alertName: String, alertTitle: String){
        let alert = UIAlertController(title: alertTitle, message: alertName, preferredStyle: UIAlertController.Style.alert)
        let noAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default){ (action) in
        }
        let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default){ (action) in
            Settings.resett = true
            self.selectQuizLabel.text = "Select quiz type\nCurrent: \(self.choice)"
            Settings.quizType = self.choice.lowercased()
        }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true)
        
    }
}
