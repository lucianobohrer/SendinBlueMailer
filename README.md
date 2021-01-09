# SendinBlueMailer

SendinBlueMailer allows you to integrate SendinBlue email services into your project.  

## 🔧 Installation

Add the following dependency to your `Package.swift` file:
```swift
.package(url:"https://github.com/lucianobohrer/SendinBlueMailer.git", from: "1.0.0"),
```

## 💊 Usage

### 1 - Import

It's really easy to get started with the SendinBlueMailer library! First you need to import the library, by adding this to the top of your Swift file:
```swift
import SendinBlueMailer
```

### 2 - Initialize

To initialize your SendinBlueMailer client, just copy the following code:
```swift
let mailClient = SendInBlueClient(httpClient: /* httpClient*/,
                                  apiKey: apiKey)
```

In case of you're using vapor4 you can use this line as httpClient:

```swift
req.application.http.client.shared
```

### 3 Configure the email

Beside the initialization you need to map your data into the `SIBEmail` class
```swift
let sender = Individual(name: "Jhon doe", email: "no-reply@johndoe.dev")
let receiver = Individual(name: "Jane Doe", email: "janedoe@mail.com")

let email = SIBEmail(sender: sender,
                     to: receiver],
                     subject: "Subject here",
                     htmlContent: """
         <html>
         <body>
         <p>Your content here.</p>
         </body>
         </html>
         """)

```
## ⭐ Contributing

Feel welcome to contribute to this project! :)



## 📝 License

This project was released under the [MIT](license) license.
