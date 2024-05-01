# Makefile for pushing changes to GitHub && deploying Flutter web app to GitHub Pages

# Update These Variables
BASE_HREF = '/chatgpt_check_web/'
CURRENT_APP_DESTINATION = 'D:\FlutterDevelopment\projects\chatgpt_check_extension'
BUILD_SOURCE = 'D:\FlutterDevelopment\projects\chatgpt_check_extension\build\web'
WEB_APP_DESTINATION = 'D:\FlutterDevelopment\projects\chatgpt_check_web'
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')


deploy-web:
	@echo "Clean existing repository..."
	flutter clean

	@echo "Getting packages..."
	flutter pub get

	@echo "Building for web..."
	flutter build web --base-href $(BASE_HREF) --release

	@echo "Deploying flutter app to git repository"
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git push origin main

	@echo "copy the build/web to "
	robocopy $(BUILD_SOURCE) $(WEB_APP_DESTINATION) /E /IS

	@echo "Deploying web app to git repository"
	cd $(WEB_APP_DESTINATION) && \
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git push origin main && \
	cd $(CURRENT_APP_DESTINATION)

	@echo "🟢 Finished Deploy, Now the web app is LIVE 🟢"
	@echo "🟢 follow this link: https://salahalshafey.github.io/chatgpt_check_web/ 🟢"

.PHONY: deploy-web