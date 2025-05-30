//
//  RequestParams.swift
//  RahrDTOs
//
//  Created by Egor Ledkov on 27.04.2025.
//

import Foundation

/// Структура для передачи параметров запроса серверу
public struct RequestParams: Sendable {
	public let limit: Int?
	public let offset: Int?
	public let count: Int?

	public init() {
		self.limit = nil
		self.offset = nil
		self.count = nil
	}
	
	public init(limit: Int? = nil, offset: Int? = nil, count: Int? = nil) {
		self.limit = limit
		self.offset = offset
		self.count = count
	}
}

extension RequestParams: CustomStringConvertible {
	public var description: String {
		"Params: count = \(String(describing: count)), limit = \(String(describing: limit)), offset = \(String(describing: offset))"
	}
}
