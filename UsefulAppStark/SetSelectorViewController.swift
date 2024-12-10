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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
