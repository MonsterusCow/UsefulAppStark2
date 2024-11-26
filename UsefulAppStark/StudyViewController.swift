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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewThing.delegate = self
        tableViewThing.dataSource = self
        self.navigationItem.setHidesBackButton(true, animated: true)
        tableViewThing.reloadData()

    }
    
    
    @IBAction func switchAction(_ sender: Any) {
        print(switchThing.isOn)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func howManyStared() -> Int{
        var indexs = [Int]()
        for i in 0..<Info.flashCardArray.count {
            if Info.flashCardArray[i].stared{
                indexs.append(i)
            }
        }
        return indexs.count
    }
    
    func getStared() -> Array<Int>{
        var indexs = [Int]()
        for i in 0..<Info.flashCardArray.count {
            if Info.flashCardArray[i].stared{
                indexs.append(i)
            }
        }
        return indexs
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
//        if switchThing.isOn{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellBeHere") as! CellStuff
            cell.configure(word: Info.flashCardArray[indexPath.row].word, def: Info.flashCardArray[indexPath.row].def)
            return cell
//        } else {
//            
//        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Info.flashCardArray.remove(at: indexPath.row)
            tableViewThing.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

}
