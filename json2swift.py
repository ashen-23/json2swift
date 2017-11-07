#!/usr/bin/env python
import os
import json
import collections
from tkinter import *

# key className
Result = collections.namedtuple("Result", ["key","define", "name"])
# 解析所有结果
result = []
# 所有类名
classNames = []
# 最终文件
save2File = []

# 初始化header
def configHeader():
	header = '''//
	//  {0}.swift
	//  HPacs
	//
	//  Created by sr on 16/2/23.
	//  Copyright © 2016年 HH. All rights reserved.
	//
	'''.format(classNames[0])
	save2File.append(header)
	
# objectMapper 适用代码
def addMapper(cls):
	header = '''
	public init?(map: Map) {
	}

	mutating public func mapping(map: Map) {'''
	save2File.append(header)
	for r in result:
		if r.name == cls:
			save2File.append('		{0} <- map["{0}"]'.format(r.key))
	save2File.append("	}")
	
# 转换成swift对应类型
def convetType(value):
	if isinstance(value, str):
		return "String"
	elif isinstance(value, float):
		return "Float"
	elif isinstance(value, bool):
		return "Bool"
	elif isinstance(value, int):
		return "Int"
	elif isinstance(value, list):
		return "Array"
	elif not value:
		return "String"

# 处理字典
def proDict(dic, name = ""):
	if name != "":
		classNames.append(name)
		print("添加新的类名 %s" % name)

	for (key, value) in dic.items():
		if isinstance(value, dict):
			proDict(value, key)
		elif isinstance(value, list):
			proList(value, key)
			
		k = '    var {0}: {1}?'.format(key, convetType(value))
		result.append(Result(key, k, name))
		

# 处理数组
def proList(lis, name = ""):
	pro = lis[0]
	if isinstance(pro, dict):
		proDict(pro, name)
	elif isinstance(pro, list):
		proList(pro)

# 具体显示内容
def display():
	configHeader()
	for cls in classNames:
		save2File.append("struct %s: Mappable {" % cls)
		for r in result:
			if r.name == cls:
				save2File.append(r.define)
		addMapper(cls)
		save2File.append("}")
		save2File.append("")
		
	with open("data", "w") as f:
		f.writelines([line+'\n' for line in save2File])	

# 处理元数据
def processData(aDict, name):
	if isinstance(aDict, dict):
		proDict(aDict, name)
	elif isinstance(aDict, list):
		proList(aDict, name)
	
	display()




# GUI
#class Application(Frame):
#	def __init__(self, master=None):
#		Frame.__init__(self, master)
#		self.pack()
#		self.createWidgets()
#
#	def createWidgets(self):
#		
#		container = Frame(self)
#		container.pack()
#		self.helloLabel = Label(container, text='输入json: ')
#		self.helloLabel.pack(side=TOP)
#		self.inputTxt = Text(container, bg="gray")
#		self.inputTxt.pack(side=LEFT)
#
#		self.outputTxt = Text(container)
#		self.outputTxt.pack(side=RIGHT)
#		self.quitButton = Button(self, text='生成', command=self.proJson)
#		self.quitButton.pack()
#	
#	
#	def proJson(self):
#		res = self.inputTxt.Text()["data"]
##		res = d["data"]
#		processData(res, "data")
#
#app = Application()
## 设置窗口标题:
#app.master.title('json 2 swift')
#app.master.geometry("500x200")
## 主消息循环:
#app.mainloop()

with open("jsons.txt","r") as f:
	d = json.loads(f.read())
	res = d["data"]
	processData(res, "data")

