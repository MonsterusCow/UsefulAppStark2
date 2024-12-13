//
//  SetCell.swift
//  UsefulAppStark
//
//  Created by MATTHEW FITCH on 12/13/24.
//

import Foundation

import UIKit

class SetCell: UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    
    func configure(name: String, count: String)
    {
        nameLabel.text = name
        
        countLabel.text = count
    }
}
