//
//  APIServiceCombine.swift
//  MobileWeatherApp
//
//  Created by Brad Kimbrell on 2/18/21.
//

import Combine
import Foundation

public class APIServiceCombine {
	public static let shared	= APIServiceCombine()
	var cancellables				= Set<AnyCancellable>()
	
	public enum APIError: Error {
		case error(_ errorString: String)
	}
	
	public func getJSON<T: Decodable>(urlString: String,
			dateDecodingStrategy: JSONDecoder.DateDecodingStrategy	= .deferredToDate,
			keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy	= .convertFromSnakeCase,
			completion: @escaping (Result<T,APIError>) -> Void) {
		guard let url = URL(string: urlString) else {
			completion(.failure(.error(
					NSLocalizedString(K.Error.invalidURL, comment: ""))))
			return
		}
		//print(urlString)
		let request = URLRequest(url: url)
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy	= dateDecodingStrategy
		decoder.keyDecodingStrategy	= keyDecodingStrategy
		URLSession.shared.dataTaskPublisher(for: request)
			.map { $0.data }
			.decode(type: T.self, decoder: decoder)
			.receive(on: RunLoop.main)
			.sink { (taskCompletion) in
				switch taskCompletion {
					case .finished:
						return
					case .failure(let decodingError):
						completion(.failure(APIError.error(
							"\(K.Error.decoding) \(decodingError.localizedDescription)")))
				}
			} receiveValue: { (decodedData) in
				completion(.success(decodedData))
			}
			.store(in: &cancellables)
	}
}

