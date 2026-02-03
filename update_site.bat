@echo off
setlocal
cd /d "%~dp0"

git add .
set /p msg=Message de commit (laisse vide pour 'update site'): 
if "%msg%"=="" set msg=update site

git diff --cached --quiet
if %errorlevel%==0 (
  echo Aucun changement a valider.
) else (
  git commit -m "%msg%"
)

git pull --rebase
git push
pause
