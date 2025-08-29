//
//  HealthDTOs.swift
//  RahrDTOs
//
//  Created for health monitoring endpoints
//

import Foundation

/// Базовый статус здоровья сервера
public struct HealthStatusDTO: Codable, Sendable {
	/// Общий статус сервера (healthy/degraded/unhealthy)
	public let status: String
	
	/// Unix timestamp текущего времени
	public let timestamp: Int
	
	/// Время работы сервера в секундах
	public let uptime: Int
	
	/// Версия API сервера
	public let version: String
	
	/// Окружение (production/staging/development)
	public let environment: String
	
	public init(
		status: String,
		timestamp: Int,
		uptime: Int,
		version: String,
		environment: String
	) {
		self.status = status
		self.timestamp = timestamp
		self.uptime = uptime
		self.version = version
		self.environment = environment
	}
}

/// Детальный статус здоровья с информацией о компонентах
public struct DetailedHealthDTO: Codable, Sendable {
	/// Общий статус сервера (healthy/degraded/unhealthy)
	public let status: String
	
	/// Unix timestamp текущего времени
	public let timestamp: Int
	
	/// Время работы сервера в секундах
	public let uptime: Int
	
	/// Версия API сервера
	public let version: String
	
	/// Окружение (production/staging/development)
	public let environment: String
	
	/// Статус отдельных компонентов системы
	public let components: [String: ComponentHealthDTO]
	
	public init(
		status: String,
		timestamp: Int,
		uptime: Int,
		version: String,
		environment: String,
		components: [String: ComponentHealthDTO]
	) {
		self.status = status
		self.timestamp = timestamp
		self.uptime = uptime
		self.version = version
		self.environment = environment
		self.components = components
	}
}

/// Информация о здоровье отдельного компонента системы
public struct ComponentHealthDTO: Codable, Sendable {
	/// Статус компонента (healthy/unhealthy/disabled)
	public let status: String
	
	/// Время отклика в миллисекундах (опционально)
	public let responseTime: Int?
	
	/// Дополнительные детали о компоненте
	public let details: [String: String]
	
	public init(
		status: String,
		responseTime: Int? = nil,
		details: [String: String] = [:]
	) {
		self.status = status
		self.responseTime = responseTime
		self.details = details
	}
}
