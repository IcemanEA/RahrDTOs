//
//  Api.swift
//  RahrApi
//
//  Created by Egor Ledkov on 25.04.2025.
//

import Foundation

/// Точки доступа к API
public enum Api {
	/// Корневая точка доступа к API (название)
	public static let entryPoint = "api"
	
	/// Корневая точка доступа к API
	public static let path = "/" + entryPoint
	
	/// Корневая точка доступа работе с авторизацией пользователя
	public static let user = "user"
	
	/// Корневая точка доступа к работе с новостями
	public static let news = "news"
	
	/// Корневая точка доступа к работе с конференциями
	public static let conferences = "conferences"
	
	/// Корневая точка доступа к работе с профилями
	public static let profile = "profile"
	
	/// Корневая точка доступа к работе с сертификатами
	public static let certificates = "certificates"
	
	// MARK: - V1
	
	/// Первая версия точек доступа
	public enum V1 {
		public static let entryPoint = "v1"
		
		public static let path = Api.path + "/" + entryPoint
		
		// MARK: - User
		
		public enum User {
			public static let path = V1.path + "/" + Api.user
			
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
		
		// MARK: - News
		
		/// Работа с новостями
		public enum News {
			public static let path = V1.path + "/" + Api.news
			
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
		
		// MARK: - Conference
		
		/// Работа с конференциями
		public enum Conference {
			public static let path = V1.path + "/" + Api.conferences
			
			/// Получить список конференций
			case list
			
			/// Получить, создать, обновить или удалить конференцию по ID
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
		
		// MARK: - Profile
		
		/// Работа с профилями
		public enum Profile {
			public static let path = V1.path + "/" + Api.profile
			
			/// Получить профиль члена РАРЧ по ID
			case byMemberId
			
			/// Получить профиль члена РАРЧ по RAHR_ID
			case byRahrId
			
			/// Обновить профиль члена РАРЧ по ID
			case update
			
			/// История платежей члена РАРЧ по ID
			case paymentHistory
			
			public var uri: String {
				switch self {
				case .byMemberId:
					":memberId"
				case .byRahrId:
					"rahr/:rahrId"
				case .update:
					":memberId"
				case .paymentHistory:
					":memberId/history"
				}
			}
			
			public func getUrl() -> String {
				return uri.isEmpty ? Self.path : Self.path + "/" + uri
			}
			
			public func getUrlWithId(_ id: String) -> String {
				let url = Self.path + "/" + uri
				switch self {
				case .byMemberId, .update, .paymentHistory:
					return url.replacingOccurrences(of: ":memberId", with: id)
				case .byRahrId:
					return url.replacingOccurrences(of: ":rahrId", with: id)
				}
			}
		}
		
		// MARK: - Certificate
		
		/// Работа с сертификатами
		public enum Certificate {
			public static let path = V1.path + "/" + Api.certificates
			
			/// Получить список сертификатов
			case list
			
			/// Получить, создать, обновить или удалить сертификат по ID
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
