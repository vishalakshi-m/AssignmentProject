import Foundation

class APIClient {
    static let shared = APIClient()
    
    private init() {} // Singleton pattern

    func request<T: Decodable>(
        url: URL,
        method: String = "GET",
        headers: [String: String]? = nil,
        body: Data? = nil,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = body
        
        if let headers = headers {
            headers.forEach { request.addValue($1, forHTTPHeaderField: $0) }
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

enum APIEndpoints {
    static let baseURL = "https://api.weatherstack.com"
    
    case getCurrent(location: String)    
    var url: URL? {
        switch self {
        case .getCurrent(let location):
            return URL(string: "\(APIEndpoints.baseURL)/current?query=\(location)")
    }
}

