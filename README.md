# market_app

A Flutter application demonstrating a modular, scalable architecture using the BLoC (Business Logic Component) pattern for state management. This project also showcases the use of OOP and SOLID principles for maintainable, testable, and extensible code.

---

## Overview

This project is structured to separate concerns clearly:
- **UI Layer (Widgets)**: Manages the presentation and user interaction.
- **Business Logic (Cubits/BLoC)**: Handles the application state and business rules.
- **Data Layer (Models/Repositories)**: Contains data models and logic for data handling (e.g., products, cart, discounts).

By using [Flutter BLoC](https://bloclibrary.dev/#/), the project enforces a clear separation between the UI and the business logic. This approach makes the codebase more testable, maintainable, and scalable.

---

## Folder Structure

![image](https://github.com/user-attachments/assets/f379ebe3-324f-40f9-b667-d61d2bf429d2)
![image](https://github.com/user-attachments/assets/6f16a808-a088-45b6-9e64-0702e1e465ff)


---

### Key Points
1. **`features/home/cubit`**: Contains the `CartCubit` and `CartState`, which manage the state of the shopping cart.
2. **`features/home/data`**: Holds the domain models (`CartItemModel`, `CartModel`, `DiscountModel`, `ProductModel`).
3. **`features/home/widget`**: Includes UI components (e.g., `ProductCardWidget`, `HomeView`) specific to the Home feature.
4. **`app`**: Global configuration, layout logic, and shared widgets.
5. **`core/navigation`**: Centralized navigation management (routes, helpers).

---

## Design Decisions

1. **Separation of Concerns**
    - The **UI** (widgets) is purely for presentation and delegates all logic to the **CartCubit**.
    - The **CartCubit** focuses on business logic related to cart operations (adding/removing items, applying discounts).
    - The **Data** models (`ProductModel`, `CartModel`, etc.) encapsulate the data structure and logic specific to each entity (e.g., discount calculations, cart item manipulation).

2. **Scalability**
    - By following a feature-based folder structure, each feature (like “Home”) has its own cubit, data models, and widgets. This makes it easier to add new features or extend existing ones without affecting unrelated parts of the codebase.

3. **Reusability and Modularity**
    - Each component (Cubit, Widget, Model) is kept small and focused. For example, `DiscountModel` handles discount logic independently, so adding new discount types is straightforward.

4. **Maintainability**
    - Using **Flutter BLoC** ensures that the state flow is clear. Cubits emit states, and widgets react to those states, reducing the complexity of stateful widgets.

---

## OOP and SOLID Principles

1. **Object-Oriented Programming (OOP)**
    - Classes such as `Product`, `Cart`, and `DiscountModel` represent real-world concepts in the domain.
    - Encapsulation is used to keep data and methods that operate on that data within the same class (e.g., `Cart` holds a list of `CartItemModel` and provides methods to add/remove products).

2. **Single Responsibility Principle (SRP)**
    - Each class has a single responsibility. For example:
        - `CartModel` manages cart-related data.
        - `DiscountModel` applies a discount to a given total.
        - `CartCubit` handles the business logic for updating cart states.

3. **Open/Closed Principle (OCP)**
    - `CartCubit` and `DiscountModel` can be extended with new logic (e.g., new discount types) without modifying existing code. New discount classes can inherit or implement `DiscountModel` and be seamlessly integrated.

4. **Liskov Substitution Principle (LSP)**
    - Any subclass or alternative implementation of `DiscountModel` can replace it without breaking the app’s functionality. For example, `PercentageDiscountModel` or `FixedAmountDiscountModel` can be used interchangeably if they implement the same interface or base class.

5. **Interface Segregation Principle (ISP)**
    - Interfaces (or abstract classes) are kept minimal. Classes only implement methods they actually need. For instance, discount classes focus only on `apply(double total)`.

6. **Dependency Inversion Principle (DIP)**
    - Higher-level modules (`CartCubit`) do not depend on the concrete implementations of discounts or cart; they rely on abstractions. The `validPromoCodes` map is injected into `CartCubit`, allowing for easy testing and flexibility.

