//
//  NetworkDispatcher.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/01/31.
//

import Foundation
import Combine

struct NetworkDispatcher {
    
    let urlSession: URLSession!
    
    public init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    // Dispatches an URLRequest and returns a publisher
    func dispatch<ReturnType: Codable>(request: URLRequest) -> AnyPublisher<ReturnType, NetworkRequestError> {
        print("[\(request.httpMethod?.uppercased() ?? "")] '\(request.url!)'")
        return urlSession
            .dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ data, response in
                
                // Throw an error if the response is invalid
                guard let response = response as? HTTPURLResponse else {
                    throw httpError(0)
                }
                print("[\(response.statusCode)] '\(request.url!)'")
                
                if !(200...299).contains(response.statusCode) {
                    throw httpError(response.statusCode)
                }
                return data
            })
            .receive(on: DispatchQueue.main)
            .decode(type: ReturnType.self, decoder: JSONDecoder())
            // decoding errors
            .mapError { error in
                print("\(error)")
                return handleError(error)
            }
            // publisher
            .eraseToAnyPublisher()
    }
    
    private func httpError(_ statusCode: Int) -> NetworkRequestError {
        switch statusCode {
        case 400: return .badRequest
        case 401: return .unauthorized
        case 403: return .forbidden
        case 404: return .notFound
        case 402, 405...499: return .error4xx(statusCode)
        case 500: return .serverError
        default: return .unknownError
        }
    }
    
    // Return Readable NetworkRequestError
    private func handleError(_ error: Error) -> NetworkRequestError {
        switch error {
        case is Swift.DecodingError:
            return .decodingError(error.localizedDescription)
        case let urlError as URLError:
            return .urlSessionFailed(urlError)
        case let error as NetworkRequestError:
            return error
        default:
            return .unknownError
        }
    }
}
