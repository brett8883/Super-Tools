@echo off
cd tools
del dumldore*
del *.bin
del *.md
del master*
del .wget-hsts
rmdir dumldore-master
echo deleted
timeout 1
exit
