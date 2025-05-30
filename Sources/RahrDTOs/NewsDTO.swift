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
	public let datePublic: Int?
	
	public let textHtml: String?
	public let imageUrl: String?
	public let fileUrl: String?
	public let linkUrl: String?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case title
		case dateCreate = "dt_create"
		case datePublic = "dt_public"
		case textHtml = "text_html"
		case imageUrl = "image_url"
		case fileUrl = "file_url"
		case linkUrl = "link_url"
	}
	
	public init(
		id: UUID?,
		title: String? = nil,
		dateCreate: Int? = nil,
		datePublic: Int? = nil,
		textHtml: String? = nil,
		imageUrl: String? = nil,
		fileUrl: String? = nil,
		linkUrl: String? = nil
	) {
		self.id = id
		self.title = title
		self.dateCreate = dateCreate
		self.datePublic = datePublic
		self.textHtml = textHtml
		self.imageUrl = imageUrl
		self.fileUrl = fileUrl
		self.linkUrl = linkUrl
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.title = try container.decodeIfPresent(String.self, forKey: .title)
		self.dateCreate = try container.decodeIfPresent(Int.self, forKey: .dateCreate)
		self.datePublic = try container.decodeIfPresent(Int.self, forKey: .datePublic)
		self.textHtml = try container.decodeIfPresent(String.self, forKey: .textHtml)
		self.imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
		self.fileUrl = try container.decodeIfPresent(String.self, forKey: .fileUrl)
		self.linkUrl = try container.decodeIfPresent(String.self, forKey: .linkUrl)
	}
}
