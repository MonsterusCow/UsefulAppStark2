//
//  QuizEndViewController.swift
//  UsefulAppStark
//
//  Created by MATTHEW FITCH on 11/26/24.
//

import UIKit

class QuizEndViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var correctTableView: UITableView!
    
    @IBOutlet weak var wrongTableView: UITableView!
    
    @IBOutlet weak var percentageText: UILabel!
    
    @IBOutlet weak var correctText: UILabel!
    
    @IBOutlet weak var wrongText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        correctTableView.delegate = self
        correctTableView.dataSource = self
        wrongTableView.delegate = self
        wrongTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var percentage: Double = Double(Point.correct.count) / Double(Point.correct.count + Point.wrong.count)
        
        percentage *= 100
        
        percentage = floor(percentage)
        
        percentageText.text = "You got \(percentage)% questions correct"
        
        wrongTableView.reloadData()
        correctTableView.reloadData()
        
        correctText.text = "Correct: \(Point.correct.count)"
        wrongText.text = "Wrong: \(Point.wrong.count)"
    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
