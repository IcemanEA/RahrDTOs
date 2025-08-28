//
//  ConferenceProgramDTO.swift
//  RahrDTOs
//
//  Created by Egor Ledkov on 22.08.2025.
//

import Foundation

/// Модель для передачи данных о программе конференции между приложениями и сервисами
public struct ConferenceProgramDTO: Codable, Sendable {
	public let id: UUID?
	public let itemId: UUID?
	public let dtBegin: Int?
	public let dayNumber: Int?
	public let sessions: [ConferenceSessionDTO]?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case itemId = "item_id"
		case dtBegin = "dt_begin"
		case dayNumber = "day_number"
		case sessions
	}
	
	public init(
		id: UUID? = nil,
		itemId: UUID? = nil,
		dtBegin: Int? = nil,
		dayNumber: Int? = nil,
		sessions: [ConferenceSessionDTO]? = nil
	) {
		self.id = id
		self.itemId = itemId
		self.dtBegin = dtBegin
		self.dayNumber = dayNumber
		self.sessions = sessions
	}
	
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.itemId = try container.decodeIfPresent(UUID.self, forKey: .itemId)
		self.dtBegin = try container.decodeIfPresent(Int.self, forKey: .dtBegin)
		self.dayNumber = try container.decodeIfPresent(Int.self, forKey: .dayNumber)
		self.sessions = try container.decodeIfPresent([ConferenceSessionDTO].self, forKey: .sessions)
	}
}

/// Модель для передачи данных о сессии конференции
public struct ConferenceSessionDTO: Codable, Sendable {
	public let id: UUID?
	public let title: String?
	public let sessionType: String?
	public let hall: ConferenceHallDTO?
	public let startTime: Int?
	public let endTime: Int?
	public let presentations: [ConferencePresentationDTO]?
	public let description: String?
	public let moderators: [ConferenceSpeakerDTO]?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case title
		case sessionType = "session_type"
		case hall
		case startTime = "start_time"
		case endTime = "end_time"
		case presentations
		case description
		case moderators
	}
	
	public init(
		id: UUID? = nil,
		title: String? = nil,
		sessionType: String? = nil,
		hall: ConferenceHallDTO? = nil,
		startTime: Int? = nil,
		endTime: Int? = nil,
		presentations: [ConferencePresentationDTO]? = nil,
		description: String? = nil,
		moderators: [ConferenceSpeakerDTO]? = nil
	) {
		self.id = id
		self.title = title
		self.sessionType = sessionType
		self.hall = hall
		self.startTime = startTime
		self.endTime = endTime
		self.presentations = presentations
		self.description = description
		self.moderators = moderators
	}
	
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.title = try container.decodeIfPresent(String.self, forKey: .title)
		self.sessionType = try container.decodeIfPresent(String.self, forKey: .sessionType)
		self.hall = try container.decodeIfPresent(ConferenceHallDTO.self, forKey: .hall)
		self.startTime = try container.decodeIfPresent(Int.self, forKey: .startTime)
		self.endTime = try container.decodeIfPresent(Int.self, forKey: .endTime)
		self.presentations = try container.decodeIfPresent([ConferencePresentationDTO].self, forKey: .presentations)
		self.description = try container.decodeIfPresent(String.self, forKey: .description)
		self.moderators = try container.decodeIfPresent([ConferenceSpeakerDTO].self, forKey: .moderators)
	}
}

/// Модель для передачи данных о презентации в сессии
public struct ConferencePresentationDTO: Codable, Sendable {
	public let id: UUID?
	public let title: String?
	public let speakers: [ConferenceSpeakerDTO]?
	public let startTime: Int?
	public let endTime: Int?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case title
		case speakers
		case startTime = "start_time"
		case endTime = "end_time"
	}
	
	public init(
		id: UUID? = nil,
		title: String? = nil,
		speakers: [ConferenceSpeakerDTO]? = nil,
		startTime: Int? = nil,
		endTime: Int? = nil
	) {
		self.id = id
		self.title = title
		self.speakers = speakers
		self.startTime = startTime
		self.endTime = endTime
	}
	
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.title = try container.decodeIfPresent(String.self, forKey: .title)
		self.speakers = try container.decodeIfPresent([ConferenceSpeakerDTO].self, forKey: .speakers)
		self.startTime = try container.decodeIfPresent(Int.self, forKey: .startTime)
		self.endTime = try container.decodeIfPresent(Int.self, forKey: .endTime)
	}
}

/// Модель для передачи данных о спикере конференции
public struct ConferenceSpeakerDTO: Codable, Sendable {
	public let id: UUID?
	public let name: String?
	public let organization: String?
	public let position: String?
	public let degree: String?
	public let company: String?
	public let city: String?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case name
		case organization
		case position
		case degree
		case company
		case city
	}
	
	public init(
		id: UUID? = nil,
		name: String? = nil,
		organization: String? = nil,
		position: String? = nil,
		degree: String? = nil,
		company: String? = nil,
		city: String? = nil,
	) {
		self.id = id
		self.name = name
		self.organization = organization
		self.position = position
		self.degree = degree
		self.company = company
		self.city = city
	}
	
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.name = try container.decodeIfPresent(String.self, forKey: .name)
		self.organization = try container.decodeIfPresent(String.self, forKey: .organization)
		self.position = try container.decodeIfPresent(String.self, forKey: .position)
		self.degree = try container.decodeIfPresent(String.self, forKey: .degree)
		self.company = try container.decodeIfPresent(String.self, forKey: .company)
		self.city = try container.decodeIfPresent(String.self, forKey: .city)
	}
}

/// Модель для передачи данных о зале конференции
public struct ConferenceHallDTO: Codable, Sendable {
	public let id: UUID?
	public let roomName: String?
	public let roomColor: String?
	public let sortOrder: Int?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case roomName = "room_name"
		case roomColor = "room_color"
		case sortOrder = "sort_order"
	}
	
	public init(
		id: UUID? = nil,
		roomName: String? = nil,
		roomColor: String? = nil,
		sortOrder: Int? = nil
	) {
		self.id = id
		self.roomName = roomName
		self.roomColor = roomColor
		self.sortOrder = sortOrder
	}
	
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.roomName = try container.decodeIfPresent(String.self, forKey: .roomName)
		self.roomColor = try container.decodeIfPresent(String.self, forKey: .roomColor)
		self.sortOrder = try container.decodeIfPresent(Int.self, forKey: .sortOrder)
	}
}
