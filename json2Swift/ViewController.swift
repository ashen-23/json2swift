//
//  ViewController.swift
//  json2Swift
//
//  Created by Shi Jian on 2017/11/8.
//  Copyright © 2017年 HHMedic. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var inputView: NSTextView!
    @IBOutlet var outputView: NSTextView!
    @IBOutlet weak var mapperCheck: NSButton!
    @IBOutlet weak var nameText: NSTextField!
    @IBOutlet weak var prefixText: NSTextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func doExcute(_ sender: NSButton) {
        runScript()
    }
    
    func runScript() {
        guard let aPath = Bundle.main.path(forResource: "Parse", ofType: "py") else { return }
        
        let script = CocoaPython(scrPath: aPath, args: fetchArgs()) { [weak self] in
            self?.scriptFinish(results: $0, error: $1)
        }

        script.runAsync()
    }
    
    // 执行完成的回调
    func scriptFinish(results: [String], error: String?) {
        if let aError = error {
            outputView.string = "解析错误\r\n" + aError
            return
        }
        
        outputView.string = results[0]
    }
    
    func fetchArgs() -> [String] {
        var args = [inputView.string]
        // mapper
        args.append(mapperCheck.state == .on ? "objectMapper" : "none")
        
        // name
        let name = nameText.stringValue == "" ? "Result" : nameText.stringValue
        args.append(name)
        
        // prefix
        args.append(prefixText.stringValue)
        
        return args
    }
    
    @IBAction func runDemo(_ sender: NSButton) {
        inputView.string = demoJson
        nameText.stringValue = "Result"
        prefixText.stringValue = "SJ_"
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
           self.runScript()
        }
    }

}
