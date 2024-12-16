//
//  EditViewController.swift
//  UsefulAppStark
//
//  Created by MATTHEW FITCH on 12/12/24.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var defTextView: UITextView!
    @IBOutlet weak var wordTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.hidesBackButton = true
        
        defTextView.text = StudyInfo.selectedFlashcard.def
        wordTextView.text = StudyInfo.selectedFlashcard.word
        // Do any additional setup after loading the view.
    }
    @IBAction func editAction(_ sender: Any) {
        StudyInfo.selectedFlashcard.def = defTextView.text
        StudyInfo.selectedFlashcard.word = wordTextView.text
        
        Info.curFlashcardSet.flashcards = Info.flashCardArray
        if let something = try? Info.encoder.encode(Info.flashcardSets)
        {
            Info.defaults.set(something, forKey: "allSets")
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
