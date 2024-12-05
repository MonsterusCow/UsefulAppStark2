//
//  QuizViewController.swift
//  UsefulAppStark
//
//  Created by RYAN STARK on 11/1/24.
//


import UIKit

class Settings {
    static var wordd = true
    static var deff = false
    static var resett = false
    //normal, endless, stared
    static var quizType = "normal"
}

class Point {
    static var correct = [Flashcard]()
    static var wrong = [Flashcard]()
    static var number = 0
}

class QuizViewController: UIViewController {

    @IBOutlet weak var wordPart: UILabel!
    @IBOutlet weak var option1: UILabel!
    @IBOutlet weak var option2: UILabel!
    @IBOutlet weak var option3: UILabel!
    @IBOutlet weak var option4: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    var correctRand = 1
    var rand1 = -1
    var rand2 = -1
    var rand3 = -1
    var rand4 = -1
    var randomArray = Info.flashCardArray.shuffled()
    var started = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomArray = Info.flashCardArray.shuffled()
        randomize()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    override func viewWillAppear(_ animated: Bool){
        if (Info.flashCardArray.count == 0)
        {
            notEnoughCardsError(alertName: "Not enough flashcards", alertTitle: "Create a flashcard first to view flashcards")
        } else {
            if Settings.resett {
                reset()
            }
            if Settings.quizType == "normal"{
                if Settings.wordd {
                    wordPart.text = "\(randomArray[Point.number].word)"
                } else {
                    wordPart.text = "\(randomArray[Point.number].def)"
                }
                
                let options = [option1, option2, option3, option4]
                
                for i in 0 ..< options.count {
                    if correctRand == i + 1
                    {
                        if Settings.wordd
                        {
                            options[i]!.text = randomArray[Point.number].def
                        } else {
                            options[i]!.text = randomArray[Point.number].word
                        }
                    }
                }
                
            }
            correctLabel.text = "Correct:\n\(Point.correct.count)"
            wrongLabel.text = "Wrong:\n\(Point.wrong.count)"
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func button1(_ sender: Any) {
        buttonThing(correctNumberThingWhyRyan: 1)
    }
    @IBAction func button2(_ sender: Any) {
        buttonThing(correctNumberThingWhyRyan: 2)
    }
    @IBAction func button3(_ sender: Any) {
        buttonThing(correctNumberThingWhyRyan: 3)
    }
    @IBAction func button4(_ sender: Any) {
        buttonThing(correctNumberThingWhyRyan: 4)
    }
    
    func buttonThing(correctNumberThingWhyRyan: Int)
    {
        if correctRand == correctNumberThingWhyRyan {
            Point.correct.append(randomArray[Point.number])
        } else {
            Point.wrong.append(randomArray[Point.number])
        }
        correctLabel.text = "Correct:\n\(Point.correct.count)"
        wrongLabel.text = "Wrong:\n\(Point.wrong.count)"
        if ((Point.correct.count + Point.wrong.count) % Info.flashCardArray.count) != 0{
            self.moveOn()
        }
        if Settings.wordd {
            wordPart.text = "\(randomArray[Point.number].word)"
        } else {
            wordPart.text = "\(randomArray[Point.number].def)"
        }
        randomize()
    }
    
    func moveOn(){
        if Settings.quizType == "normal"{
            if Point.number == randomArray.count-1 {
                performSegue(withIdentifier: "endQuiz", sender: nil)
            } else {
                Point.number += 1
            }
        }
        if Settings.quizType == "endless"{
            if Point.number == randomArray.count-1 {
                Point.number = 0
            } else {
                Point.number += 1
            }
        }
    }
    
    func randomize(){
        if ((Point.correct.count + Point.wrong.count) % Info.flashCardArray.count) == 0 {
            print(Point.number)
            let store = randomArray[Point.number].word
            moveOn()
            randomArray = Info.flashCardArray.shuffled()
            while store == randomArray[Point.number].word{
                randomArray = Info.flashCardArray.shuffled()
            }
            if Settings.wordd {
                wordPart.text = "\(randomArray[Point.number].word)"
            } else {
                wordPart.text = "\(randomArray[Point.number].def)"
            }
        }
        correctRand = Int.random(in: 1...4)
        rand1 = -1
        rand2 = -1
        rand3 = -1
        rand4 = -1
        
        if correctRand != 1 {
            rand1 = Int.random(in: 0...randomArray.count-1)
            while rand1 == Point.number{
                rand1 = Int.random(in: 0...randomArray.count-1)
            }
        }
        
        if correctRand != 2 {
            rand2 = Int.random(in: 0...randomArray.count-1)
            while rand2 == Point.number{
                rand2 = Int.random(in: 0...randomArray.count-1)
            }
        }
        
        if correctRand != 3 {
            rand3 = Int.random(in: 0...randomArray.count-1)
            while rand3 == Point.number{
                rand3 = Int.random(in: 0...randomArray.count-1)
            }
        }
        
        if correctRand != 4 {
            rand4 = Int.random(in: 0...randomArray.count-1)
            while rand4 == Point.number{
                rand4 = Int.random(in: 0...randomArray.count-1)
            }
        }

        print("texts")
        
        if correctRand == 1 {
            if Settings.wordd {option1!.text = randomArray[Point.number].def}
            else {option1!.text = randomArray[Point.number].word}
        } else {
            if Settings.wordd {option1!.text = randomArray[rand1].def}
            else {option1!.text = randomArray[rand1].word}
        }
        if correctRand == 2 {
            if Settings.wordd {option2!.text = randomArray[Point.number].def}
            else {option2!.text = randomArray[Point.number].word}
        } else {
            if Settings.wordd {option2!.text = randomArray[rand2].def}
            else {option2!.text = randomArray[rand2].word}
        }
        if correctRand == 3 {
            if Settings.wordd {option3!.text = randomArray[Point.number].def}
            else {option3!.text = randomArray[Point.number].word}
        } else {
            if Settings.wordd {option3!.text = randomArray[rand3].def}
            else {option3!.text = randomArray[rand3].word}
        }
        if correctRand == 4 {
            if Settings.wordd {option4!.text = randomArray[Point.number].def}
            else {option4!.text = randomArray[Point.number].word}
        } else {
            if Settings.wordd {option4!.text = randomArray[rand4].def}
            else {option4!.text = randomArray[rand4].word}
        }
    }
    
    
    func reset(){
           Point.correct = [Flashcard]()
           Point.wrong = [Flashcard]()
           Point.number = 0
        self.correctLabel.text = "Correct:\n\(Point.correct.count)"
        self.wrongLabel.text = "Wrong:\n\(Point.wrong.count)"
        if Settings.wordd {
            self.wordPart.text = "\(randomArray[Point.number].word)"
        } else {
            self.wordPart.text = "\(randomArray[Point.number].def)"
        }
           self.randomize()
           Settings.resett = false
   }
    
    func notEnoughCardsError(alertName: String, alertTitle: String)
    {
        let alert = UIAlertController(title: alertTitle, message: alertName, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){ (action) in
            self.tabBarController?.selectedIndex = 0
        }
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    

}
