//
//  CertificateDTO.swift
//  RahrDTOs
//
//  Created by Egor Ledkov on 16.07.2025.
//

import Foundation

/// Модель для передачи данных о сертификатах между приложениями и сервисами
public struct CertificateDTO: Codable, Sendable {
	public let id: UUID?
	public let dtCreate: Int?
	public let dtUpdate: Int?
	public let activeIs: Bool?
	public let fullname: String?
	public let imageUrl: String?
	public let fieldsConfiguration: String?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case dtCreate = "dt_create"
		case dtUpdate = "dt_update"
		case activeIs = "active_is"
		case fullname
		case imageUrl = "image_url"
		case fieldsConfiguration = "fields_configuration"
	}
	
	public init(
		id: UUID? = nil,
		dtCreate: Int? = nil,
		dtUpdate: Int? = nil,
		activeIs: Bool? = nil,
		fullname: String? = nil,
		imageUrl: String? = nil,
		fieldsConfiguration: String? = nil,
	) {
		self.id = id
		self.dtCreate = dtCreate
		self.dtUpdate = dtUpdate
		self.activeIs = activeIs
		self.fullname = fullname
		self.imageUrl = imageUrl
		self.fieldsConfiguration = fieldsConfiguration
	}
	
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.dtCreate = try container.decodeIfPresent(Int.self, forKey: .dtCreate)
		self.dtUpdate = try container.decodeIfPresent(Int.self, forKey: .dtUpdate)
		self.activeIs = try container.decodeIfPresent(Bool.self, forKey: .activeIs)
		self.fullname = try container.decodeIfPresent(String.self, forKey: .fullname)
		self.imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
		self.fieldsConfiguration = try container.decodeIfPresent(String.self, forKey: .fieldsConfiguration)
	}
}
