# OliveUPI

A production-inspired UPI onboarding application built using SwiftUI, MVVM, and Clean Architecture.

This project simulates the onboarding journey used in modern UPI applications such as Google Pay, PhonePe, Paytm, and banking apps.

The objective is to understand and implement real-world fintech onboarding flows including device verification, OTP authentication, customer handshake, bank account discovery, bank linking, and UPI registration.

---

## Tech Stack

- SwiftUI
- MVVM Architecture
- Clean Architecture
- Async/Await
- Environment Objects
- Dependency Injection
- Modular Feature Structure

---

## Architecture

```text
Presentation Layer
       ↓
ViewModel Layer
       ↓
Use Case Layer
       ↓
Repository Layer
       ↓
Service Layer
       ↓
Mock Backend
```

---

## Project Structure

```text
OliveUPI
│
├── App
│
├── Core
│   ├── Components
│   ├── Networking
│   ├── Security
│   ├── Utilities
│   └── Constants
│
├── Domain
│   ├── Models
│   ├── Repositories
│   └── UseCases
│
├── Data
│   ├── Network
│   ├── Repository
│   └── MockData
│
├── Features
│   ├── SimBinding
│   ├── DeviceVerification
│   ├── OTPAuthentication
│   ├── CustomerHandshake
│   ├── BankDiscovery
│   ├── BankLinking
│   ├── UPIPINSetup
│   └── RegistrationComplete
│
└── Resources
```

---

## Onboarding Flow

```text
Launch App
      ↓
SIM Binding
      ↓
Device Verification
      ↓
OTP Authentication
      ↓
Customer Handshake
      ↓
Bank Discovery
      ↓
Bank Linking
      ↓
UPI PIN Setup
      ↓
Registration Complete
```

---

## Features Implemented

### SIM Binding

- Mobile Number Entry
- Device Identifier Generation
- SIM Verification Simulation
- Navigation to Device Verification

### Device Verification

- Device Registration Simulation
- Device Fingerprint Generation
- Trust Token Creation
- Session Storage

### OTP Authentication

- OTP Generation
- OTP Validation
- Session Update
- Customer Identification

---

## Shared Onboarding Session

The project uses a centralized onboarding session object to maintain user onboarding data throughout the registration flow.

Example:

```swift
mobileNumber
deviceId
trustToken
customerId
selectedBank
accountNumber
upiId
```

---

## Logging

Application logs are printed in a structured format to simulate production fintech debugging.

Example:

```text
==========================
[OTP REQUEST]

Mobile Number: 9876543210
Device Id: DEVICE_123

==========================
```

```text
==========================
[OTP RESPONSE]

Request Id: REQUEST_123
Message: OTP Sent Successfully

==========================
```

---

## Learning Objectives

This project demonstrates:

- SwiftUI Navigation Flows
- MVVM Architecture
- Clean Architecture Principles
- Async/Await Networking
- Fintech Onboarding Workflows
- Session Management
- API Request/Response Handling
- Modular Project Organization

---

## Future Enhancements

- Real Networking Layer
- API Interceptors
- Keychain Storage
- Biometric Authentication
- QR Payments
- Transaction History
- Beneficiary Management
- Money Transfer Flow
- UPI Collect Requests
- UPI Mandates
- Transaction Dashboard

---

## Screens Planned

- SIM Binding Screen
- Device Verification Screen
- OTP Authentication Screen
- Customer Handshake Screen
- Bank Discovery Screen
- Bank Linking Screen
- UPI PIN Setup Screen
- Registration Success Screen

---

## Author

Shivanand Koli

iOS Developer | SwiftUI | UIKit | Fintech Applications
