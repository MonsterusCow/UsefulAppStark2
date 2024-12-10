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
    
    @IBOutlet weak var createdCards: UITextView!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var createdBackground: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordTextView.delegate = self
        defTextView.delegate = self
        createdCards.layer.cornerRadius = 20
        self.navigationItem.setHidesBackButton(true, animated: true)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Info.prevTabBar = 1
        createdLabel.isHidden = true
        createdBackground.isHidden = true
        var fullText = "Created Flashcards:\n\n"
                
        for flashcard in Info.flashCardArray {
            fullText += flashcard.word + "\n"
        }

        let attributedString = NSMutableAttributedString(string: fullText)
        
        let defaultFont = UIFont.systemFont(ofSize: 24)
        attributedString.addAttribute(.font, value: defaultFont, range: NSRange(location: 0, length: fullText.count))

        let boldRange = (fullText as NSString).range(of: "Created Flashcards:")

        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 24), range: boldRange)

        createdCards.attributedText = attributedString

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
             if let something = try? Info.encoder.encode(Info.flashcardSets)
             {
                 Info.defaults.set(something, forKey: "allSets")
             }
          }
         
         var fullText = "Created Flashcards:\n\n"
                 
         for flashcard in Info.flashCardArray {
             fullText += flashcard.word + "\n"
         }

         let attributedString = NSMutableAttributedString(string: fullText)
         
         let defaultFont = UIFont.systemFont(ofSize: 24)
         attributedString.addAttribute(.font, value: defaultFont, range: NSRange(location: 0, length: fullText.count))

         let boldRange = (fullText as NSString).range(of: "Created Flashcards:")

         attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 24), range: boldRange)

         createdCards.attributedText = attributedString
         instantGratification()
     }
    
    func nuhUH(alertText: String){
        let alert = UIAlertController(title: "Error", message: alertText, preferredStyle: UIAlertController.Style.alert)
                let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                
                alert.addAction(alertAction)
                self.present(alert, animated: true)
    }

//     
//     func createAgain(){
//        let alert = UIAlertController(title: "Create Again?", message: "Would you like to create another flashcard?", preferredStyle: UIAlertController.Style.alert)
//         let noAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default){ (action) in
//            self.navigationController?.popViewController(animated: true)
//        }
//        let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default){ (action) in
//            self.wordTextView.text = ""
//            self.defTextView.text = ""
//        }
//                
//         alert.addAction(yesAction)
//         alert.addAction(noAction)
//                self.present(alert, animated: true)
//    }
    
    func instantGratification(){
        self.wordTextView.text = ""
        self.defTextView.text = ""
        defTextView.resignFirstResponder()
        wordTextView.resignFirstResponder()
        createdLabel.isHidden = false
        createdBackground.isHidden = false
        _ = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            self.createdLabel.isHidden = true
            self.createdBackground.isHidden = true
            }

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
