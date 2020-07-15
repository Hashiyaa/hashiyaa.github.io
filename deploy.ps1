Get-ChildItem -Path '.\public' -Exclude .git | Remove-Item -Recurse -Force

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
Set-Location .\public

# Add changes to git.
git add .

# Commit changes.
$msg = $args[0]
git commit -m $msg

# Push source and build repos.
git push origin master

Set-Location ..

git add .

git commit -m $msg

git push origin master