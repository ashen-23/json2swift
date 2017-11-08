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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func doExcute(_ sender: NSButton) {
        guard let aPath = Bundle.main.path(forResource: "Parse", ofType: "py") else { return }
        var args = [aPath]
        // 参数
        args.append(inputView.string)
                
        if mapperCheck.state == .on {
            args.append("objectMapper")
        }
        
        runPython(args: args)
    }
    
    func runPython(args: [String]?) {
        
        let buildTask = Process()
        let outPip = Pipe()
        let errorPipe = Pipe()
        
        buildTask.launchPath = "/usr/bin/python"
        buildTask.arguments = args
        buildTask.standardInput = Pipe()
        buildTask.standardOutput = outPip
        buildTask.standardError = errorPipe
        buildTask.terminationHandler = { p in
            self.taskFinish()
        }
        buildTask.launch()
        buildTask.waitUntilExit()
        
        let data = outPip.fileHandleForReading.readDataToEndOfFile()
        let str = String(data: data, encoding: String.Encoding.utf8)
        outputView.string = str ?? "解析错误"
        
        // 错误处理
        let errorData = errorPipe.fileHandleForReading.readDataToEndOfFile()
        let errorStr = String(data: errorData, encoding: String.Encoding.utf8)
        if let aError = errorStr, aError != "" {
            outputView.string = "解析错误\r\n" + aError
        }
    }
    
    func taskFinish() {
        print("执行完毕")
    }
    
    @IBAction func runDemo(_ sender: NSButton) {
        inputView.string = demoJson
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
           self.doExcute(sender)
        }
    }

}
