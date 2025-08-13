@echo off
echo ======================================
echo Installing Flutter dependencies one by one...
echo ======================================

REM Main dependencies
call flutter pub add dio
echo [OK] Installed dio

call flutter pub add hive
echo [OK] Installed hive

call flutter pub add http
echo [OK] Installed http

call flutter pub add intl
echo [OK] Installed intl

call flutter pub add dartz
echo [OK] Installed dartz

call flutter pub add get_it
echo [OK] Installed get_it

call flutter pub add provider
echo [OK] Installed provider

call flutter pub add equatable
echo [OK] Installed equatable

call flutter pub add flutter_svg
echo [OK] Installed flutter_svg

call flutter pub add file_picker
echo [OK] Installed file_picker

call flutter pub add url_launcher
echo [OK] Installed url_launcher

call flutter pub add path_provider
echo [OK] Installed path_provider

call flutter pub add json_annotation
echo [OK] Installed json_annotation

call flutter pub add connectivity_plus
echo [OK] Installed connectivity_plus

call flutter pub add shared_preferences
echo [OK] Installed shared_preferences

call flutter pub add permission_handler
echo [OK] Installed permission_handler

call flutter pub add font_awesome_flutter
echo [OK] Installed font_awesome_flutter

call flutter pub add awesome_notifications
echo [OK] Installed awesome_notifications

call flutter pub add url_strategy
echo [OK] Installed url_strategy

call flutter pub add go_router
echo [OK] Installed go_router

REM Dev dependencies
call flutter pub add --dev build_runner
echo [OK] Installed build_runner (dev)

call flutter pub add --dev hive_generator
echo [OK] Installed hive_generator (dev)

call flutter pub add --dev json_serializable
echo [OK] Installed json_serializable (dev)

call flutter pub add --dev flutter_launcher_icons
echo [OK] Installed flutter_launcher_icons (dev)

call flutter pub add --dev flutter_native_splash
echo [OK] Installed flutter_native_splash (dev)

echo ======================================
echo ✅ All dependencies installed successfully!
echo ======================================
pause
