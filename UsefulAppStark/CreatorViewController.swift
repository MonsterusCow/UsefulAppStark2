//
//  CreatorViewController.swift
//  UsefulAppStark
//
//  Created by RYAN STARK on 10/29/24.
//

import UIKit

class CreatorViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var wordTextView: UITextView!
    @IBOutlet weak var defTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordTextView.delegate = self
        defTextView.delegate = self
        self.navigationItem.setHidesBackButton(true, animated: true)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func finishButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
     @IBAction func createButton(_ sender: Any) {
         if wordTextView.text.replacingOccurrences(of: " ", with: "") == "" {
             nuhUH(alertText: "There is no word yet")
         } else if defTextView.text.replacingOccurrences(of: " ", with: "") == "" {
             nuhUH(alertText: "There is no definition yet")
         } else {
             Info.flashCardArray.append(Flashcard(word: wordTextView.text, def: defTextView.text, stared: false))
          }
         createAgain()
     }
    
    func nuhUH(alertText: String){
        let alert = UIAlertController(title: "Error", message: alertText, preferredStyle: UIAlertController.Style.alert)
                let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                
                alert.addAction(alertAction)
                self.present(alert, animated: true)
    }

     
     func createAgain(){
        let alert = UIAlertController(title: "Create Again?", message: "Would you like to create another flashcard?", preferredStyle: UIAlertController.Style.alert)
         let noAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default){ (action) in
            self.navigationController?.popViewController(animated: true)
        }
        let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default){ (action) in
            self.wordTextView.text = ""
            self.defTextView.text = ""
        }
                
         alert.addAction(yesAction)
         alert.addAction(noAction)
                self.present(alert, animated: true)
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        wordTextView.resignFirstResponder()
        defTextView.resignFirstResponder()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            if(text == "\n") {
                textView.resignFirstResponder()
                return false
            }
            return true
        }
    

}
