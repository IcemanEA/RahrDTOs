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
	public let rahrId: Int?
	public let shortname: String?
	public let fullname: String?
	public let maincity: String?
	public let dtBegin: Int?
	public let dtEnd: Int?
	public let dtTheses: Int?
	public let warningText: String?
	public let imageUrl: String?
	public let programPdf: String?
	public let dtProgramPdf: Int?
	public let priceUrl: String?
	public let placeUrl: String?
	public let hotelsUrl: String?
	public let videoUrl: String?
	public let photoUrl: String?
	public let reportUrl: String?
	public let scienceUrl: String?
	public let thesesUrl: String?
	public let charityUrl: String?
	public let dinnerUrl: String?
	public let onlineStreamUrl: String?
	public let registryUrl: String?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case dtCreate = "dt_create"
		case dtUpdate = "dt_update"
		case state
		case rahrId = "rahr_id"
		case shortname
		case fullname
		case maincity
		case dtBegin = "dt_begin"
		case dtEnd = "dt_end"
		case dtTheses = "dt_theses"
		case warningText = "warning_text"
		case imageUrl = "image_url"
		case programPdf = "program_pdf"
		case dtProgramPdf = "dt_program_pdf"
		case priceUrl = "price_url"
		case placeUrl = "place_url"
		case hotelsUrl = "hotels_url"
		case videoUrl = "video_url"
		case photoUrl = "photo_url"
		case reportUrl = "report_url"
		case scienceUrl = "science_url"
		case thesesUrl = "theses_url"
		case charityUrl = "charity_url"
		case dinnerUrl = "dinner_url"
		case onlineStreamUrl = "online_stream_url"
		case registryUrl = "registry_url"
	}
	
	public init(
		id: UUID? = nil,
		dtCreate: Int? = nil,
		dtUpdate: Int? = nil,
		state: String? = nil,
		rahrId: Int? = nil,
		shortname: String? = nil,
		fullname: String? = nil,
		maincity: String? = nil,
		dtBegin: Int? = nil,
		dtEnd: Int? = nil,
		dtTheses: Int? = nil,
		warningText: String? = nil,
		imageUrl: String? = nil,
		programPdf: String? = nil,
		dtProgramPdf: Int? = nil,
		priceUrl: String? = nil,
		placeUrl: String? = nil,
		hotelsUrl: String? = nil,
		videoUrl: String? = nil,
		photoUrl: String? = nil,
		reportUrl: String? = nil,
		scienceUrl: String? = nil,
		thesesUrl: String? = nil,
		charityUrl: String? = nil,
		dinnerUrl: String? = nil,
		onlineStreamUrl: String? = nil,
		registryUrl: String? = nil
	) {
		self.id = id
		self.dtCreate = dtCreate
		self.dtUpdate = dtUpdate
		self.state = state
		self.rahrId = rahrId
		self.shortname = shortname
		self.fullname = fullname
		self.maincity = maincity
		self.dtBegin = dtBegin
		self.dtEnd = dtEnd
		self.dtTheses = dtTheses
		self.warningText = warningText
		self.imageUrl = imageUrl
		self.programPdf = programPdf
		self.dtProgramPdf = dtProgramPdf
		self.priceUrl = priceUrl
		self.placeUrl = placeUrl
		self.hotelsUrl = hotelsUrl
		self.videoUrl = videoUrl
		self.photoUrl = photoUrl
		self.reportUrl = reportUrl
		self.scienceUrl = scienceUrl
		self.thesesUrl = thesesUrl
		self.charityUrl = charityUrl
		self.dinnerUrl = dinnerUrl
		self.onlineStreamUrl = onlineStreamUrl
		self.registryUrl = registryUrl
	}
	
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.dtCreate = try container.decodeIfPresent(Int.self, forKey: .dtCreate)
		self.dtUpdate = try container.decodeIfPresent(Int.self, forKey: .dtUpdate)
		self.state = try container.decodeIfPresent(String.self, forKey: .state)
		self.rahrId = try container.decodeIfPresent(Int.self, forKey: .rahrId)
		self.shortname = try container.decodeIfPresent(String.self, forKey: .shortname)
		self.fullname = try container.decodeIfPresent(String.self, forKey: .fullname)
		self.maincity = try container.decodeIfPresent(String.self, forKey: .maincity)
		self.dtBegin = try container.decodeIfPresent(Int.self, forKey: .dtBegin)
		self.dtEnd = try container.decodeIfPresent(Int.self, forKey: .dtEnd)
		self.dtTheses = try container.decodeIfPresent(Int.self, forKey: .dtTheses)
		self.warningText = try container.decodeIfPresent(String.self, forKey: .warningText)
		self.imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
		self.programPdf = try container.decodeIfPresent(String.self, forKey: .programPdf)
		self.dtProgramPdf = try container.decodeIfPresent(Int.self, forKey: .dtProgramPdf)
		self.priceUrl = try container.decodeIfPresent(String.self, forKey: .priceUrl)
		self.placeUrl = try container.decodeIfPresent(String.self, forKey: .placeUrl)
		self.hotelsUrl = try container.decodeIfPresent(String.self, forKey: .hotelsUrl)
		self.videoUrl = try container.decodeIfPresent(String.self, forKey: .videoUrl)
		self.photoUrl = try container.decodeIfPresent(String.self, forKey: .photoUrl)
		self.reportUrl = try container.decodeIfPresent(String.self, forKey: .reportUrl)
		self.scienceUrl = try container.decodeIfPresent(String.self, forKey: .scienceUrl)
		self.thesesUrl = try container.decodeIfPresent(String.self, forKey: .thesesUrl)
		self.charityUrl = try container.decodeIfPresent(String.self, forKey: .charityUrl)
		self.dinnerUrl = try container.decodeIfPresent(String.self, forKey: .dinnerUrl)
		self.onlineStreamUrl = try container.decodeIfPresent(String.self, forKey: .onlineStreamUrl)
		self.registryUrl = try container.decodeIfPresent(String.self, forKey: .registryUrl)
	}
}
