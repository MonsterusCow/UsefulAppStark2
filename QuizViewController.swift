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
    //normal, endless
    static var quizLength = "normal"
    //normal, stared
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
        if (Info.flashCardArray.count > 3){
            randomize()
        }
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    override func viewWillAppear(_ animated: Bool){
            if Settings.resett {
                reset()
            }
//            if Settings.quizLength == "normal"{
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
                
//            }
            correctLabel.text = "Correct:\n\(Point.correct.count)"
            wrongLabel.text = "Wrong:\n\(Point.wrong.count)"
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
        if Settings.quizLength == "normal"{
            if Point.number == randomArray.count-1 {
                performSegue(withIdentifier: "endQuiz", sender: nil)
            } else {
                Point.number += 1
            }
        }
        if Settings.quizLength == "endless"{
            if Point.number == randomArray.count-1 {
                Point.number = 0
            } else {
                Point.number += 1
            }
        }
    }
    
    func randomize(){
        print("randomize")
        if ((Point.correct.count + Point.wrong.count) % Info.flashCardArray.count) == 0 {
            print(Point.number)
            let lastQuestion = randomArray[Point.number].word
            if (Point.number != 0)
            {
                moveOn()
            }
            print("before")
            if Settings.quizType == "normal"{
                randomArray = Info.flashCardArray.shuffled()
            }
            if Settings.quizType == "stared"{
                randomArray = []
                for i in 0..<Info.flashCardArray.count {
                    if Info.flashCardArray[i].stared {
                        randomArray.append(Info.flashCardArray[i])
                    }
                }
                randomArray = randomArray.shuffled()
            }
            randomArray = randomArray.shuffled()
            print("after")
            while lastQuestion == randomArray[Point.number].word{
                if Settings.quizType == "normal"{
                    randomArray = Info.flashCardArray.shuffled()
                }
                if Settings.quizType == "stared"{
                    randomArray = []
                    for i in 0..<Info.flashCardArray.count {
                        if Info.flashCardArray[i].stared {
                            randomArray.append(Info.flashCardArray[i])
                        }
                    }
                    randomArray = randomArray.shuffled()
                }
            }
            for i in 0..<randomArray.count {
                print(randomArray[i].word)
            }
            if Settings.wordd {
                wordPart.text = "\(randomArray[Point.number].word)"
            } else {
                wordPart.text = "\(randomArray[Point.number].def)"
            }
        }//
        print("after 2")
        correctRand = Int.random(in: 1...4)
        rand1 = -1
        rand2 = -1
        rand3 = -1
        rand4 = -1
        
        if correctRand != 1 {
            rand1 = Int.random(in: 0...randomArray.count-1)
            while rand1 == Point.number || rand1 == rand2 || rand1 == rand3 || rand1 == rand4 {
                rand1 = Int.random(in: 0...randomArray.count-1)
            }
        }
        
        if correctRand != 2 {
            rand2 = Int.random(in: 0...randomArray.count-1)
            while rand2 == Point.number || rand2 == rand1 || rand2 == rand3 || rand2 == rand4 {
                rand2 = Int.random(in: 0...randomArray.count-1)
            }
        }
        
        if correctRand != 3 {
            rand3 = Int.random(in: 0...randomArray.count-1)
            while rand3 == Point.number || rand3 == rand1 || rand3 == rand2 || rand3 == rand4 {
                rand3 = Int.random(in: 0...randomArray.count-1)
            }
        }
        
        if correctRand != 4 {
            rand4 = Int.random(in: 0...randomArray.count-1)
            while rand4 == Point.number || rand4 == rand1 || rand4 == rand3 || rand4 == rand2 {
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
    
    @IBAction func resetButton(_ sender: Any) {
        let alert = UIAlertController(title: "Reset?", message: "Would you like to reset the quiz?", preferredStyle: UIAlertController.Style.alert)
        let noAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
        let yesAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default){ (action) in
            self.reset()
        }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true)
    }
    
    func reset(){
           Point.correct = [Flashcard]()
           Point.wrong = [Flashcard]()
           Point.number = 0
        self.correctLabel.text = "Correct:\n\(Point.correct.count)"
        self.wrongLabel.text = "Wrong:\n\(Point.wrong.count)"
        self.randomize()
        if Settings.wordd {
            self.wordPart.text = "\(randomArray[Point.number].word)"
        } else {
            self.wordPart.text = "\(randomArray[Point.number].def)"
        }
           Settings.resett = false
   }
    
    func notEnoughCardsError(alertMessage: String, alertTitle: String)
    {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){ (action) in
            self.tabBarController?.selectedIndex = 0
        }
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    

}
