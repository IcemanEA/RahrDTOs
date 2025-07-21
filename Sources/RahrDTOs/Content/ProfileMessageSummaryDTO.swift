//
//  ProfileMessageSummaryDTO.swift
//  RahrDTOs
//
//  Created by System on 21.07.2025.
//

import Foundation

/// Модель для передачи сводной информации о сообщениях пользователя в службе поддержки (для администраторов)
public struct ProfileMessageSummaryDTO: Codable, Sendable {
	public let profileId: UUID
	public let profileName: String?
	public let profileLogin: String?
	public let profileEmail: String?
	public let unreadCount: Int
	public let lastMessageId: UUID?
	public let lastMessageText: String?
	public let lastMessageDate: Int?
	public let lastMessageFromAdmin: Bool
	
	public enum CodingKeys: String, CodingKey {
		case profileId = "profile_id"
		case profileName = "profile_name"
		case profileLogin = "profile_login"
		case profileEmail = "profile_email"
		case unreadCount = "unread_count"
		case lastMessageId = "last_message_id"
		case lastMessageText = "last_message_text"
		case lastMessageDate = "last_message_date"
		case lastMessageFromAdmin = "last_message_from_admin"
	}
	
	public init(
		profileId: UUID,
		profileName: String? = nil,
		profileLogin: String? = nil,
		profileEmail: String? = nil,
		unreadCount: Int,
		lastMessageId: UUID? = nil,
		lastMessageText: String? = nil,
		lastMessageDate: Int? = nil,
		lastMessageFromAdmin: Bool = false
	) {
		self.profileId = profileId
		self.profileName = profileName
		self.profileLogin = profileLogin
		self.profileEmail = profileEmail
		self.unreadCount = unreadCount
		self.lastMessageId = lastMessageId
		self.lastMessageText = lastMessageText
		self.lastMessageDate = lastMessageDate
		self.lastMessageFromAdmin = lastMessageFromAdmin
	}
	
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.profileId = try container.decode(UUID.self, forKey: .profileId)
		self.profileName = try container.decodeIfPresent(String.self, forKey: .profileName)
		self.profileLogin = try container.decodeIfPresent(String.self, forKey: .profileLogin)
		self.profileEmail = try container.decodeIfPresent(String.self, forKey: .profileEmail)
		self.unreadCount = try container.decode(Int.self, forKey: .unreadCount)
		self.lastMessageId = try container.decodeIfPresent(UUID.self, forKey: .lastMessageId)
		self.lastMessageText = try container.decodeIfPresent(String.self, forKey: .lastMessageText)
		self.lastMessageDate = try container.decodeIfPresent(Int.self, forKey: .lastMessageDate)
		self.lastMessageFromAdmin = try container.decodeIfPresent(Bool.self, forKey: .lastMessageFromAdmin) ?? false
	}
}
