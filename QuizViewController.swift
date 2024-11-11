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
}

class Point {
    static var correct = 0
    static var wrong = 0
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
        randomize()
        self.navigationItem.setHidesBackButton(true, animated: true)

    }
    override func viewWillAppear(_ animated: Bool) {
        if Settings.resett {
            reset()
        }
        if Settings.wordd {
            wordPart.text = "\(randomArray[Point.number].word)"
        } else {
            wordPart.text = "\(randomArray[Point.number].def)"
        }
        if correctRand == 1 {
            if Settings.wordd {option1.text = randomArray[Point.number].def}
            else {option1.text = randomArray[Point.number].word}
        } else {
            if Settings.wordd {option1.text = randomArray[rand1].def}
            else {option1.text = randomArray[rand1].word}
        }
        if correctRand == 2 {
            if Settings.wordd {option2.text = randomArray[Point.number].def}
            else {option2.text = randomArray[Point.number].word}
        } else {
            if Settings.wordd {option2.text = randomArray[rand2].def}
            else {option2.text = randomArray[rand2].word}
        }
        if correctRand == 3 {
            if Settings.wordd {option3.text = randomArray[Point.number].def}
            else {option3.text = randomArray[Point.number].word}
        } else {
            if Settings.wordd {option3.text = randomArray[rand3].def}
            else {option3.text = randomArray[rand3].word}
        }
        if correctRand == 4 {
            if Settings.wordd {option4.text = randomArray[Point.number].def}
            else {option4.text = randomArray[Point.number].word}
        } else {
            if Settings.wordd {option4.text = randomArray[rand4].def}
            else {option4.text = randomArray[rand4].word}
        }
        correctLabel.text = "Correct:\n\(Point.correct)"
        wrongLabel.text = "Wrong:\n\(Point.wrong)"
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func button1(_ sender: Any) {
        if correctRand == 1{
            Point.correct += 1
        } else {
            Point.wrong += 1
        }
        correctLabel.text = "Correct:\n\(Point.correct)"
        wrongLabel.text = "Wrong:\n\(Point.wrong)"
        if ((Point.correct+Point.wrong) % Info.flashCardArray.count) != 0{
            self.increase()
        }
        if Settings.wordd {
            wordPart.text = "\(randomArray[Point.number].word)"
        } else {
            wordPart.text = "\(randomArray[Point.number].def)"
        }
        randomize()
    }
    @IBAction func button2(_ sender: Any) {
        if correctRand == 2{
            Point.correct += 1
        } else {
            Point.wrong += 1
        }
        correctLabel.text = "Correct:\n\(Point.correct)"
        wrongLabel.text = "Wrong:\n\(Point.wrong)"
        if ((Point.correct+Point.wrong) % Info.flashCardArray.count) != 0{
            self.increase()
        }
        if Settings.wordd {
            wordPart.text = "\(randomArray[Point.number].word)"
        } else {
            wordPart.text = "\(randomArray[Point.number].def)"
        }
        randomize()
    }
    @IBAction func button3(_ sender: Any) {
        if correctRand == 3{
            Point.correct += 1
        } else {
            Point.wrong += 1
        }
        correctLabel.text = "Correct:\n\(Point.correct)"
        wrongLabel.text = "Wrong:\n\(Point.wrong)"
        if ((Point.correct+Point.wrong) % Info.flashCardArray.count) != 0{
            self.increase()
        }
        if Settings.wordd {
            wordPart.text = "\(randomArray[Point.number].word)"
        } else {
            wordPart.text = "\(randomArray[Point.number].def)"
        }
        randomize()
    }
    @IBAction func button4(_ sender: Any) {
        if correctRand == 4{
            Point.correct += 1
        } else {
            Point.wrong += 1
        }
        correctLabel.text = "Correct:\n\(Point.correct)"
        wrongLabel.text = "Wrong:\n\(Point.wrong)"
        if ((Point.correct+Point.wrong) % Info.flashCardArray.count) != 0{
            self.increase()
        }
        if Settings.wordd {
            wordPart.text = "\(randomArray[Point.number].word)"
        } else {
            wordPart.text = "\(randomArray[Point.number].def)"
        }
        randomize()
    }
    
    func increase(){
        if Point.number == randomArray.count-1 {
            Point.number = 0
        } else {
            Point.number += 1
        }
    }
    
    func randomize(){
        if ((Point.correct+Point.wrong) % Info.flashCardArray.count) == 0 {
            let store = randomArray[Point.number].word
            increase()
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
        if correctRand != 1{
            rand1 = Int.random(in: 0...randomArray.count-1)
            while rand1 == Point.number{
                rand1 = Int.random(in: 0...randomArray.count-1)
            }
        }
        if correctRand != 2{
            rand2 = Int.random(in: 0...randomArray.count-1)
            while rand2 == rand1 || rand2 == Point.number {
                rand2 = Int.random(in: 0...randomArray.count-1)
            }
        }
        if correctRand != 3{
            rand3 = Int.random(in: 0...randomArray.count-1)
            while rand3 == rand1 || rand3 == rand2 || rand3 == Point.number{
                rand3 = Int.random(in: 0...randomArray.count-1)
            }
        }
        if correctRand != 4{
            rand4 = Int.random(in: 0...randomArray.count-1)
            while rand4 == rand1 || rand4 == rand2 || rand4 == rand3 || rand4 == Point.number{
                rand4 = Int.random(in: 0...randomArray.count-1)
            }
        }

        print("texts")
        if correctRand == 1 {
            if Settings.wordd {option1.text = randomArray[Point.number].def}
            else {option1.text = randomArray[Point.number].word}
        } else {
            if Settings.wordd {option1.text = randomArray[rand1].def}
            else {option1.text = randomArray[rand1].word}
        }
        if correctRand == 2 {
            if Settings.wordd {option2.text = randomArray[Point.number].def}
            else {option2.text = randomArray[Point.number].word}
        } else {
            if Settings.wordd {option2.text = randomArray[rand2].def}
            else {option2.text = randomArray[rand2].word}
        }
        if correctRand == 3 {
            if Settings.wordd {option3.text = randomArray[Point.number].def}
            else {option3.text = randomArray[Point.number].word}
        } else {
            if Settings.wordd {option3.text = randomArray[rand3].def}
            else {option3.text = randomArray[rand3].word}
        }
        if correctRand == 4 {
            if Settings.wordd {option4.text = randomArray[Point.number].def}
            else {option4.text = randomArray[Point.number].word}
        } else {
            if Settings.wordd {option4.text = randomArray[rand4].def}
            else {option4.text = randomArray[rand4].word}
        }
    }
    
    
    func reset(){
           Point.correct = 0
           Point.wrong = 0
           Point.number = 0
           self.correctLabel.text = "Correct:\n\(Point.correct)"
           self.wrongLabel.text = "Wrong:\n\(Point.wrong)"
        if Settings.wordd {
            self.wordPart.text = "\(randomArray[Point.number].word)"
        } else {
            self.wordPart.text = "\(randomArray[Point.number].def)"
        }
           self.randomize()
           Settings.resett = false
   }

}
