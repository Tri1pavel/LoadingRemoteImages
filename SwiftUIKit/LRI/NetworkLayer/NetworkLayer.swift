//
//  NetworkLayer.swift
//  LRI
//
//  Created by Development on 01.07.2022.
//

import Foundation

struct NetworkLayer {
    @discardableResult
    static func request<T: Codable>(endpoint: Endpoint,
                                    completion: @escaping (Result<T, Error>) -> ())
    -> URLSessionDataTask? {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        
        guard let url = components.url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                let error = NSError(domain: "", code: NSURLErrorBadServerResponse, userInfo: [NSLocalizedDescriptionKey: "The server responded with an error."])
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "", code: NSURLErrorZeroByteResource, userInfo: [NSLocalizedDescriptionKey: "Server terminated the network connection without sending any data."])
                completion(.failure(error))
                return
            }

            guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
                let error = NSError(domain: "", code: NSURLErrorCannotDecodeContentData, userInfo: [NSLocalizedDescriptionKey: "Failed to decode response."])
                completion(.failure(error))
                return
            }

            completion(.success(decoded))
        }
        dataTask.resume()
        
        return dataTask
    }
}
