# Creates symbolic links in linux/unix machines
# Synatx:  ln -s {/path/to/file/folder-name} {link-name}
# Example: ln -s /shared/sales/data/file.txt sales.data.txt
# 


P=${1?" /path/to/file/folder-name "}
Q=${2?" link-name "}

if [ -e "$P" ];

then

ln -s "$P" "$Q"

else

echo "File/folder $P does not exists "

fi

