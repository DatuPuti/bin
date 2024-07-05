git config --global user.name "DatuPuti"
git config --global user.email "tborland@thomasborland.ca"
git config --global core.editor "nvim"
git config --global credential.helper store

## create new repository on the commandline
echo "# bin" >> README.md
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/DatuPuti/bin.git
git push -u origin main

## or push an existing repository from the commandline
# git remote add origin https://github.com/DatuPuti/bin.git
# git branch -M main
# git push -u origin main
