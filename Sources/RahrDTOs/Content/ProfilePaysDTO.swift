//
//  ProfilePaysDTO.swift
//  RahrDTOs
//
//  Created by System on 18.07.2025.
//

import Foundation

/// Модель для передачи данных о платежах членов РАРЧ между приложениями и сервисами
public struct ProfilePaysDTO: Codable, Sendable {
	public let id: UUID?
	public let memberId: UUID?
	public let dtPay: Int?
	public let yearPay: Int?
	public let typePayId: Int?
	public let sumPay: Double?
	public let rahrRegionId: Int?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case memberId = "member_id"
		case dtPay = "dt_pay"
		case yearPay = "year_pay"
		case typePayId = "type_pay_id"
		case sumPay = "sum_pay"
		case rahrRegionId = "rahr_region_id"
	}
	
	public init(
		id: UUID? = nil,
		memberId: UUID? = nil,
		dtPay: Int? = nil,
		yearPay: Int? = nil,
		typePayId: Int? = nil,
		sumPay: Double? = nil,
		rahrRegionId: Int? = nil
	) {
		self.id = id
		self.memberId = memberId
		self.dtPay = dtPay
		self.yearPay = yearPay
		self.typePayId = typePayId
		self.sumPay = sumPay
		self.rahrRegionId = rahrRegionId
	}
	
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.memberId = try container.decodeIfPresent(UUID.self, forKey: .memberId)
		self.dtPay = try container.decodeIfPresent(Int.self, forKey: .dtPay)
		self.yearPay = try container.decodeIfPresent(Int.self, forKey: .yearPay)
		self.typePayId = try container.decodeIfPresent(Int.self, forKey: .typePayId)
		self.sumPay = try container.decodeIfPresent(Double.self, forKey: .sumPay)
		self.rahrRegionId = try container.decodeIfPresent(Int.self, forKey: .rahrRegionId)
	}
}
