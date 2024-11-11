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
    
    func configure(word: String, def: String){
        wordLabel.text = word
        defLabel.text = "definition: \(def)"
        
        
    }
    
    
    
}
