//
//  NewsDTO.swift
//  RahrDTOs
//
//  Created by Egor Ledkov on 25.04.2025.
//

import Foundation

/// Модель для передачи Новостей между приложениями и сервисами
public struct NewsDTO: Codable, Sendable {
	public let id: UUID?
	public let title: String?
	
	public let dateCreate: Int?
	public let dateUpdate: Int?
	public let datePublic: Int?
	public let dateReminder: Int?
	
	public let category: String?
	public let activeIs: Bool?
	
	public let shortText: String?
	public let textHtml: String?
	public let textMd: String?
	
	public let imageUrl: String?
	public let fileUrl: String?
	public let linkUrl: String?
	
	public let sendIs: Bool?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case title
		case dateCreate = "dt_create"
		case dateUpdate = "dt_update"
		case datePublic = "dt_public"
		case dateReminder = "dt_reminder"
		case category
		case activeIs = "active_is"
		case shortText = "short_text"
		case textHtml = "text_html"
		case textMd = "text_md"
		case imageUrl = "image_url"
		case fileUrl = "file_url"
		case linkUrl = "link_url"
		case sendIs = "send_is"
	}
	
	public init(
		id: UUID? = nil,
		title: String? = nil,
		dateCreate: Int? = nil,
		dateUpdate: Int? = nil,
		datePublic: Int? = nil,
		dateReminder: Int? = nil,
		category: String? = nil,
		activeIs: Bool? = nil,
		shortText: String? = nil,
		textHtml: String? = nil,
		textMd: String? = nil,
		imageUrl: String? = nil,
		fileUrl: String? = nil,
		linkUrl: String? = nil,
		sendIs: Bool? = nil
	) {
		self.id = id
		self.title = title
		self.dateCreate = dateCreate
		self.dateUpdate = dateUpdate
		self.datePublic = datePublic
		self.dateReminder = dateReminder
		self.category = category
		self.activeIs = activeIs
		self.shortText = shortText
		self.textHtml = textHtml
		self.textMd = textMd
		self.imageUrl = imageUrl
		self.fileUrl = fileUrl
		self.linkUrl = linkUrl
		self.sendIs = sendIs
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.title = try container.decodeIfPresent(String.self, forKey: .title)
		self.dateCreate = try container.decodeIfPresent(Int.self, forKey: .dateCreate)
		self.dateUpdate = try container.decodeIfPresent(Int.self, forKey: .dateUpdate)
		self.datePublic = try container.decodeIfPresent(Int.self, forKey: .datePublic)
		self.dateReminder = try container.decodeIfPresent(Int.self, forKey: .dateReminder)
		self.category = try container.decodeIfPresent(String.self, forKey: .category)
		self.activeIs = try container.decodeIfPresent(Bool.self, forKey: .activeIs)
		self.shortText = try container.decodeIfPresent(String.self, forKey: .shortText)
		self.textHtml = try container.decodeIfPresent(String.self, forKey: .textHtml)
		self.textMd = try container.decodeIfPresent(String.self, forKey: .textMd)
		self.imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
		self.fileUrl = try container.decodeIfPresent(String.self, forKey: .fileUrl)
		self.linkUrl = try container.decodeIfPresent(String.self, forKey: .linkUrl)
		self.sendIs = try container.decodeIfPresent(Bool.self, forKey: .sendIs)
	}
}
