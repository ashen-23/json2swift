import Parse
import json


with open("jsons.txt","r") as f:
	d = json.loads(f.read())
	# 输出
	result = Parse.process(d, "Result")
	
	with open("ResultModel.swift", "w") as w:
		w.writelines([line+'\n' for line in result])	
		print("finished")
