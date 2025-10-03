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
	public let rahrId: Int?
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
	public let recordsTitle: String?
	public let recordsUrl: String?
	public let recordsCode: String?
	public let seminarProgUrl: String?
	public let roomName: String?
	public let roomColor: String?
	public let dtSeminarProg: Int?
	public let dtUpdate: Int?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case conferenceId = "conference_id"
		case rahrId = "rahr_id"
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
		case recordsTitle = "records_title"
		case recordsUrl = "records_url"
		case recordsCode = "records_code"
		case seminarProgUrl = "seminar_prog_url"
		case roomName = "room_name"
		case roomColor = "room_color"
		case dtSeminarProg = "dt_seminar_prog"
		case dtUpdate = "dt_update"
	}
	
	public init(
		id: UUID? = nil,
		conferenceId: UUID? = nil,
		rahrId: Int? = nil,
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
		nmocount: Int? = nil,
		recordsTitle: String? = nil,
		recordsUrl: String? = nil,
		recordsCode: String? = nil,
		seminarProgUrl: String? = nil,
		roomName: String? = nil,
		roomColor: String? = nil,
		dtSeminarProg: Int? = nil,
		dtUpdate: Int? = nil
	) {
		self.id = id
		self.conferenceId = conferenceId
		self.rahrId = rahrId
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
		self.recordsTitle = recordsTitle
		self.recordsUrl = recordsUrl
		self.recordsCode = recordsCode
		self.seminarProgUrl = seminarProgUrl
		self.roomName = roomName
		self.roomColor = roomColor
		self.dtSeminarProg = dtSeminarProg
		self.dtUpdate = dtUpdate
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.conferenceId = try container.decodeIfPresent(UUID.self, forKey: .conferenceId)
		self.rahrId = try container.decodeIfPresent(Int.self, forKey: .rahrId)
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
		self.recordsTitle = try container.decodeIfPresent(String.self, forKey: .recordsTitle)
		self.recordsUrl = try container.decodeIfPresent(String.self, forKey: .recordsUrl)
		self.recordsCode = try container.decodeIfPresent(String.self, forKey: .recordsCode)
		self.seminarProgUrl = try container.decodeIfPresent(String.self, forKey: .seminarProgUrl)
		self.roomName = try container.decodeIfPresent(String.self, forKey: .roomName)
		self.roomColor = try container.decodeIfPresent(String.self, forKey: .roomColor)
		self.dtSeminarProg = try container.decodeIfPresent(Int.self, forKey: .dtSeminarProg)
		self.dtUpdate = try container.decodeIfPresent(Int.self, forKey: .dtUpdate)
	}
}
