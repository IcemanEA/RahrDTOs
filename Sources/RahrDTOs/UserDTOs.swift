//
//  UserDTOs.swift
//  RahrDTOs
//
//  Created by Egor Ledkov on 18.06.2025.
//

import Foundation

/// Модель для регистрации нового клиента в системе
public struct CreateUserRequestDTO: Codable, Sendable {
	public let os: String
	public let name: String
	public let password: String
}

/// Модель для ответа на регистрацию, cодержит id и токен для работы основного функционала
public struct CreateUserResponseDTO: Codable, Sendable {
	public let id: UUID
	public let name: String
	public let token: String
	
	public init(id: UUID, name: String, token: String) {
		self.id = id
		self.name = name
		self.token = token
	}
}

/// Модель для авторизации внутри мобильного приложения (для доступа к дополнительным функциям)
public struct LoginRequestDTO: Codable, Sendable {
	public let email: String
	public let password: String
	
	public init(email: String, password: String) {
		self.email = email
		self.password = password
	}
}

/// Модель для обновления токена уведомлений
public struct UpdateNotificationTokenDTO: Codable, Sendable {
	public let notificationToken: String
	
	public enum CodingKeys: String, CodingKey {
		case notificationToken = "noti_token"
	}
	
	public init(notificationToken: String) {
		self.notificationToken = notificationToken
	}
	
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.notificationToken = try container.decode(String.self, forKey: .notificationToken)
	}
}
