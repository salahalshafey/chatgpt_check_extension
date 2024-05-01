# Makefile for pushing changes to GitHub && deploying Flutter web app to GitHub Pages

# run on the terminal: make deploy-web

# Update These Variables

BUILD_VERSION = '1.0.0'
# BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

BASE_HREF = '/chatgpt_check_web/'
CURRENT_APP_DESTINATION = 'D:\FlutterDevelopment\projects\chatgpt_check_extension'
BUILD_SOURCE = 'D:\FlutterDevelopment\projects\chatgpt_check_extension\build\web'
WEB_APP_DESTINATION = 'D:\FlutterDevelopment\projects\chatgpt_check_web'



deploy-web:
	@echo "<<<<<<<<<<<<<<<        Clean existing repository...       >>>>>>>>>>>>>>>>>>"
	flutter clean

	@echo "<<<<<<<<<<<<<<<        Getting packages...       >>>>>>>>>>>>>>>>>>"
	flutter pub get

	@echo "<<<<<<<<<<<<<<<        Building for web...       >>>>>>>>>>>>>>>>>>"
	flutter build web --base-href $(BASE_HREF) --release

	@echo "<<<<<<<<<<<<<<<        Deploying flutter app to git repository       >>>>>>>>>>>>>>>>>>"
	Make_deploying_flutter_app_to_git_repository.cmd

	@echo "<<<<<<<<<<<<<<<        copy the build/web to web app destination       >>>>>>>>>>>>>>>>>>"
	robocopy $(BUILD_SOURCE) $(WEB_APP_DESTINATION) /E /IS

	@echo "<<<<<<<<<<<<<<<        Deploying web app to git repository       >>>>>>>>>>>>>>>>>>"
	Make_deploying_web_app_to_git_repository.cmd

	@echo "<<<<<<<<<<<<<<<               Finished Deploy, Now the web app is LIVE               >>>>>>>>>>>>>>>>>>"
	@echo "<<<<<<<<<<<<<<< follow this link: https://salahalshafey.github.io/chatgpt_check_web/ >>>>>>>>>>>>>>>>>>"

.PHONY: deploy-web