# json2swift

auto convert json string to swift struct.[中文介绍](./Document/README_chs.md)

![demo](./Document/demo.gif)



***

- How to use?

   [OS X app](https://pan.baidu.com/s/1skW4Jxj)

  - 1. Input json to left

  - 2. click "convert=>"

  - 3. Copy the result
    Parameters statement:

    -  [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper): Simple JSON Object mapping written in Swift. If this is selected, result will auto add func mapping

    -  name: the name of the result, default is "Result"

    -  prefix: the prefix of each struct name, default is empty.


  [python script](./script)

   - 1. open Terminal, cd to Main.py

   - 2. Copy json string to File named "jsons.txt"

   - 3. Python3 Main.py

   - 4. ResultModel.swift is the result

   ![](./Document/terminal_ope.gif)

***

## Other
[PyScript](): a fast way to use python with Cocoa

***
## Reference

- python 简单入门指北
- [Python教程](https://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000)
- [Running a Python Script from Swift](http://martinhoeller.net/running-a-python-script-from-swift/)

