//
//  ViewController.swift
//  Wooden counters
//
//  Created by Левиафан on 2024-04-24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorSwitch: UISegmentedControl!
    
    @IBOutlet weak var mainLine: UILabel!
    
    @IBOutlet weak var resultLine: UILabel!
    
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var percentButton: UIButton!
    
    @IBOutlet weak var divideButton: UIButton!
    
    @IBOutlet weak var multiplyButton: UIButton!
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var equallyButton: UIButton!
    
    @IBOutlet weak var separatorButton: UIButton!
    
    @IBOutlet weak var zeroButton: UIButton!
    
    @IBOutlet weak var oneButton: UIButton!
    
    @IBOutlet weak var twoButton: UIButton!
    
    @IBOutlet weak var threeButton: UIButton!
    
    @IBOutlet weak var fourButton: UIButton!
    
    @IBOutlet weak var fiveButton: UIButton!
    
    @IBOutlet weak var sixButton: UIButton!
    
    @IBOutlet weak var sevenButton: UIButton!
    
    @IBOutlet weak var eightButton: UIButton!
    
    @IBOutlet weak var nineButton: UIButton!
    
    
    var calculations: String = " "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll() {
        
        calculations = " "
        mainLine.text = " "
        resultLine.text = " "
    }
    

    
    @IBAction func calculatorSwitchValueChanged(_ sender: UISegmentedControl) {
        let isEnabled = calculatorSwitch.selectedSegmentIndex != 1
        let buttons: [UIButton] = [clearButton, backButton, percentButton, divideButton, multiplyButton, minusButton, plusButton, equallyButton, separatorButton, zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton]
        
        for button in buttons {
        
                button.isEnabled = isEnabled
            }
        
            if !isEnabled {
              clearAll()
            }
          }
    
    
    @IBAction func clearButton(_ sender: UIButton) {
        clearAll()
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        
        if !calculations.isEmpty {
            calculations.removeLast()
            mainLine.text = calculations
        }
        
    }
    
    func addToCalculations(value: String) {
        calculations += value
        mainLine.text = calculations
    }
    
    @IBAction func percentButton(_ sender: UIButton) {
        
        addToCalculations(value: "%")
        
    }
    
    @IBAction func divideButton(_ sender: UIButton) {
        addToCalculations(value: "/")
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        
        addToCalculations(value: "*")
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        
        addToCalculations(value: "-")
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        
        addToCalculations(value: "+")
        
    }
    
    @IBAction func equallyButton(_ sender: UIButton) {
        
        if validInput() {
            
            let checkedCalculationsForPercent = calculations.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedCalculationsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as? Double
            let resultString = formatResult(result: result!)
            resultLine.text = resultString
            
        } else {
            
            let alert = UIAlertController(title: "Неверный ввод", message: "Электроника 2.0 не может выполнить математические вычисления на основе введенных данных", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Проверьте данные", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        
    
        
        
        func validInput() -> Bool{
            
            let operators = ["+", "-", "*", "/"]
            var count = 0
            var funcIndexes = [Int]()
  
            
        for char in calculations {
                
            if operators.contains(String(char)){
                funcIndexes.append(count)
                }
                
            count += 1
                
            }
    
            var previous: Int = -1
            
            
        for index in funcIndexes {
            if index == 0 || index == calculations.count - 1 {
                
            return false
            
        }
                
            if (index == calculations.count - 1) {
                    
            return false
                    
                }
                
            if (previous != -1 && index - previous == 1) {
                
             return false
                
                }
            
                previous = index
             }
                       
             return true
                  
        }
        
        
        
        func formatResult(result: Double) -> String {
            
            if(result.truncatingRemainder(dividingBy: 1) == 0) {
                
                return String(format: "%.0f", result)
                
            } else {
                
            return String(format: "%.1f", result)
                
            }
        }
        
    }
    
        
        
        @IBAction func separatorButton(_ sender: UIButton) {
            
            addToCalculations(value: ".")
            
        }
        
        @IBAction func zeroButton(_ sender: UIButton) {
            
            addToCalculations(value: "0")
            
        }
        
        @IBAction func oneButton(_ sender: UIButton) {
            
            addToCalculations(value: "1")
        }
        
        @IBAction func twoButton(_ sender: UIButton) {
            
            addToCalculations(value: "2")
        }
        @IBAction func threeButton(_ sender: UIButton) {
            
            addToCalculations(value: "3")
        }
        
        @IBAction func fourButton(_ sender: UIButton) {
            
            addToCalculations(value: "4")
        }
        
        @IBAction func fiveButton(_ sender: UIButton) {
            
            addToCalculations(value: "5")
            
        }
        
        @IBAction func sixButton(_ sender: UIButton) {
            
            addToCalculations(value: "6")
            
        }
        
        @IBAction func sevenButton(_ sender: UIButton) {
            
            addToCalculations(value: "7")
            
        }
        
        @IBAction func eightButton(_ sender: UIButton) {
            
            addToCalculations(value: "8")
            
        }
        
        @IBAction func nineButton(_ sender: UIButton) {
            
            addToCalculations(value: "9")
            
        }
        
    }
    

    
    

