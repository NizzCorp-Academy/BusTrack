# 🚌 Bus Booking App

A Flutter-based mobile application for booking bus seats. This app simplifies the process of finding routes, selecting buses, and booking seats—no online payment is required at this stage. Booking details are stored using Firebase Firestore, and users can view their bookings in their profile page.

---

## 🔍 Description

This application is designed to allow users to:
- Browse available bus routes
- Book seats for a selected route
- Store booking data in Firebase
- View booking history in their profile

It's built using **Flutter** for the frontend and **Firebase Firestore** for real-time data storage and authentication.

---

## 🎯 Project Goals

- Provide a seamless and intuitive user experience  
- Enable users to search and book buses without traditional complexity  
- Display booking history and user data in real-time via Firebase  
- Ensure responsive, cross-platform performance using Flutter  
- Build a strong foundation for adding features like payments in the future  

---

🔥 Firebase Notes
Firestore is used to save booking details (e.g., bus name, route, date, seat number)

Authentication allows users to sign up and log in with email/password

Security rules ensure that users can only access their own booking data

The app currently does not include payment integration, but it's structured to support it in future updates


👥 Team Roles and Responsibilities
Project Manager
Oversees planning, timelines, team coordination, and communication with stakeholders

UI/UX Designer
Designs the interface and user experience; responsible for wireframes, mockups, and user flows

Frontend Developer (Flutter)
Implements the UI in Flutter, connects to Firebase, and manages state and user interactions

