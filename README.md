lib/
│── main.dart                  # Entry point of the app
│── app.dart                   # Root widget with providers, routes, and theme
│
├── config/                    # Global configuration
│   ├── env_config.dart        # Environment variables (dev, prod, staging)
│   ├── injection.dart         # Dependency injection (get_it / locator setup)
│   └── logger.dart            # App logger configuration
│
├── core/                      # Shared code across the app
│   ├── constants/             # Static values
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   ├── api_endpoints.dart
│   │   └── app_icons.dart
│   │
│   ├── utils/                 # Helper & utility functions
│   │   ├── validator.dart
│   │   ├── date_utils.dart
│   │   ├── format_utils.dart
│   │   └── permission_utils.dart
│   │
│   ├── services/              # Services (API, local, notification, etc.)
│   │   ├── api_service.dart
│   │   ├── secure_storage_service.dart
│   │   ├── local_storage_service.dart
│   │   └── notification_service.dart
│   │
│   └── theme/                 # Theme setup
│       ├── app_theme.dart
│       ├── light_theme.dart
│       └── text_styles.dart
│
├── models/                    # Data models (shared across features)
│   ├── student_model.dart
│   ├── lecturer_model.dart
│   ├── attendance_model.dart
│   ├── class_model.dart
│   ├── subject_model.dart
│   └── user_model.dart
│
├── api/                       # API layer (low-level, direct calls)
│   ├── auth_api.dart
│   ├── student_api.dart
│   ├── attendance_api.dart
│   ├── class_api.dart
│   └── subject_api.dart
│
├── providers/                 # Provider classes for state mgmt
│   ├── auth_provider.dart
│   ├── student_provider.dart
│   ├── attendance_provider.dart
│   ├── class_provider.dart
│   └── theme_provider.dart
│
├── routes/                    # App routing management
│   ├── app_routes.dart
│   └── route_generator.dart
│
├── features/                  # Feature-first structure (FMV + Bloc)
│   ├── auth/                  # Authentication module
│   │   ├── data/              # Repository & data sources
│   │   │   └── auth_repository.dart
│   │   │
│   │   ├── domain/            # Entities, usecases (if applying clean arch)
│   │   │   └── ...
│   │   │
│   │   ├── presentation/      # UI + State Management (Bloc)
│   │   │   ├── screens/
│   │   │   │   ├── login_screen.dart
│   │   │   │   ├── register_screen.dart
│   │   │   │   ├── forgot_password_screen.dart
│   │   │   │   └── otp_verify_screen.dart
│   │   │   │
│   │   │   ├── bloc/
│   │   │   │   ├── auth_bloc.dart
│   │   │   │   ├── auth_event.dart
│   │   │   │   └── auth_state.dart
│   │   │   │
│   │   │   └── widgets/       # Reusable widgets inside auth module
│   │   │       └── ...
│   │
│   └── ...                    # Other features follow same structure
│
└── widgets/                   # Global shared widgets (not tied to one feature)
├── custom_button.dart
├── custom_input.dart
├── custom_title.dart
└── bottom_nav_menu.dart