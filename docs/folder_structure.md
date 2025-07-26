# 📂 Flutter Folder Structure & Architecture

This document explains the architectural layers and structure inside the `lib/` directory of the **Bus Booking App**.

---

## 🧱 Clean Architecture Overview

We follow a **Clean Architecture** pattern to separate concerns and improve scalability, readability, and testability.


---

### 📁 lib/data

**Purpose:**  
This layer handles all the data-related logic, including:

- Firebase interactions (Firestore, Auth)
- Remote or local data sources
- Data models and DTOs (Data Transfer Objects)

---

### 📁 lib/domain

**Purpose:**  
Contains the **business logic** of the app.

- Abstract `repositories` (interfaces)
- `use_cases` that represent user actions or operations (e.g., BookSeat, GetUserBookings)

---

### 📁 lib/presentation

**Purpose:**  
Responsible for the **UI layer** (widgets, pages, and state management).

- Flutter screens
- Widgets
- ViewModels or Bloc/Cubit (if using state management)

---

### 📁 lib/core

**Purpose:**  
Shared utilities and constants used across all layers.

- App themes
- Constants
- Utilities (helpers, extensions)

---

### 📄 main.dart

The app's entry point, where Firebase is initialized and the app is launched.

---

## ✅ Benefits of This Structure

- **Separation of concerns**: Each layer has a clear responsibility
- **Scalability**: Easy to add new features without breaking others
- **Testability**: Business logic and UI are decoupled

---

## 📝 Notes

- All communication from UI → Domain → Data
- No layer should directly access Firebase from `presentation`
- Only `data/` should depend on Firebase SDKs

