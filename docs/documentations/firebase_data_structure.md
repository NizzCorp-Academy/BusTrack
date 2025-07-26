# 🔥 Firebase Data Structure – Bus Booking App

This document outlines the Firestore database structure used in the Bus Booking App. It includes the main collections: `users`, `bookings`, and `buses`.

Firestore is a NoSQL document-based database, so the structure is organized into **collections** and **documents**.

---

## 🧑‍💼 Users Collection

Stores user profile and auth-related data.

```json
users (collection)
  └── userId (document)
        ├── name: "John Doe"
        ├── email: "john@example.com"
        ├── phone: "+1234567890"
        └── createdAt: Timestamp

bookings (collection)
  └── bookingId (document)
        ├── userId: "abc123"
        ├── busId: "bus_001"
        ├── route: "City A to City B"
        ├── seatNumber: "12B"
        ├── bookingDate: "2025-04-30"
        ├── travelDate: "2025-05-02"
        └── status: "confirmed"

buses (collection)
  └── busId (document)
        ├── name: "Express Line"
        ├── from: "City A"
        ├── to: "City B"
        ├── departureTime: "08:00 AM"
        ├── arrivalTime: "12:00 PM"
        ├── totalSeats: 40
        └── availableSeats: [ "1A", "1B", "2A", "2B", ... ]

{
  "users": {
    "userId1": {
      "name": "John Doe",
      "email": "john@example.com",
      "phone": "+1234567890",
      "createdAt": "2025-04-30T12:00:00Z"
    }
  },
  "bookings": {
    "bookingId1": {
      "userId": "userId1",
      "busId": "busId1",
      "route": "City A to City B",
      "seatNumber": "12B",
      "bookingDate": "2025-04-30",
      "travelDate": "2025-05-02",
      "status": "confirmed"
    }
  },
  "buses": {
    "busId1": {
      "name": "Express Line",
      "from": "City A",
      "to": "City B",
      "departureTime": "08:00 AM",
      "arrivalTime": "12:00 PM",
      "totalSeats": 40,
      "availableSeats": ["1A", "1B", "2A", "2B"]
    }
  }
}
```
