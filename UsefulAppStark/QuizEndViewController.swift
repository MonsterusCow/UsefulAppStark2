//
//  QuizEndViewController.swift
//  UsefulAppStark
//
//  Created by MATTHEW FITCH on 11/26/24.
//

import UIKit

class QuizEndViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var correctTableView: UITableView!
        
    @IBOutlet weak var percentageText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        correctTableView.delegate = self
        correctTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var percentage: Double = Double(Point.correct.count) / Double(Point.correct.count + Point.wrong.count)
        
        percentage *= 100
        
        percentage = floor(percentage)
        
        percentageText.text = "You got \(percentage)% questions correct"
        
        correctTableView.reloadData()
        
    }
    
    @IBAction func quizAgain(_ sender: Any) {
        Point.correct = []
        Point.wrong = []
        Point.endlessResults = []
        Point.number = 0
        Settings.resett = true
        self.navigationController?.popViewController(animated: true)
  
    }
    
    @IBAction func goToMenu(_ sender: Any) {
        Point.correct = []
        Point.wrong = []
        Point.endlessResults = []
        Point.number = 0
        Settings.resett = true
        Settings.isPopping = true
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return tableView == correctTableView ? Point.correct.count : Point.wrong.count
        return Info.flashCardArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellBeHere") as! CellStuff
            var string = ""
            if Info.flashCardArray[indexPath.row].stared{
                string = "star.fill"
            } else {
                string = "star"
            }
            var correct = 0
        var repeet = false
        repeat{
            repeet = false
            for i in 0..<Point.correct.count{
                if Info.flashCardArray[indexPath.row].word == Point.correct[i].word{
                    correct += 1
                    Point.correct.remove(at: i)
                    repeet = true
                    break
                }
            }
        }while(repeet)
            var wrong = 0
        repeet = false
        repeat {
            repeet = false
            for i in 0..<Point.wrong.count{
                if Info.flashCardArray[indexPath.row].word == Point.wrong[i].word{
                    wrong += 1
                    Point.wrong.remove(at: i)
                    repeet = true
                    break
                }
            }
        } while(repeet)
        cell.configureEnd(word: Info.flashCardArray[indexPath.row].word, def: Info.flashCardArray[indexPath.row].def, image: string, num: indexPath.row, correct: correct, wrong: wrong)
            return cell
    }

}
