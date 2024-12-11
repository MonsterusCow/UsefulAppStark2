//
//  SetSelectorViewController.swift
//  UsefulAppStark
//
//  Created by MATTHEW FITCH on 12/10/24.
//

import UIKit

class SetSelectorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var defaults = UserDefaults.standard
    
    var decoder = JSONDecoder()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        if let curSaves = defaults.data(forKey: "allSets") {
            if let decoded = try? decoder.decode([FlashcardSet].self, from: curSaves) {
                if (decoded.count == 0)
                {
                    return
                }
                Info.flashcardSets = decoded
                tableView.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Info.flashcardSets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        cell.textLabel!.text = Info.flashcardSets[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Info.curFlashcardSet = Info.flashcardSets[indexPath.row]
        Info.flashCardArray = Info.curFlashcardSet.flashcards
        
        performSegue(withIdentifier: "woahhhGoTabz", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Info.flashcardSets.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if let something = try? Info.encoder.encode(Info.flashcardSets)
            {
                Info.defaults.set(something, forKey: "allSets")
            }
        }
    }
    
    func alertYayy()
    {
        let alert = UIAlertController(
            title: "Enter set name",
            message: "Please enter the name for your flashcard set",
            preferredStyle: .alert
        )
        
        alert.addTextField(configurationHandler: { field in
            field.placeholder = "Set name"
            field.returnKeyType = .continue
            field.keyboardType = .default
        })
        
        alert.addAction(UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        ))
                        
        alert.addAction(UIAlertAction(
            title: "Ok",
            style: .default,
            handler: { _ in
                guard let fields = alert.textFields, fields.count == 1 else {
                    return
                }
                
                Info.flashcardSets.append(FlashcardSet(name: fields[0].text ?? "", flashcards: [Flashcard]()))
                self.tableView.reloadData()
            }
        ))
        
        present(alert, animated: true)
    }
    
    @IBAction func createSetAction(_ sender: Any) {
        alertYayy()
    }
}
