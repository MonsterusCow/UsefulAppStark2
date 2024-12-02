//
//  QuizEndViewController.swift
//  UsefulAppStark
//
//  Created by MATTHEW FITCH on 11/26/24.
//

import UIKit

class QuizEndViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == correctTableView ? Point.correct.count : Point.wrong.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == correctTableView
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellBeHere") as! CellStuff
            var string = ""
            if Point.correct[indexPath.row].stared{
                string = "star.fill"
            } else {
                string = "star"
            }
            cell.configure(word: Point.correct[indexPath.row].word, def: Point.correct[indexPath.row].def, image: string, num: indexPath.row)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellBeHere") as! CellStuff
            var string = ""
            if Point.wrong[indexPath.row].stared{
                string = "star.fill"
            } else {
                string = "star"
            }
            cell.configure(word: Point.wrong[indexPath.row].word, def: Point.wrong[indexPath.row].def, image: string, num: indexPath.row)
            return cell
        }
    }
    

    @IBOutlet weak var correctTableView: UITableView!
    
    @IBOutlet weak var wrongTableView: UITableView!
    
    @IBOutlet weak var percentageText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var percentage: Double = Double(Point.correct.count) / Double(Point.correct.count + Point.wrong.count)
        
        percentage *= 100
        
        percentage = floor(percentage)
        
        percentageText.text = "You got \(percentage)% questions correct"
        // Do any additional setup after loading the view.
        
        correctTableView.delegate = self
        correctTableView.dataSource = self
        wrongTableView.delegate = self
        wrongTableView.dataSource = self
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
