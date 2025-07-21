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
	public let limit: Int?
	public let offset: Int?
	public let count: Int?
	public let total: Int?

	public init() {
		self.update = nil
		self.limit = nil
		self.offset = nil
		self.count = nil
		self.total = nil
	}
	
	public init(update: Int? = nil, limit: Int? = nil, offset: Int? = nil, count: Int? = nil, total: Int? = nil) {
		self.update = update
		self.limit = limit
		self.offset = offset
		self.count = count
		self.total = total
	}
	
	/// Создать RequestParams из query параметров
	public init(from queryParameters: [String: String]) throws {
		let limit = queryParameters["limit"].flatMap(Int.init)
		let offset = queryParameters["offset"].flatMap(Int.init)
		let count = queryParameters["count"].flatMap(Int.init)
		
		self.init(limit: limit, offset: offset, count: count)
	}
	
	/// Создать новый RequestParams с указанным количеством
	public func withCount(_ count: Int) -> RequestParams {
		RequestParams(
			update: self.update,
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
