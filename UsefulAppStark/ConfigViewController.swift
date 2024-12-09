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
    
    @IBOutlet weak var endlessQuizLabel: UILabel!
    @IBOutlet weak var staredQuizLabel: UILabel!
    @IBOutlet weak var wordQuizLabel: UILabel!
    @IBOutlet weak var defQuizLabel: UILabel!
    var choice = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
