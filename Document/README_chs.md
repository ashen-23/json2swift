# json2swift

根据json字符串自动生成swift对应的类代码。

![demo](./demo.gif)

## 使用方式

-  [json2Swift.app](https://pan.baidu.com/s/1skW4Jxj)

  在输入框中输入json字符串
  配置相关参数(是否由objectMapper解析，外部类名, 前缀 )
  点击『转换=>』, 结果会在右侧输出

- [python 脚本](./script)

  定位到Main.py文件，将json字符串拷贝至"jsons.txt"
  终端执行```python3 Main.py```
  结果保存在该目录下的"ResultMode.swift"文件中

  ![](./terminal_ope.gif)

  ***

## 参考

- python 简单入门指北
- [Python教程](https://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000)
- [[Running a Python Script from Swift](http://martinhoeller.net/running-a-python-script-from-swift/)]

