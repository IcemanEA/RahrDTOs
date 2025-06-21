//
//  ErrorResponseDTO.swift
//  RahrDTOs
//
//  Created by Egor Ledkov on 21.06.2025.
//

import Foundation

/// Структура ответа об ошибке с дополнительной информацией
public struct ErrorResponseDTO: Codable {
	public let error: String
	public let code: Int
	public let errorType: String
	public let details: String?
	
	public init(error: String, code: Int, errorType: String, details: String? = nil) {
		self.error = error
		self.code = code
		self.errorType = errorType
		self.details = details
	}
}
