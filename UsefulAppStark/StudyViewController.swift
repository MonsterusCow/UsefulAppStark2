//
//  StudyViewController.swift
//  UsefulAppStark
//
//  Created by RYAN STARK on 10/30/24.
//

import UIKit

class StudyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewThing: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewThing.delegate = self
        tableViewThing.dataSource = self
        self.navigationItem.setHidesBackButton(true, animated: true)


    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Info.flashCardArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellBeHere") as! CellStuff
        cell.configure(word: Info.flashCardArray[indexPath.row].word, def: Info.flashCardArray[indexPath.row].def)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Info.flashCardArray.remove(at: indexPath.row)
            tableViewThing.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

}
