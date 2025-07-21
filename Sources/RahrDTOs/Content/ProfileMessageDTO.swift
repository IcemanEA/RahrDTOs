//
//  ProfileMessageDTO.swift
//  RahrDTOs
//
//  Created by System on 21.07.2025.
//

import Foundation

/// Модель для передачи данных о сообщениях в службу поддержки между приложениями и сервисами
public struct ProfileMessageDTO: Codable, Sendable {
	public let id: UUID?
	public let profileId: UUID?
	public let adminId: UUID?
	public let dtCreate: Int?
	public let dtRead: Int?
	public let messageText: String?
	public let documentUrl: String?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case profileId = "profile_id"
		case adminId = "admin_id"
		case dtCreate = "dt_create"
		case dtRead = "dt_read"
		case messageText = "message_text"
		case documentUrl = "document_url"
	}
	
	public init(
		id: UUID? = nil,
		profileId: UUID? = nil,
		adminId: UUID? = nil,
		dtCreate: Int? = nil,
		dtRead: Int? = nil,
		messageText: String? = nil,
		documentUrl: String? = nil
	) {
		self.id = id
		self.profileId = profileId
		self.adminId = adminId
		self.dtCreate = dtCreate
		self.dtRead = dtRead
		self.messageText = messageText
		self.documentUrl = documentUrl
	}
	
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.profileId = try container.decodeIfPresent(UUID.self, forKey: .profileId)
		self.adminId = try container.decodeIfPresent(UUID.self, forKey: .adminId)
		self.dtCreate = try container.decodeIfPresent(Int.self, forKey: .dtCreate)
		self.dtRead = try container.decodeIfPresent(Int.self, forKey: .dtRead)
		self.messageText = try container.decodeIfPresent(String.self, forKey: .messageText)
		self.documentUrl = try container.decodeIfPresent(String.self, forKey: .documentUrl)
	}
}
