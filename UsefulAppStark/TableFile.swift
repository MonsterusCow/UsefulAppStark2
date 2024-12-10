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
    var index = 0
    
    func configure(word: String, def: String, image: String, num: Int){
        wordLabel.text = word
        defLabel.text = "definition: \(def)"
        starImage.image = UIImage(systemName: image)
        index = num
    }
    
    @IBAction func star(_ sender: Any) {
        if starImage.image == UIImage(systemName: "star"){
            starImage.image = UIImage(systemName: "star.fill")
            Info.flashCardArray[index].stared = true
        } else {
            starImage.image = UIImage(systemName: "star")
            Info.flashCardArray[index].stared = false
        }
        if let something = try? Info.encoder.encode(Info.flashCardArray){
            Info.defaults.set(something, forKey: "cards")
        }
    }
    
    
}
