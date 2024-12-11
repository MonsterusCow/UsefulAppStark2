//
//  StudyViewController.swift
//  UsefulAppStark
//
//  Created by RYAN STARK on 10/30/24.
//

import UIKit

class StudyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewThing: UITableView!
    @IBOutlet weak var switchThing: UISwitch!
    
    var indexs = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewThing.delegate = self
        tableViewThing.dataSource = self
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.hidesBackButton = true
        if (Info.flashCardArray.count == 0)
        {
            notEnoughCardsError(alertMessage: "Create a flashcard first to view your flashcards", alertTitle: "Create Some Flashcards")
        } else {
            Info.prevTabBar = 3
            getStared()
            tableViewThing.reloadData()
        }
    }
    
    @IBAction func switchAction(_ sender: Any) {
        getStared()
        tableViewThing.reloadData()
    }
    
    @IBAction func starButton(_ sender: Any) {
//        _ = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: false) { timer in
//            self.getStared()
//            self.tableViewThing.reloadData()
//        }
        
    }

    func howManyStared() -> Int{
        for i in 0..<Info.flashCardArray.count {
            if Info.flashCardArray[i].stared{
                indexs.append(i)
            }
        }
        return indexs.count
    }
    
    func getStared(){
        indexs = []
        for i in 0..<Info.flashCardArray.count {
            if Info.flashCardArray[i].stared{
                indexs.append(i)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if switchThing.isOn{
            return Info.flashCardArray.count
        } else {
            var count = 0
            for i in 0..<Info.flashCardArray.count {
                if Info.flashCardArray[i].stared{
                    count+=1
                }
            }
            return count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if switchThing.isOn{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellBeHere") as! CellStuff
            var string = ""
            if Info.flashCardArray[indexPath.row].stared{
                string = "star.fill"
            } else {
                string = "star"
            }
            cell.configure(word: Info.flashCardArray[indexPath.row].word, def: Info.flashCardArray[indexPath.row].def, image: string, num: indexPath.row)
            return cell
        } else {
            getStared()
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellBeHere") as! CellStuff
            cell.configure(word: Info.flashCardArray[indexs[indexPath.row]].word, def: Info.flashCardArray[indexs[indexPath.row]].def, image: "star.fill", num: indexPath.row)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Info.flashCardArray.remove(at: indexPath.row)
            tableViewThing.deleteRows(at: [indexPath], with: .fade)
            if Info.flashCardArray.count == 0 {
                Info.prevTabBar = 0
                notEnoughCardsError(alertMessage: "There are no more flashcards", alertTitle: "None left")
            }
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
