//
//  RequestParams.swift
//  RahrDTOs
//
//  Created by Egor Ledkov on 27.04.2025.
//

import Foundation

/// Структура для передачи параметров запроса серверу
public struct RequestParams: Sendable {
	public let update: Int?
	public let rahrId: Int?
	public let limit: Int?
	public let offset: Int?
	public let count: Int?
	public let total: Int?
	
	public init() {
		self.update = nil
		self.rahrId = nil
		self.limit = nil
		self.offset = nil
		self.count = nil
		self.total = nil
	}
	
	public init(
		update: Int? = nil,
		rahrId: Int? = nil,
		limit: Int? = nil,
		offset: Int? = nil,
		count: Int? = nil,
		total: Int? = nil
	) {
		self.update = update
		self.rahrId = rahrId
		self.limit = limit
		self.offset = offset
		self.count = count
		self.total = total
	}
	
	/// Создать RequestParams из query параметров
	public init(from queryParameters: [String: String]) throws {
		let update = queryParameters["update"].flatMap(Int.init)
		let rahrId = queryParameters["rahr_id"].flatMap(Int.init)
		let limit = queryParameters["limit"].flatMap(Int.init)
		let offset = queryParameters["offset"].flatMap(Int.init)
		let count = queryParameters["count"].flatMap(Int.init)
		let total = queryParameters["total"].flatMap(Int.init)
		
		self.init(update: update, rahrId: rahrId, limit: limit, offset: offset, count: count, total: total)
	}
	
	/// Преобразует RequestParams в словарь для URL параметров
	public func buildUrlParameters() -> [String: Any] {
		var urlParameters: [String: Any] = [:]
		
		if let update = self.update {
			urlParameters["update"] = update
		}
		if let limit = self.limit {
			urlParameters["limit"] = limit
		}
		if let rahrId = self.rahrId {
			urlParameters["rahr_id"] = rahrId
		}
		if let offset = self.offset {
			urlParameters["offset"] = offset
		}
		if let count = self.count {
			urlParameters["count"] = count
		}
		if let total = self.total {
			urlParameters["total"] = total
		}
		
		return urlParameters
	}
	
	/// Создать новый RequestParams с указанным количеством
	public func withCount(_ count: Int) -> RequestParams {
		RequestParams(
			update: self.update,
			rahrId: self.rahrId,
			limit: self.limit,
			offset: self.offset,
			count: count,
			total: self.total
		)
	}
}

extension RequestParams: CustomStringConvertible {
	public var description: String {
		"Params: from update \(String(describing: update)), count records = \(String(describing: count)), limit = \(String(describing: limit)), offset = \(String(describing: offset)) total pages = \(String(describing: count))"
	}
}
