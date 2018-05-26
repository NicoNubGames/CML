:: recursively move files from lib and src into macro folder

for /r %x in (lib) do move "%x" "%appdata%\.minecraft\liteconfig\common\macros"
for /r %x in (src) do move "%x" "%appdata%\.minecraft\liteconfig\common\macros"