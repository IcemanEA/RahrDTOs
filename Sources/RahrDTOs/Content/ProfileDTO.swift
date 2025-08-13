//
//  ProfileDTO.swift
//  RahrDTOs
//
//  Created by Egor Ledkov on 14.07.2025.
//

import Foundation

/// Модель для передачи профилей членов РАРЧ между приложениями и сервисами
public struct ProfileDTO: Codable, Sendable {
	public let id: UUID?
	public let rahrId: Int?
	public let login: String?
	
	public let dateCreate: Int?
	public let dateUpdate: Int?
	public let dateExpire: Int?
	public let dateBirth: Int?
	
	public let sexId: Int?
	public let name1: String?
	public let name2: String?
	public let name3: String?
	public let status: String?
	
	public let zvanieId: String?
	public let stepenId: String?
	public let diplomId: String?
	
	public let country: String?
	public let city: String?
	public let orgName: String?
	public let orgPost: String?
	
	public let mobilePhone: String?
	public let email: String?
	public let adminIs: Int?
	
	/// Персонализированная ссылка для оплаты членского взноса
	public let paymentUrl: String?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case rahrId = "rahr_id"
		case login
		case dateCreate = "dt_create"
		case dateUpdate = "dt_update"
		case dateExpire = "dt_expire"
		case dateBirth = "dt_birth"
		case sexId = "sex_id"
		case name1
		case name2
		case name3
		case status
		case zvanieId = "zvanie_id"
		case stepenId = "stepen_id"
		case diplomId = "diplom_id"
		case country
		case city
		case orgName = "org_name"
		case orgPost = "org_post"
		case mobilePhone = "mobile_phone"
		case email
		case adminIs = "admin_is"
		case paymentUrl = "payment_url"
	}
	
	public init(
		id: UUID? = nil,
		rahrId: Int? = nil,
		login: String? = nil,
		dateCreate: Int? = nil,
		dateUpdate: Int? = nil,
		dateExpire: Int? = nil,
		dateBirth: Int? = nil,
		sexId: Int? = nil,
		name1: String? = nil,
		name2: String? = nil,
		name3: String? = nil,
		status: String? = nil,
		zvanieId: String? = nil,
		stepenId: String? = nil,
		diplomId: String? = nil,
		country: String? = nil,
		city: String? = nil,
		orgName: String? = nil,
		orgPost: String? = nil,
		mobilePhone: String? = nil,
		email: String? = nil,
		adminIs: Int? = nil,
		paymentUrl: String? = nil
	) {
		self.id = id
		self.rahrId = rahrId
		self.login = login
		self.dateCreate = dateCreate
		self.dateUpdate = dateUpdate
		self.dateExpire = dateExpire
		self.dateBirth = dateBirth
		self.sexId = sexId
		self.name1 = name1
		self.name2 = name2
		self.name3 = name3
		self.status = status
		self.zvanieId = zvanieId
		self.stepenId = stepenId
		self.diplomId = diplomId
		self.country = country
		self.city = city
		self.orgName = orgName
		self.orgPost = orgPost
		self.mobilePhone = mobilePhone
		self.email = email
		self.adminIs = adminIs
		self.paymentUrl = paymentUrl
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.rahrId = try container.decodeIfPresent(Int.self, forKey: .rahrId)
		self.login = try container.decodeIfPresent(String.self, forKey: .login)
		self.dateCreate = try container.decodeIfPresent(Int.self, forKey: .dateCreate)
		self.dateUpdate = try container.decodeIfPresent(Int.self, forKey: .dateUpdate)
		self.dateExpire = try container.decodeIfPresent(Int.self, forKey: .dateExpire)
		self.dateBirth = try container.decodeIfPresent(Int.self, forKey: .dateBirth)
		self.sexId = try container.decodeIfPresent(Int.self, forKey: .sexId)
		self.name1 = try container.decodeIfPresent(String.self, forKey: .name1)
		self.name2 = try container.decodeIfPresent(String.self, forKey: .name2)
		self.name3 = try container.decodeIfPresent(String.self, forKey: .name3)
		self.status = try container.decodeIfPresent(String.self, forKey: .status)
		self.zvanieId = try container.decodeIfPresent(String.self, forKey: .zvanieId)
		self.stepenId = try container.decodeIfPresent(String.self, forKey: .stepenId)
		self.diplomId = try container.decodeIfPresent(String.self, forKey: .diplomId)
		self.country = try container.decodeIfPresent(String.self, forKey: .country)
		self.city = try container.decodeIfPresent(String.self, forKey: .city)
		self.orgName = try container.decodeIfPresent(String.self, forKey: .orgName)
		self.orgPost = try container.decodeIfPresent(String.self, forKey: .orgPost)
		self.mobilePhone = try container.decodeIfPresent(String.self, forKey: .mobilePhone)
		self.email = try container.decodeIfPresent(String.self, forKey: .email)
		self.adminIs = try container.decodeIfPresent(Int.self, forKey: .adminIs)
		self.paymentUrl = try container.decodeIfPresent(String.self, forKey: .paymentUrl)
	}
}

// MARK: - Convenience Extensions

public extension ProfileDTO {
	
	/// Получить полное имя (ФИО)
	var fullName: String? {
		let names = [name1, name2, name3].compactMap { $0?.trimmingCharacters(in: .whitespacesAndNewlines) }.filter { !$0.isEmpty }
		return names.isEmpty ? nil : names.joined(separator: " ")
	}
	
	/// Получить короткое имя (Фамилия И.О.)
	var shortName: String? {
		guard let lastName = name1?.trimmingCharacters(in: .whitespacesAndNewlines), !lastName.isEmpty else {
			return nil
		}
		
		var result = lastName
		
		if let firstName = name2?.trimmingCharacters(in: .whitespacesAndNewlines), !firstName.isEmpty {
			result += " \(firstName.prefix(1))."
		}
		
		if let patronymic = name3?.trimmingCharacters(in: .whitespacesAndNewlines), !patronymic.isEmpty {
			result += "\(patronymic.prefix(1))."
		}
		
		return result
	}
	
	/// Проверить, истек ли срок членства
	var isMembershipExpired: Bool {
		guard let expireDate = dateExpire else { return false }
		return expireDate < Int(Date().timeIntervalSince1970)
	}
	
	/// Получить отображаемое имя (полное имя или логин)
	var displayName: String {
		return fullName ?? login ?? "Unknown"
	}
	
	/// Получить пол как строку
	var sexString: String? {
		switch sexId {
		case 1: return "Женский"
		case 2: return "Мужской"
		default: return nil
		}
	}
	
	/// Проверить, является ли пользователь администратором
	var isAdmin: Bool {
		return adminIs == 1
	}
}
