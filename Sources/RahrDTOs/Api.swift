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
		
		public enum User {
			public static let path = v1 + "/user"
			
			/// Basic Auth - регистрация и обновление JWT токена/
			case registration
			
			/// JWT Auth - обновление notification token/
			case token
			
			/// JWT Auth - авторизация внутри мобильного приложения для доп. функций/
			case login
			
			/// JWT Auth - выход из системы, очистка email данных
			case logout
			
			public var uri: String {
				switch self {
				case .registration:
					"registration"
				case .token:
					"token"
				case .login:
					"login"
				case .logout:
					"logout"
				}
			}
			
			public func getUrl() -> String {
				return uri.isEmpty ? Self.path : Self.path + "/" + uri
			}
		}
		
		/// Работа с новостями
		public enum News {
			public static let path = v1 + "/news"
			
			/// Получить список новостей
			case list
			
			/// Получить одну детальную новость по её ID
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
				return uri.isEmpty ? Self.path : Self.path + "/" + uri
			}
			
			public func getUrlWithId(_ id: String) -> String {
				let url = Self.path + "/" + uri
				return url.replacingOccurrences(of: ":id", with: id)
			}
		}
	}
}
