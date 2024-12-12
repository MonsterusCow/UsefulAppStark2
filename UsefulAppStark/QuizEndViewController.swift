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
        
    }
    
    @IBAction func quizAgain(_ sender: Any) {
        Point.correct = []
        Point.wrong = []
        Point.number = 0
        Settings.resett = true
        self.navigationController?.popViewController(animated: false)
  
    }
    
    @IBAction func goToMenu(_ sender: Any) {
        Point.correct = []
        Point.wrong = []
        Point.number = 0
        Settings.resett = true
        Settings.isPopping = true
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == correctTableView ? Point.correct.count : Point.wrong.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellBeHere") as! CellStuff
            var string = ""
            if Point.correct[indexPath.row].stared{
                string = "star.fill"
            } else {
                string = "star"
            }
            var correct = 0
            for i in 0..<Point.correct.count{
                if Info.flashCardArray[indexPath.row] == Point.correct[i]{
                    correct += 1
                    Point.correct.remove(at: i)
                    i -= 1
                }
            }
            var wrong = 0
            for i in 0..<Point.wrong.count{
                if Info.flashCardArray[indexPath].row == Point.wrong[i]{
                    wrong += 1
                    Point.wrong.remove(at: i)
                    i -= 1
                }
            }
            cell.configure(word: Info.flashCardArray[indexPath.row].word, def: Info.flashCardArray[indexPath.row].def, image: string, num: indexPath.row, correct: correct, wrong: wrong)
            return cell
    }

}
