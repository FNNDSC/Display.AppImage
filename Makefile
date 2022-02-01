DISPLAY=build/
APPIMAGETOOL_URL=https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
APPIMAGETOOL=appimagetool-x86_64.AppImage
MINC_TOOLKIT_IMAGE=docker.io/nistmni/minc-toolkit:1.9.16


Display.AppImage: Display.AppDir $(APPIMAGETOOL)
	./$(APPIMAGETOOL) $< $@

Display.AppDir: root
	docker create --name=copy-display-from-minc $(MINC_TOOLKIT_IMAGE)
	docker cp minc:/opt/minc/1.9.16 $@
	docker rm copy-display-from-minc
	cp -rv $</* $@/

$(APPIMAGETOOL):
	wget -O $@ $(APPIMAGETOOL_URL)
	chmod +x $(APPIMAGETOOL)

clean:
	$(RM) *.AppImage

.PHONY: clean
