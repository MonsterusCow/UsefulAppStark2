//
//  ActualStudyViewController.swift
//  UsefulAppStark
//
//  Created by RYAN STARK on 10/31/24.
//

import UIKit

class ActualStudyViewController: UIViewController {

    @IBOutlet weak var tablabel: UITabBarItem!
    
    @IBOutlet weak var noteCardImage: UIImageView!
    @IBOutlet weak var wordPart: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    var number = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (Info.flashCardArray.count == 0){
            notEnoughCardsError(alertMessage: "Create a flashcard first to study your flashcards", alertTitle: "Create Some Flashcards")
        } else {
            Info.prevTabBar = 2
            noteCardImage.image = UIImage(named: "notecard")
            wordPart.text = "\(Info.flashCardArray[number].word)"
            tablabel.badgeColor = .red
            if Info.flashCardArray[number].stared{
                starImage.image = UIImage(systemName: "star.fill")
            } else {
                starImage.image = UIImage(systemName: "star")
            }
        }
    }
    
    @IBAction func finishButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func backButton(_ sender: Any) {
        if number == 0 {
            number = Info.flashCardArray.count-1
        } else {
            number -= 1
        }
        noteCardImage.image = UIImage(named: "notecard")
        wordPart.text = "\(Info.flashCardArray[number].word)"
        if Info.flashCardArray[number].stared{
            starImage.image = UIImage(systemName: "star.fill")
        } else {
        starImage.image = UIImage(systemName: "star")
        }
    }
    @IBAction func forwardButton(_ sender: Any) {
        if number == Info.flashCardArray.count-1 {
            number = 0
        } else {
            number += 1
        }
        noteCardImage.image = UIImage(named: "notecard")
        wordPart.text = "\(Info.flashCardArray[number].word)"
        if Info.flashCardArray[number].stared{
            starImage.image = UIImage(systemName: "star.fill")
        } else {
        starImage.image = UIImage(systemName: "star")
        }
    }
    @IBAction func flipButton(_ sender: Any) {
        if noteCardImage.image == UIImage(named: "notecard"){
            noteCardImage.image = UIImage(named: "blank")
            wordPart.text = Info.flashCardArray[number].def
            
        } else {
            noteCardImage.image = UIImage(named: "notecard")
            wordPart.text = "\(Info.flashCardArray[number].word)"

        }
    }

    @IBAction func starButton(_ sender: Any) {
        if starImage.image == UIImage(systemName: "star.fill"){
            starImage.image = UIImage(systemName: "star")
            Info.flashCardArray[number].stared = false
        } else {
            starImage.image = UIImage(systemName: "star.fill")
            Info.flashCardArray[number].stared = true
        }
        if let something = try? Info.encoder.encode(Info.flashcardSets){
            Info.defaults.set(something, forKey: "allSets")
        }
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
