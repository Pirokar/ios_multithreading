//
//  ViewController.swift
//  SlowWorker
//
//  Created by Владимир Рыбалка on 14/09/2017.
//  Copyright © 2017 Vladimir Rybalka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var startButton: UIButton!
    @IBOutlet var resultsTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchSomethingFromServer() -> String {
        Thread.sleep(forTimeInterval: 1)
        return "Hi there"
    }
    
    func processData(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 2)
        return data.uppercased()
    }
    
    func calculateFirstResult(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 3)
        return "Number of chars: \(data.characters.count)"
    }
    
    func calculateSecondResult(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 4)
        return data.replacingOccurrences(of: "E", with: "e")
    }
    
    @IBAction func doWork(_ sender: AnyObject) {
        let startTime = NSDate()
        self.resultsTextView.text = ""
        let fetchedData = fetchSomethingFromServer()
        let processedData = processData(fetchedData)
        let firstResult = calculateFirstResult(processedData)
        let secondResult = calculateSecondResult(processedData)
        let resultSummary = "First: [\(firstResult)]\nSecond: [\(secondResult)]"
        
        resultsTextView.text = resultSummary
        let endTime = NSDate()
        print("Comleted in \(endTime.timeIntervalSince(startTime as Date)) seconds")
    }

}

