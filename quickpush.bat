set /a month=%date:~3,2%
set /a day=%date:~0,2%
set MSG="%month%-%day% [quickpush]"

git add .
git commit -m %MSG%
git push