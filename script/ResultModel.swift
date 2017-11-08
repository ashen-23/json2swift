//
//  data.swift
//  HPacs
//
//  Created by sr on 16/2/23.
//  Copyright © 2016年 HH. All rights reserved.
//
	
struct data: Mappable {
    var uuid: Int?
    var relation: String?
    var pid: String?
    var createTime: Int?
    var patientId: String?
    var name: String?
    var loginname: String?
    var sex: String?
    var birthday: String?
    var photourl: String?
    var kind: String?
    var aidUuid: Int?
    var aidName: String?
    var coopId: String?
    var exist: Bool?
    var appointDoctorId: String?
    var appointDoctorName: String?
    var age: String?
    var videoToken: String?
    var product: None?
    var accountMoney: Int?
    var children: String?
    var companyId: String?
    var test: Bool?
    var buyProduct: Bool?

	public init?(map: Map) {
	}

	mutating public func mapping(map: Map) {
		uuid <- map["uuid"]
		relation <- map["relation"]
		pid <- map["pid"]
		createTime <- map["createTime"]
		patientId <- map["patientId"]
		name <- map["name"]
		loginname <- map["loginname"]
		sex <- map["sex"]
		birthday <- map["birthday"]
		photourl <- map["photourl"]
		kind <- map["kind"]
		aidUuid <- map["aidUuid"]
		aidName <- map["aidName"]
		coopId <- map["coopId"]
		exist <- map["exist"]
		appointDoctorId <- map["appointDoctorId"]
		appointDoctorName <- map["appointDoctorName"]
		age <- map["age"]
		videoToken <- map["videoToken"]
		product <- map["product"]
		accountMoney <- map["accountMoney"]
		children <- map["children"]
		companyId <- map["companyId"]
		test <- map["test"]
		buyProduct <- map["buyProduct"]
	}
}

struct product: Mappable {
    var productDetail: Array?
    var productServiceId: Int?
    var productServiceName: String?
    var productPrice: Int?
    var batchType: String?
    var batchNum: Int?
    var createTime: Int?
    var isSelfDoctor: Bool?
    var expertBatchNum: Int?
    var vipReferralNum: Int?
    var famDoctorPrice: Int?
    var appointmentHospitalNum: String?
    var carNum: String?
    var originPrice: String?
    var expireTime: Int?
    var validateMonth: Int?
    var expirationTime: Int?
    var selfDoctor: Bool?

	public init?(map: Map) {
	}

	mutating public func mapping(map: Map) {
		productDetail <- map["productDetail"]
		productServiceId <- map["productServiceId"]
		productServiceName <- map["productServiceName"]
		productPrice <- map["productPrice"]
		batchType <- map["batchType"]
		batchNum <- map["batchNum"]
		createTime <- map["createTime"]
		isSelfDoctor <- map["isSelfDoctor"]
		expertBatchNum <- map["expertBatchNum"]
		vipReferralNum <- map["vipReferralNum"]
		famDoctorPrice <- map["famDoctorPrice"]
		appointmentHospitalNum <- map["appointmentHospitalNum"]
		carNum <- map["carNum"]
		originPrice <- map["originPrice"]
		expireTime <- map["expireTime"]
		validateMonth <- map["validateMonth"]
		expirationTime <- map["expirationTime"]
		selfDoctor <- map["selfDoctor"]
	}
}

struct productDetail: Mappable {
    var name: String?
    var content: String?
    var tips: String?

	public init?(map: Map) {
	}

	mutating public func mapping(map: Map) {
		name <- map["name"]
		content <- map["content"]
		tips <- map["tips"]
	}
}

