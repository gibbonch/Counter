//
//  ViewController.swift
//  Counter
//
//  Created by Александр Торопов on 24.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var counterValue = 0
    private var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "[dd-MM-yyyy HH:mm]: "
        return dateFormatter.string(from: Date())
    }
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.text.append("\n")
        historyTextView.layer.cornerRadius = 8
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        switch sender {
        case increaseButton:
            counterValue += 1
            addToHistory("значение изменено на +1")
        case resetButton:
            counterValue = 0
            addToHistory("значение сброшено")
        case decreaseButton where counterValue > 0:
            counterValue -= 1
            addToHistory("значение изменено на -1")
        default:
            addToHistory("попытка уменьшить значение счетчика ниже нуля")
        }
        counterLabel.text = "\(counterValue)"
    }
    
    private func addToHistory(_ note: String) {
        historyTextView.text.append(currentDate + note + "\n")
    }
}

