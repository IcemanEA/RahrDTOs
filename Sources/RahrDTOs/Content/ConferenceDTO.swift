//
//  ConferenceDTO.swift
//  RahrDTOs
//
//  Created by Egor Ledkov on 09.07.2025.
//

import Foundation

/// Модель для передачи данных о конференциях между приложениями и сервисами
public struct ConferenceDTO: Codable, Sendable {
	public let id: UUID?
	public let dtCreate: Int?
	public let dtUpdate: Int?
	public let state: String?
	public let shortname: String?
	public let fullname: String?
	public let maincity: String?
	public let dtBegin: Int?
	public let dtEnd: Int?
	public let imageUrl: String?
	public let programPdf: String?
	public let seminarPdf: String?
	public let priceUrl: String?
	public let placeUrl: String?
	public let hotelsUrl: String?
	public let videoUrl: String?
	public let photoUrl: String?
	public let reportUrl: String?
	public let scienceUrl: String?
	public let thesesUrl: String?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case dtCreate = "dt_create"
		case dtUpdate = "dt_update"
		case state
		case shortname
		case fullname
		case maincity
		case dtBegin = "dt_begin"
		case dtEnd = "dt_end"
		case imageUrl = "image_url"
		case programPdf = "program_pdf"
		case seminarPdf = "seminar_pdf"
		case priceUrl = "price_url"
		case placeUrl = "place_url"
		case hotelsUrl = "hotels_url"
		case videoUrl = "video_url"
		case photoUrl = "photo_url"
		case reportUrl = "report_url"
		case scienceUrl = "science_url"
		case thesesUrl = "theses_url"
	}
	
	public init(
		id: UUID? = nil,
		dtCreate: Int? = nil,
		dtUpdate: Int? = nil,
		state: String? = nil,
		shortname: String? = nil,
		fullname: String? = nil,
		maincity: String? = nil,
		dtBegin: Int? = nil,
		dtEnd: Int? = nil,
		imageUrl: String? = nil,
		programPdf: String? = nil,
		seminarPdf: String? = nil,
		priceUrl: String? = nil,
		placeUrl: String? = nil,
		hotelsUrl: String? = nil,
		videoUrl: String? = nil,
		photoUrl: String? = nil,
		reportUrl: String? = nil,
		scienceUrl: String? = nil,
		thesesUrl: String? = nil
	) {
		self.id = id
		self.dtCreate = dtCreate
		self.dtUpdate = dtUpdate
		self.state = state
		self.shortname = shortname
		self.fullname = fullname
		self.maincity = maincity
		self.dtBegin = dtBegin
		self.dtEnd = dtEnd
		self.imageUrl = imageUrl
		self.programPdf = programPdf
		self.seminarPdf = seminarPdf
		self.priceUrl = priceUrl
		self.placeUrl = placeUrl
		self.hotelsUrl = hotelsUrl
		self.videoUrl = videoUrl
		self.photoUrl = photoUrl
		self.reportUrl = reportUrl
		self.scienceUrl = scienceUrl
		self.thesesUrl = thesesUrl
	}
	
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.dtCreate = try container.decodeIfPresent(Int.self, forKey: .dtCreate)
		self.dtUpdate = try container.decodeIfPresent(Int.self, forKey: .dtUpdate)
		self.state = try container.decodeIfPresent(String.self, forKey: .state)
		self.shortname = try container.decodeIfPresent(String.self, forKey: .shortname)
		self.fullname = try container.decodeIfPresent(String.self, forKey: .fullname)
		self.maincity = try container.decodeIfPresent(String.self, forKey: .maincity)
		self.dtBegin = try container.decodeIfPresent(Int.self, forKey: .dtBegin)
		self.dtEnd = try container.decodeIfPresent(Int.self, forKey: .dtEnd)
		self.imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
		self.programPdf = try container.decodeIfPresent(String.self, forKey: .programPdf)
		self.seminarPdf = try container.decodeIfPresent(String.self, forKey: .seminarPdf)
		self.priceUrl = try container.decodeIfPresent(String.self, forKey: .priceUrl)
		self.placeUrl = try container.decodeIfPresent(String.self, forKey: .placeUrl)
		self.hotelsUrl = try container.decodeIfPresent(String.self, forKey: .hotelsUrl)
		self.videoUrl = try container.decodeIfPresent(String.self, forKey: .videoUrl)
		self.photoUrl = try container.decodeIfPresent(String.self, forKey: .photoUrl)
		self.reportUrl = try container.decodeIfPresent(String.self, forKey: .reportUrl)
		self.scienceUrl = try container.decodeIfPresent(String.self, forKey: .scienceUrl)
		self.thesesUrl = try container.decodeIfPresent(String.self, forKey: .thesesUrl)
	}
}

// MARK: - Convenience Extensions

public extension ConferenceDTO {
	
	/// Проверить, является ли конференция активной
	var isActive: Bool {
		state == "active"
	}
	
	/// Проверить, завершена ли конференция
	var isComplete: Bool {
		state == "complete"
	}
	
	/// Проверить, запланирована ли конференция
	var isPlanned: Bool {
		state == "planned"
	}
	
	/// Проверить, есть ли даты проведения
	var hasDates: Bool {
		dtBegin != nil && dtEnd != nil
	}
	
	/// Получить продолжительность конференции в днях
	var durationDays: Int? {
		guard let begin = dtBegin, let end = dtEnd else { return nil }
		return max(1, Int(end - begin) + 1)
	}
	
	/// Получить основную информацию о конференции
	var displayName: String {
		return shortname ?? fullname ?? "Unknown Conference"
	}
	
	/// Получить полное название с городом
	var fullDisplayName: String {
		let name = fullname ?? shortname ?? "Unknown Conference"
		if let city = maincity {
			return "\(name) - \(city)"
		}
		return name
	}
}
