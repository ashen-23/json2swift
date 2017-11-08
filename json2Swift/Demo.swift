//
//  Demo.swift
//  json2Swift
//
//  Created by Shi Jian on 2017/11/8.
//  Copyright © 2017年 HHMedic. All rights reserved.
//

import Cocoa

let demoJson = """
{
"status": 200,
"message": "操作成功",
"data": {
    "createTime": 1509446823000,
    "name": "语音",
    "photourl": null,
    "age": 77,
    "height": 171.5,
    "test": false,
    "sub": {
        "sub_list": [
        {
        "name": "测试1",
        "argInt": 12,
        "sub_list_dict": {
            "p1": 1509446823000,
            "p2": "语音"
            }
        },
        {
        "name": "测试2",
        "argInt": 12,
        "sub_list_dict": {
            "p1": 1509446823000,
            "p2": "语音"
            }
        }
        ],
        "argOther": "测试文本",
        "sub_dict": {
            "p1": 1509446823000,
            "p2": "语音"
            }
        }
    }
}
"""
