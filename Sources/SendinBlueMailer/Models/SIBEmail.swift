import Foundation

// MARK: - SIBEMail
public final class SIBEmail: Codable {
    let sender: Individual
    let to: [Individual]
    let subject, htmlContent: String

    public init(sender: Individual, to: [Individual], subject: String, htmlContent: String) {
        self.sender = sender
        self.to = to
        self.subject = subject
        self.htmlContent = htmlContent
    }
}

// MARK: - Sender
public final class Individual: Codable {
    let name: String
    let email: String

    public init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}
