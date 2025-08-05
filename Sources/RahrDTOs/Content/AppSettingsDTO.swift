//
//  AppSettingsDTO.swift
//  RahrDTOs
//
//  Created by Egor Ledkov on 05.08.2025.
//

import Foundation

/// Модель настроек приложения для передачи между клиентом и сервером
public struct AppSettingsDTO: Codable, Sendable {
	public let id: UUID?
	
	public let dateCreate: Int?
	public let dateUpdate: Int?
	
	public let currentVersion: String?
	public let minSupportedVersion: String?
	public let membershipPaymentUrl: String?
	public let forceUpdate: Bool?
	public let maintenanceMode: Bool?
	public let activeIs: Bool?
	
	public enum CodingKeys: String, CodingKey {
		case id
		case dateCreate = "dt_create"
		case dateUpdate = "dt_update"
		case currentVersion = "current_version"
		case minSupportedVersion = "min_supported_version"
		case membershipPaymentUrl = "membership_payment_url"
		case forceUpdate = "force_update"
		case maintenanceMode = "maintenance_mode"
		case activeIs = "active_is"
	}
	
	public init(
		id: UUID? = nil,
		dateCreate: Int? = nil,
		dateUpdate: Int? = nil,
		currentVersion: String? = nil,
		minSupportedVersion: String? = nil,
		membershipPaymentUrl: String? = nil,
		forceUpdate: Bool? = nil,
		maintenanceMode: Bool? = nil,
		activeIs: Bool? = nil
	) {
		self.id = id
		self.dateCreate = dateCreate
		self.dateUpdate = dateUpdate
		self.currentVersion = currentVersion
		self.minSupportedVersion = minSupportedVersion
		self.membershipPaymentUrl = membershipPaymentUrl
		self.forceUpdate = forceUpdate
		self.maintenanceMode = maintenanceMode
		self.activeIs = activeIs
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
		self.dateCreate = try container.decodeIfPresent(Int.self, forKey: .dateCreate)
		self.dateUpdate = try container.decodeIfPresent(Int.self, forKey: .dateUpdate)
		self.currentVersion = try container.decodeIfPresent(String.self, forKey: .currentVersion)
		self.minSupportedVersion = try container.decodeIfPresent(String.self, forKey: .minSupportedVersion)
		self.membershipPaymentUrl = try container.decodeIfPresent(String.self, forKey: .membershipPaymentUrl)
		self.forceUpdate = try container.decodeIfPresent(Bool.self, forKey: .forceUpdate)
		self.maintenanceMode = try container.decodeIfPresent(Bool.self, forKey: .maintenanceMode)
		self.activeIs = try container.decodeIfPresent(Bool.self, forKey: .activeIs)
	}
}
