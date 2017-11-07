import Parse
import json


with open("jsons.txt","r") as f:
	d = json.loads(f.read())
	res = d["data"]
	# 输出
	result = Parse.process(res, "data")
	
	with open("data", "w") as w:
		w.writelines([line+'\n' for line in result])	