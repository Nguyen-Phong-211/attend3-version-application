### The project follows the BloC and FMV architecture models along with the architectures defined in the get_it library. In addition, the project hopes to significantly reduce memory when deployed in real life.

<h2>📂 Project Structure</h2>

<pre>
lib/
│── <b>main.dart</b>                  # Entry point of the app
│── <b>app.dart</b>                   # Root widget with providers, routes, and theme
│
├── <b>config/</b>                    # Global configuration
│   ├── env_config.dart        # Environment variables (dev, prod, staging)
│   ├── injection.dart         # Dependency injection (get_it / locator setup)
│   └── logger.dart            # App logger configuration
│
├── <b>core/</b>                      # Shared code across the app
│   ├── <b>constants/</b>             # Static values
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   ├── api_endpoints.dart
│   │   └── app_icons.dart
│   │
│   ├── <b>utils/</b>                 # Helper & utility functions
│   │   ├── validator.dart
│   │   ├── date_utils.dart
│   │   ├── format_utils.dart
│   │   └── permission_utils.dart
│   │
│   ├── <b>services/</b>              # Services (API, local, notification, etc.)
│   │   ├── api_service.dart
│   │   ├── secure_storage_service.dart
│   │   ├── local_storage_service.dart
│   │   └── notification_service.dart
│   │
│   └── <b>theme/</b>                 # Theme setup
│       ├── app_theme.dart
│       ├── light_theme.dart
│       └── text_styles.dart
│
├── <b>models/</b>                    # Data models (shared across features)
│   └── ...
│
├── <b>api/</b>                       # API layer (low-level, direct calls)
│   └── ...
│
├── <b>providers/</b>                 # Provider classes for state mgmt
│   └── auth_provider.dart
│
├── <b>routes/</b>                    # App routing management
│   ├── app_routes.dart
│   └── route_generator.dart
│
├── <b>features/</b>                  # Feature-first structure (FMV + Bloc)
│   ├── <b>auth/</b>                  # Authentication module
│   │   ├── <b>data/</b>              # Repository & data sources
│   │   │   └── auth_repository.dart
│   │   │
│   │   ├── <b>domain/</b>            # Entities, usecases (if applying clean arch)
│   │   │   └── ...
│   │   │
│   │   ├── <b>presentation/</b>      # UI + State Management (Bloc)
│   │   │   ├── <b>screens/</b>
│   │   │   │   ├── login_screen.dart
│   │   │   │   ├── register_screen.dart
│   │   │   │   ├── forgot_password_screen.dart
│   │   │   │   └── otp_verify_screen.dart
│   │   │   │
│   │   │   ├── <b>bloc/</b>
│   │   │   │   ├── auth_bloc.dart
│   │   │   │   ├── auth_event.dart
│   │   │   │   └── auth_state.dart
│   │   │   │
│   │   │   ├── <b>providers/</b>
│   │   │   │   ├── auth_provider.dart
│   │   │   │   └── login_provider.dart
│   │   │   │
│   │   │   └── <b>widgets/</b>       # Reusable widgets inside auth module
│   │   │       └── ...
│   │
│   └── injection.dart                 # Other features follow same structure
</pre>