D:
cd D:\FlutterDevelopment\projects\chatgpt_check_extension
git status 
timeout 60
git add *
git commit -m "Deploy Version 1.0.0"
git push origin main
git status 
timeout -1