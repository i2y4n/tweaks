APPID = org.webosinternals.tweaks

package: clean
	palm-package enjo-app package node-service
	ar q ${APPID}_*.ipk pmPostInstall.script
	ar q ${APPID}_*.ipk pmPreRemove.script

test: package
	- palm-install -r ${APPID}
	palm-install ${APPID}_*.ipk
	palm-launch ${APPID}

clean:
	find . -name '*~' -delete
	rm -f ipkgtmp*.tar.gz
	rm -f ${APPID}_*.ipk

clobber: clean
