//
//  Api.swift
//  RahrApi
//
//  Created by Egor Ledkov on 25.04.2025.
//

import Foundation

/// Точки доступа к API
public enum Api {
	/// Корневая точка доступа к API
	public static let entryPoint = "/api"
	
	/// Первая версия точек доступа
	public enum V1 {
		public static let v1 = Api.entryPoint + "/v1"
		
		/// Работа с новостями
		public enum News {
			public static let path = v1 + "/news"
			
			case list
			case byId
			
			public var uri: String {
				switch self {
				case .list:
					""
				case .byId:
					":id"
				}
			}
			
			public func getUrl() -> String {
				Self.path + "/" + uri
			}
			
			public func getUrlWithId(_ id: String) -> String {
				let url = Self.path + "/" + uri
				return url.replacingOccurrences(of: ":id", with: id)
			}
		}
	}
}
