//
//  ConferenceItemDTO.swift
//  RahrDTOs
//
//  Created by Egor Ledkov on 19.07.2025.
//

import Foundation

/// Модель для передачи данных о семинарах конференций между приложениями и сервисами
public struct ConferenceItemDTO: Codable, Sendable {
	public let id: UUID?
	public let conferenceId: UUID?
	public let sortId: Int?
	public let typeItemId: String?
	public let shortname: String?
	public let fullname: String?
	public let engname: String?
	public let bagename: String?
	public let invoicename: String?
	public let dtBegin: Int?
	public let duration: Int?
	public let nmoname: String?
	public let nmocount: Int?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case conferenceId = "conference_id"
		case sortId = "sort_id"
		case typeItemId = "type_item_id"
		case shortname
		case fullname
		case engname
		case bagename
		case invoicename
		case dtBegin = "dt_begin"
		case duration
		case nmoname
		case nmocount
	}
	
	public init(
		id: UUID? = nil,
		conferenceId: UUID? = nil,
		sortId: Int? = nil,
		typeItemId: String? = nil,
		shortname: String? = nil,
		fullname: String? = nil,
		engname: String? = nil,
		bagename: String? = nil,
		invoicename: String? = nil,
		dtBegin: Int? = nil,
		duration: Int? = nil,
		nmoname: String? = nil,
		nmocount: Int? = nil
	) {
		self.id = id
		self.conferenceId = conferenceId
		self.sortId = sortId
		self.typeItemId = typeItemId
		self.shortname = shortname
		self.fullname = fullname
		self.engname = engname
		self.bagename = bagename
		self.invoicename = invoicename
		self.dtBegin = dtBegin
		self.duration = duration
		self.nmoname = nmoname
		self.nmocount = nmocount
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.conferenceId = try container.decodeIfPresent(UUID.self, forKey: .conferenceId)
		self.sortId = try container.decodeIfPresent(Int.self, forKey: .sortId)
		self.typeItemId = try container.decodeIfPresent(String.self, forKey: .typeItemId)
		self.shortname = try container.decodeIfPresent(String.self, forKey: .shortname)
		self.fullname = try container.decodeIfPresent(String.self, forKey: .fullname)
		self.engname = try container.decodeIfPresent(String.self, forKey: .engname)
		self.bagename = try container.decodeIfPresent(String.self, forKey: .bagename)
		self.invoicename = try container.decodeIfPresent(String.self, forKey: .invoicename)
		self.dtBegin = try container.decodeIfPresent(Int.self, forKey: .dtBegin)
		self.duration = try container.decodeIfPresent(Int.self, forKey: .duration)
		self.nmoname = try container.decodeIfPresent(String.self, forKey: .nmoname)
		self.nmocount = try container.decodeIfPresent(Int.self, forKey: .nmocount)
	}
}
