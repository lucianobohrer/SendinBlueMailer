import Foundation
import AsyncHTTPClient
import NIO
import NIOHTTP1

public final class SendInBlueClient {
    
    let apiURL: String = "https://api.sendinblue.com/v3/smtp/email"
    let apiKey: String
    let httpClient: HTTPClient
    
    enum HeaderName {
        static let contentType = "Content-Type"
        static let accept = "Accept"
        static let apiKey = "api-key"
    }
    
    public init(httpClient: HTTPClient, apiKey: String) {
        self.httpClient = httpClient
        self.apiKey = apiKey
    }
    
    public func send(email: SIBEmail, on eventLoop: EventLoop) throws -> EventLoopFuture<Void> {
            
        var headers = HTTPHeaders()
        headers.add(name: HeaderName.apiKey, value: apiKey)
        headers.add(name: HeaderName.contentType, value: "application/json")
        headers.add(name: HeaderName.accept, value: "application/json")
 
        let bodyData = try JSONEncoder().encode(email)
        let bodyString = String(decoding: bodyData, as: UTF8.self)
        
        let request = try HTTPClient.Request(url: apiURL,
                                             method: .POST,
                                             headers: headers,
                                             body: .string(bodyString))
        
        return httpClient.execute(request: request,
                                  eventLoop: .delegate(on: eventLoop))
            .flatMap { response in
                switch response.status {
                case .created:
                    return eventLoop.makeSucceededFuture(())
                default:
                    return eventLoop.makeFailedFuture(Error.notDelivered)
                }
        }
    }
}

extension SendInBlueClient {
    public enum Error: String, Swift.Error {
        case notDelivered = "E-mail couldn't be delivered"
    }
}
