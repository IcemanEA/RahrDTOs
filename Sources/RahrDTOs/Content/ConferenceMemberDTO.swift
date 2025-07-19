//
//  ConferenceMemberDTO.swift
//  RahrDTOs
//
//  Created by Egor Ledkov on 19.07.2025.
//

import Foundation

/// Модель для передачи данных об участниках семинаров между приложениями и сервисами
public struct ConferenceMemberDTO: Codable, Sendable {
	public let id: UUID?
	public let itemId: UUID?
	public let profileId: UUID?
	public let rahrId: Int?
	public let dtReg: Int?
	public let speakerIs: Bool?
	public let yongIs: Bool?
	public let registrationIs: Bool?
	public let typePayId: String?
	public let payFirmId: Int?
	public let payClinicId: Int?
	public let payInfo: String?
	public let payNowIs: Bool?
	public let workerIs: Bool?
	public let payMinIs: Bool?
	public let payDopIs: Bool?
	public let payIs: Bool?
	public let dtPay: Int?
	public let sumPay: Double?
	public let checkinIs: Bool?
	public let notes: String?
	public let accountIs: Bool?
	public let dtRegPlace: Int?
	public let dtBag: Int?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case itemId = "item_id"
		case profileId = "profile_id"
		case rahrId = "rahr_id"
		case dtReg = "dt_reg"
		case speakerIs = "speaker_is"
		case yongIs = "yong_is"
		case registrationIs = "registration_is"
		case typePayId = "type_pay_id"
		case payFirmId = "pay_firm_id"
		case payClinicId = "pay_clinic_id"
		case payInfo = "pay_info"
		case payNowIs = "pay_now_is"
		case workerIs = "worker_is"
		case payMinIs = "pay_min_is"
		case payDopIs = "pay_dop_is"
		case payIs = "pay_is"
		case dtPay = "dt_pay"
		case sumPay = "sum_pay"
		case checkinIs = "checkin_is"
		case notes
		case accountIs = "account_is"
		case dtRegPlace = "dt_reg_place"
		case dtBag = "dt_bag"
	}
	
	public init(
		id: UUID? = nil,
		itemId: UUID? = nil,
		profileId: UUID? = nil,
		rahrId: Int? = nil,
		dtReg: Int? = nil,
		speakerIs: Bool? = nil,
		yongIs: Bool? = nil,
		registrationIs: Bool? = nil,
		typePayId: String? = nil,
		payFirmId: Int? = nil,
		payClinicId: Int? = nil,
		payInfo: String? = nil,
		payNowIs: Bool? = nil,
		workerIs: Bool? = nil,
		payMinIs: Bool? = nil,
		payDopIs: Bool? = nil,
		payIs: Bool? = nil,
		dtPay: Int? = nil,
		sumPay: Double? = nil,
		checkinIs: Bool? = nil,
		notes: String? = nil,
		accountIs: Bool? = nil,
		dtRegPlace: Int? = nil,
		dtBag: Int? = nil
	) {
		self.id = id
		self.itemId = itemId
		self.profileId = profileId
		self.rahrId = rahrId
		self.dtReg = dtReg
		self.speakerIs = speakerIs
		self.yongIs = yongIs
		self.registrationIs = registrationIs
		self.typePayId = typePayId
		self.payFirmId = payFirmId
		self.payClinicId = payClinicId
		self.payInfo = payInfo
		self.payNowIs = payNowIs
		self.workerIs = workerIs
		self.payMinIs = payMinIs
		self.payDopIs = payDopIs
		self.payIs = payIs
		self.dtPay = dtPay
		self.sumPay = sumPay
		self.checkinIs = checkinIs
		self.notes = notes
		self.accountIs = accountIs
		self.dtRegPlace = dtRegPlace
		self.dtBag = dtBag
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.itemId = try container.decodeIfPresent(UUID.self, forKey: .itemId)
		self.profileId = try container.decodeIfPresent(UUID.self, forKey: .profileId)
		self.rahrId = try container.decodeIfPresent(Int.self, forKey: .rahrId)
		self.dtReg = try container.decodeIfPresent(Int.self, forKey: .dtReg)
		self.speakerIs = try container.decodeIfPresent(Bool.self, forKey: .speakerIs)
		self.yongIs = try container.decodeIfPresent(Bool.self, forKey: .yongIs)
		self.registrationIs = try container.decodeIfPresent(Bool.self, forKey: .registrationIs)
		self.typePayId = try container.decodeIfPresent(String.self, forKey: .typePayId)
		self.payFirmId = try container.decodeIfPresent(Int.self, forKey: .payFirmId)
		self.payClinicId = try container.decodeIfPresent(Int.self, forKey: .payClinicId)
		self.payInfo = try container.decodeIfPresent(String.self, forKey: .payInfo)
		self.payNowIs = try container.decodeIfPresent(Bool.self, forKey: .payNowIs)
		self.workerIs = try container.decodeIfPresent(Bool.self, forKey: .workerIs)
		self.payMinIs = try container.decodeIfPresent(Bool.self, forKey: .payMinIs)
		self.payDopIs = try container.decodeIfPresent(Bool.self, forKey: .payDopIs)
		self.payIs = try container.decodeIfPresent(Bool.self, forKey: .payIs)
		self.dtPay = try container.decodeIfPresent(Int.self, forKey: .dtPay)
		self.sumPay = try container.decodeIfPresent(Double.self, forKey: .sumPay)
		self.checkinIs = try container.decodeIfPresent(Bool.self, forKey: .checkinIs)
		self.notes = try container.decodeIfPresent(String.self, forKey: .notes)
		self.accountIs = try container.decodeIfPresent(Bool.self, forKey: .accountIs)
		self.dtRegPlace = try container.decodeIfPresent(Int.self, forKey: .dtRegPlace)
		self.dtBag = try container.decodeIfPresent(Int.self, forKey: .dtBag)
	}
}
