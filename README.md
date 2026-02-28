# Trinity Order Management Application

A comprehensive Flutter-based order management system for Trinity Tailor, featuring customer management, order tracking, inventory control, and sales operations.

## Tech Stack

### Frontend
- **Flutter SDK**: ^3.8.1
- **Dart**: ^3.8.1
- **State Management**: Riverpod (flutter_riverpod ^3.0.3)
- **Navigation**: GoRouter ^17.0.0
- **UI Framework**: Material Design 3

### Networking & API
- **HTTP Client**: Dio ^5.9.0
- **REST Client**: Retrofit ^4.9.1 with code generation
- **Serialization**: json_annotation ^4.9.0, json_serializable ^6.11.2
- **Image Caching**: cached_network_image ^3.4.1

### Device Features
- **Image Picker**: image_picker ^1.2.1
- **QR Scanner**: mobile_scanner ^5.2.3
- **Local Storage**: shared_preferences ^2.5.3

### Utilities
- **Date Formatting**: intl ^0.20.2
- **Toast Messages**: fluttertoast ^9.0.0
- **Custom Fonts**: Roboto (Regular, Bold, Italic)

### Development Tools
- **Code Generation**: build_runner ^2.7.1, retrofit_generator ^10.2.0
- **Testing**: mocktail ^1.0.4, integration_test
- **Linting**: flutter_lints ^6.0.0
- **App Icons**: flutter_launcher_icons ^0.13.1
- **Splash Screen**: flutter_native_splash ^2.4.3

## Project Architecture

### Data Layer (`lib/data/`)
- **API**: REST client with Retrofit, API constants
- **Models**: JSON-serializable data models (Customer, Order, Product, User, Store, etc.)
- **Repositories**: Business logic for Auth, Customer, Order, Product, Sales, Swatch, Referral Invoice

### UI Layer (`lib/ui/`)
- **Auth**: Login screen
- **Home**: Main dashboard
- **Customer**: Customer management and search
- **Orders**: Order creation, listing, details, and unified view
- **Product**: New product entry
- **Sales**: Sales transaction management
- **Swatch**: Swatch issuance with QR scanning
- **Referral Invoice**: Referral points and invoicing
- **Profile**: Password change
- **Splash**: App initialization screen

### Dependency Injection (`lib/di/`)
- Riverpod providers for dependency management

### Utilities (`lib/utils/`)
- Error handling
- Number to words conversion

## Core Features

### 1. Authentication
- User login with session management
- Password change functionality
- Token-based authentication
- Auto-login with saved credentials

### 2. Customer Management
- Customer registration with auto-generated registration numbers
- Customer search by name/phone
- Customer points tracking and history
- Referral system integration
- Customer dropdown for quick selection

### 3. Order Management
- Create new orders with bill image upload
- View order details
- Search orders by query, date range, and status
- Update order status (Pending/Delivered)
- Unified orders view with filtering
- Order listing with pagination

### 4. Product/Inventory Management
- Add new products with SKU, images, and details
- Stock yard management
- Auto-generated SKU suggestions
- Product search by SKU
- Store-wise stock tracking

### 5. Sales Operations
- Product search by SKU
- Store-wise quantity allocation
- Real-time stock availability checking
- Sales transaction recording

### 6. Swatch Management
- QR code scanning for product lookup
- Swatch issuance from stock
- Store selection for swatch allocation
- Real-time stock validation

### 7. Referral & Points System
- Customer referral tracking
- Points history and transactions
- Referral invoice generation

## API Endpoints

### Authentication
- `login.php` - User authentication
- `change_password.php` - Password update

### Customer APIs
- `get_customer_reg_no.php` - Generate registration number
- `insert_customer.php` - Create new customer
- `register_customer.php` - Register customer with referral
- `search_customer.php` - Search customers
- `read_customers.php` - List all customers
- `list_customers_select.php` - Customer dropdown data
- `get_customer_points.php` - Fetch customer points and history

### Order APIs
- `insert_order.php` - Create new order
- `get_orders.php` - Fetch orders with filters
- `search_order.php` - Search orders
- `view_order.php` - View order details
- `update_order_status.php` - Update order status

### Product APIs
- `insert_product.php` - Add new product
- `list_stockyard.php` - Fetch stock yards
- `get_last_sku.php` - Get last SKU for auto-generation
- `get_product_by_sku.php` - Search product with store stock

### Sales APIs
- `insert_sale.php` - Record sales transaction

### Swatch APIs
- `insert_swatch.php` - Issue swatch
- `list_store.php` - Fetch store list

## Setup Instructions

### Prerequisites
- Flutter SDK ^3.8.1
- Dart SDK ^3.8.1
- Android Studio / VS Code
- Android SDK / Xcode (for iOS)

### Installation

1. Clone the repository
```bash
git clone <repository-url>
cd trinity_flutter
```

2. Install dependencies
```bash
flutter pub get
```

3. Generate code for Retrofit and JSON serialization
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Configure API endpoint
- Update `lib/data/api/api_constants.dart` with your backend URL

5. Run the app
```bash
flutter run
```

### Build for Production

**Android APK:**
```bash
flutter build apk --release
```

**Android App Bundle:**
```bash
flutter build appbundle --release
```

**iOS:**
```bash
flutter build ios --release
```

## Testing

### Run Unit Tests
```bash
flutter test test/unit_test.dart
```

### Run Integration Tests
```bash
flutter test integration_test/app_test.dart
```

### Run Mock Integration Tests
```bash
flutter test test/mock_integration_test.dart
```

## Project Structure

```
lib/
├── data/
│   ├── api/              # REST client and API constants
│   ├── models/           # Data models with JSON serialization
│   └── repository/       # Business logic and API calls
├── di/
│   └── providers.dart    # Dependency injection setup
├── ui/
│   ├── auth/            # Authentication screens
│   ├── customer/        # Customer management
│   ├── home/            # Dashboard
│   ├── orders/          # Order management
│   ├── product/         # Product entry
│   ├── profile/         # User profile
│   ├── referral_invoice/# Referral system
│   ├── sales/           # Sales operations
│   └── swatch/          # Swatch management
├── utils/               # Utility functions
└── main.dart            # App entry point
```

## Configuration Files

- `pubspec.yaml` - Dependencies and assets
- `analysis_options.yaml` - Linting rules
- `android/` - Android-specific configuration
- `ios/` - iOS-specific configuration
- `web/` - Web platform support
- `windows/`, `linux/`, `macos/` - Desktop platform support

## Assets

### Images
- `assets/images/bg.png` - Background image
- `assets/images/logo.png` - App logo
- `assets/images/splash.png` - Splash screen image

### Fonts
- Roboto Regular
- Roboto Bold
- Roboto Italic

## Error Handling

- Network timeout handling
- Session expiration detection
- Server error management
- User-friendly error messages
- Offline mode detection

## Security Features

- Token-based authentication
- Secure session management
- API access control
- Input validation
- Error message sanitization

## Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ Linux
- ✅ macOS

## License

Private - Not for public distribution

## Support

For issues and feature requests, contact the development team.
