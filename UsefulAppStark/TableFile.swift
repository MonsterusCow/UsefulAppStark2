//
//  TableFile.swift
//  StarkClassmates
//
//  Created by RYAN STARK on 10/9/24.
//

import Foundation
import UIKit

class CellStuff: UITableViewCell{
    
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var defLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var correctText: UILabel!
    @IBOutlet weak var wrongText: UILabel!
    var index = 0
    
    func configure(word: String, def: String, image: String, num: Int){
        wordLabel.text = word
        defLabel.text = "Def: \(def)"
        starImage.image = UIImage(systemName: image)
        index = num
    }
    
    func configureEnd(word: String, def: String, image: String, num: Int, correct: Int, wrong: Int){
        wordLabel.text = word
        defLabel.text = "Def: \(def)"
        starImage.image = UIImage(systemName: image)
        index = num
        correctText.text = "Correct: \(correct)"
        wrongText.text = "Wrong: \(wrong)"
    }
    
    @IBAction func star(_ sender: Any) {
//        if index > -1 {
            if starImage.image == UIImage(systemName: "star"){
                starImage.image = UIImage(systemName: "star.fill")
                Info.flashCardArray[index].stared = true
            } else {
                starImage.image = UIImage(systemName: "star")
                Info.flashCardArray[index].stared = false
            }
            Info.curFlashcardSet.flashcards = Info.flashCardArray
            if let something = try? Info.encoder.encode(Info.flashcardSets){
                Info.defaults.set(something, forKey: "allSets")
            }
            Settings.wasStarsChanged = true
//        } else {
//            if starImage.image == UIImage(systemName: "star"){
//                starImage.image = UIImage(systemName: "star.fill")
//            } else {
//                starImage.image = UIImage(systemName: "star")
//            }
//            Settings.wasStarsChanged = true
//        }
    }
    
    
}
