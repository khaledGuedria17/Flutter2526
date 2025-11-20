# 🎮 Flutter Gaming Store App — Workshop Source Code

Welcome!  
This repository contains the **Flutter codebase** used during my live coding workshops with students.  
Each session introduces a new concept, and **every commit corresponds to a workshop**, allowing you to follow the progress step-by-step and understand how a full app is built from scratch.

---

## 📌 About the Project

Throughout the workshops, we build a **complete gaming store mobile application** (games only).  
The app is progressively implemented, with each chapter adding new functionality, architecture, or best practices.

This repository aims to:

- Provide the **full source code** for each session  
- Help students review, rewind and experiment  
- Demonstrate how real Flutter apps are structured and improved over time  
- Serve as a reference for best practices in modern Flutter

---

## 🏗 Workshop Structure (Chapters)

Each chapter corresponds to one or multiple commits.

### 1️⃣ Object-Oriented Programming (OOP)
- Classes, objects, constructors  
- Models for the application (Game, Category, User…)  
- Encapsulation and clean architecture foundations  

### 2️⃣ Flutter Widgets
- Stateless vs Stateful Widgets  
- Building UI components  
- Layouts, styling, and reusable components  

### 3️⃣ Navigation
- Navigator 1.0 & 2.0 (GoRouter optional)  
- Routing structure for the gaming store  
- Passing data between screens  

### 4️⃣ HTTP & APIs
- Fetching game data from a remote API  
- Showing loading and error states  
- Parsing JSON into models  

### 5️⃣ Local Storage
- SharedPreferences / Hive (depending on workshop)  
- Storing favorites, cache, or user preferences  
- Offline data considerations  

### 6️⃣ State Management
- Provider / Riverpod / Bloc (depending on session)  
- App-wide reactive state  
- Clean architecture patterns  

### 7️⃣ Unit Tests
- Testing models  
- Testing services & business logic  
- Widget/UI testing  


## 🧭 How to Use This Repo

1. Clone the repository:
```bash
git clone https://github.com/khaledGuedria17/Flutter2526.git
```
2. Navigate into the project folder
```bash
cd Flutter2526
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

5. Check out a specific workshop/session using commit history:
```bash
git log
git checkout <commit-id>
```
---

## 📚 Purpose & Learning Goals

By following the repository commits sequentially, students will learn how to:

- Structure a Flutter project professionally

- Build a complete functional application

- Work with backend APIs

- Persist local data

- Use modern state management

- Write clean, maintainable code

- Add unit and widget tests
