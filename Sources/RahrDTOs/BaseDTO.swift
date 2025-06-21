//
//  BaseDTO.swift
//  RahrDTOs
//
//  Created by Egor Ledkov on 21.06.2025.
//


import Foundation

/// Базовая структура для всех ответов API сервера
public struct BaseDTO<T: Codable>: Codable {
	
	/// Структура для пагинации в ответах API
	public struct Pager: Codable {
		public let offset: Int
		public let limit: Int
		public let count: Int
		public let total: Int?
		
		public init(offset: Int, limit: Int, count: Int, total: Int? = nil) {
			self.offset = offset
			self.limit = limit
			self.count = count
			self.total = total
		}
		
		/// Создать Pager из RequestParams
		public static func from(_ params: RequestParams) -> Pager {
			return Pager(
				offset: params.offset ?? 0,
				limit: params.limit ?? params.count ?? 0,
				count: params.count ?? 0,
				total: params.total
			)
		}
	}
	
	public let pager: Pager?
	public let results: T
	public let success: Bool
	
	public init(pager: Pager? = nil, results: T, success: Bool = true) {
		self.pager = pager
		self.results = results
		self.success = success
	}
}

// MARK: - Convenience Extensions

public extension BaseDTO {
	
	/// Создать успешный ответ с результатами без пагинации
	static func success(_ results: T) -> BaseDTO<T> {
		return BaseDTO(results: results)
	}
	
	/// Создать успешный ответ с пагинацией
	static func success(_ results: T, pager: Pager) -> BaseDTO<T> {
		return BaseDTO(pager: pager, results: results)
	}
	
	/// Создать успешный ответ с пагинацией из RequestParams
	static func success(_ results: T, params: RequestParams) -> BaseDTO<T> where T: Collection {
		let pager = Pager.from(params)
		return BaseDTO(pager: pager, results: results)
	}
}

// MARK: - Array Extensions

public extension BaseDTO where T: Collection {
	
	/// Проверить, есть ли результаты
	var hasResults: Bool {
		return !results.isEmpty
	}
	
	/// Количество элементов в результатах
	var resultsCount: Int {
		return results.count
	}
	
	/// Проверить, есть ли следующая страница (если известно total)
	var hasNextPage: Bool {
		guard let pager = pager, let total = pager.total else { return false }
		return (pager.offset + pager.limit) < total
	}
	
	/// Проверить, есть ли предыдущая страница
	var hasPreviousPage: Bool {
		guard let pager = pager else { return false }
		return pager.offset > 0
	}
}
