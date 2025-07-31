//
//  FileDTO.swift
//  RahrDTOs
//
//  Created by Egor Ledkov on 30.07.2025.
//

import Foundation

// MARK: - FileDTO

/// DTO для работы с файлами
public struct FileDTO: Codable, Sendable {
	/// Уникальный идентификатор файла
	public let id: UUID?
	
	/// Оригинальное имя файла
	public var fileName: String?
	
	/// MIME тип файла
	public var mimeType: String?
	
	/// Размер файла в байтах
	public var fileSize: Int?
	
	/// Ключ файла в S3 хранилище
	public var storageKey: String?
	
	/// URL для доступа к файлу
	public var fileUrl: String?
	
	/// Хеш файла для проверки целостности
	public var fileHash: String?
	
	/// Статус файла
	public var status: String?
	
	/// Дата создания записи (Unix timestamp)
	public var dtCreate: Int?
	
	/// Дата обновления записи (Unix timestamp)
	public var dtUpdate: Int?
	
	/// Инициализация с полными параметрами
	public init(
		id: UUID? = nil,
		fileName: String? = nil,
		mimeType: String? = nil,
		fileSize: Int? = nil,
		storageKey: String? = nil,
		fileUrl: String? = nil,
		fileHash: String? = nil,
		status: String? = nil,
		dtCreate: Int? = nil,
		dtUpdate: Int? = nil
	) {
		self.id = id
		self.fileName = fileName
		self.mimeType = mimeType
		self.fileSize = fileSize
		self.storageKey = storageKey
		self.fileUrl = fileUrl
		self.fileHash = fileHash
		self.status = status
		self.dtCreate = dtCreate
		self.dtUpdate = dtUpdate
	}
}

// MARK: - FileUploadRequestDTO

/// DTO для запроса presigned URL
public struct FileUploadRequestDTO: Codable, Sendable {
	/// Оригинальное имя файла
	public let fileName: String
	
	/// MIME тип файла
	public let mimeType: String
	
	/// Размер файла в байтах
	public let fileSize: Int
	
	/// Хеш файла для проверки целостности (опционально)
	public let fileHash: String?
	
	public init(
		fileName: String,
		mimeType: String,
		fileSize: Int,
		fileHash: String? = nil
	) {
		self.fileName = fileName
		self.mimeType = mimeType
		self.fileSize = fileSize
		self.fileHash = fileHash
	}
}

// MARK: - FileUploadResponseDTO

/// DTO для ответа с presigned URL
public struct FileUploadResponseDTO: Codable, Sendable {
	/// ID созданной записи файла
	public let fileId: UUID
	
	/// Presigned URL для загрузки
	public let uploadUrl: String
	
	/// Ключ файла в S3
	public let storageKey: String
	
	/// Время истечения URL (Unix timestamp)
	public let expiresAt: Int
	
	public init(
		fileId: UUID,
		uploadUrl: String,
		storageKey: String,
		expiresAt: Int
	) {
		self.fileId = fileId
		self.uploadUrl = uploadUrl
		self.storageKey = storageKey
		self.expiresAt = expiresAt
	}
}

// MARK: - FileUploadCompleteDTO

/// DTO для подтверждения загрузки
public struct FileUploadCompleteDTO: Codable, Sendable {
	/// ID файла
	public let fileId: UUID
	
	/// Подтверждение успешной загрузки
	public let success: Bool
	
	/// Хеш загруженного файла (для верификации)
	public let fileHash: String?
	
	public init(
		fileId: UUID,
		success: Bool,
		fileHash: String? = nil
	) {
		self.fileId = fileId
		self.success = success
		self.fileHash = fileHash
	}
}
