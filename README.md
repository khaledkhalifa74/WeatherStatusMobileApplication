# 🌤️ Weather Status

**Weather Status** is a modern, fast, and user-friendly Flutter application that provides real-time weather information and 5-day forecasts for cities around the world.  
The app follows **Clean Architecture**, uses **Cubit** for state management, and offers a smooth and efficient user experience with persistent favorite cities and reliable error handling.

---

## 🚀 Features

- 🌡️ **Current Weather Display**: Shows temperature, humidity, wind speed, visibility, and weather condition.
- 📅 **5-Day Forecast**: Displays daily max/min temperature and weather icons.
- 🔎 **City Search**: Users can search for weather information by city name.
- ⭐ **Favorite Cities**: Save up to 5 favorite cities for quick access.
- 🧭 **Navigation with App Router**: Clean navigation flow with `go_router`.
- 💾 **Local Storage with Hive**: Persistent storage of favorite cities locally.
- 🧪 **Unit Testing**: Business logic and service layer functions are covered with unit tests.
- 🧰 **Error Handling**: Gracefully handles API errors and exceptions to ensure a smooth experience.

---

## 🧱 Architecture

This project follows the **Clean Architecture** pattern for better scalability, maintainability, and testability.

**Layers:**
- `data`: Handles data sources (local & remote) and repositories.
- `domain`: Defines abstract repositories and business logic contracts.
- `presentation`: Contains Cubits, UI widgets, and views.

---

## 🧠 State Management

The app uses **Cubit (from flutter_bloc)** for state management, ensuring:
- Clear separation of concerns
- Easy testing
- Simple and predictable state transitions

---

## 🗃️ Local Database

- Implemented using [Hive](https://pub.dev/packages/hive) to store and manage the list of favorite cities.
- Supports adding and removing favorite cities with instant UI updates.

---

## 🧭 Navigation

- Implemented using `go_router` for:
    - Clean and declarative routing.
    - Easy handling of navigation arguments.

---

## 🧪 Testing

Unit tests are implemented to verify:
- Core business logic in repositories.
- Local and remote data source functionality.
- Error handling and API response parsing.

To run tests:
```bash
flutter test
