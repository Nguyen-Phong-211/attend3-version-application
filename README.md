# application

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

lib/
    ├── main.dart                    
    ├── app.dart                     
    config/
        ├── env_config.dart               
        ├── injection.dart               
        └── logger.dart                 
    core/
        ├── constants/
        │   ├── app_colors.dart         
        │   ├── app_strings.dart        
        │   ├── api_endpoints.dart       
        │   └── app_icons.dart            
        │
        ├── utils/
        │   ├── validator.dart            
        │   ├── date_utils.dart          
        │   ├── format_utils.dart  
        │   ├── auth_provider.dart
        │   └── permission_utils.dart     
        |    
        │
        ├── services/
        │   ├── api_service.dart      
        │   ├── secure_storage_service.dart 
        │   ├── local_storage_service.dart  
        │   └── notification_service.dart 
        │
        └── theme/
        ├── app_theme.dart          
        ├── light_theme.dart         
        └── text_styles.dart
    models/
        ├── student_model.dart          
        ├── lecturer_model.dart         
        ├── attendance_model.dart         
        ├── class_model.dart            
        ├── subject_model.dart            
        └── user_model.dart              
    api/
        ├── auth_api.dart                
        ├── student_api.dart              
        ├── attendance_api.dart           
        ├── class_api.dart                
        └── subject_api.dart             
    providers/
        ├── auth_provider.dart          
        ├── student_provider.dart        
        ├── attendance_provider.dart     
        ├── class_provider.dart         
        └── theme_provider.dart     
    routes/
        ├── app_routes.dart           
        └── route_generator.dart        
    view/
    ├── auth/                   
    │   ├── login_screen.dart
    │   ├── register_screen.dart
    │   ├── forgot_password_screen.dart
    │   └── otp_verify_screen.dart
    │
    ├── dashboard/    
    │   └── dashboard_screen.dart
    │
    ├── student/               
    │   ├── student_list_screen.dart
    │   ├── student_detail_screen.dart
    │   └── student_edit_screen.dart
    │
    ├── attendance/                   
    │   ├── attendance_screen.dart
    │   ├── attendance_history_screen.dart
    │   └── scan_qr_screen.dart      
    │
    ├── class/                      
    │   ├── class_list_screen.dart
    │   └── class_detail_screen.dart
    │
    ├── profile/                     
    │   └── profile_screen.dart
    │
    ├── home/         
    │    └── widgets/
    │        ├── barcode_card.dart
    │        ├── header_section.dart
    │        ├── quick_access_grid.dart
    │        ├── today_schedule.dart
    │    ├── all_quick_access.dart
    │    └── home_screen.dart
    │
    └── widgets/                   
        ├── custom_button.dart
        ├── custom_input.dart
        ├── custom_title.dart
        ├── bottom_nav_menu.dart 