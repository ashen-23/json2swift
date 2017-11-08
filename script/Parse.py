#!/usr/bin/env python
import os, sys, time, getpass
import json
import collections

# 可配置参数
structType = "" # 转换类型
prefix = "SJ_" # 前缀
outerName = "" # 最外层class 名称


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
	now = time.strftime('%Y',time.localtime(time.time()))
	user = getpass.getuser()
	header = '''//
//  {0}.swift
//  HPacs
//
//  Created by {1} on 16/2/23.
//  Copyright © {2}年 HH. All rights reserved.
//
	'''.format(classNames[0], user, now)
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
			save2File.append('		{0} 	<- 	map["{0}"]'.format(r.key))
	save2File.append("	}")

# 特殊结构
def addStructure(cls):
	if structType == "objectMapper":
		addMapper(cls)

# 父类
def parentCls():
	if structType == "objectMapper":
		return ": Mappable"
	return ""
	
# 转换成swift对应类型
def convetType(value, key):
	if isinstance(value, str):
		return "String"
	elif isinstance(value, float):
		return "Float"
	elif isinstance(value, bool):
		return "Bool"
	elif isinstance(value, int):
		return "Int"
	elif isinstance(value, list):
		return "[{0}]".format(key)
	elif isinstance(value, dict):
		return key
	elif not value:
		return "String"
	else:
		return "String"

# 类名
def realKey(key):
	return "%s%s" % (prefix, key.capitalize())
	
# 处理字典
def proDict(dic, name = ""):
	if name != "":
		classNames.append(name)

	for (key, value) in dic.items():
		clsName = realKey(key)
		if isinstance(value, list):
			proDict(value[0], clsName)
		elif isinstance(value, dict):
			proDict(value, clsName)
			
		k = '    var {0}: {1}?'.format(key, convetType(value,clsName))
		result.append(Result(key, k, name))
		
# 具体显示内容
def display():
	configHeader()
	for cls in classNames:
		save2File.append("struct %s%s {" % (cls, parentCls()))
		for r in result:
			if r.name == cls:
				save2File.append(r.define)
		addMapper(cls)
		save2File.append("}")
		save2File.append("")
		save2File.append("")
	return save2File

# 处理元数据
def process(data, name):
	name = realKey(name)
	if isinstance(data, list):
		proDict(data[0], name)
	elif isinstance(data, dict):
		proDict(data, name)

	return display()