DISPLAY=build/
APPIMAGETOOL_URL=https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
APPIMAGETOOL=appimagetool-x86_64.AppImage
MINC_TOOLKIT_IMAGE=docker.io/nistmni/minc-toolkit:1.9.18


Display.AppImage: Display.AppDir $(APPIMAGETOOL)
	./$(APPIMAGETOOL) $< $@

Display.AppDir: root
	docker create --name=copy-display-from-minc $(MINC_TOOLKIT_IMAGE)
	docker cp copy-display-from-minc:/opt/minc/1.9.18 $@
	docker rm copy-display-from-minc
	cp -rv $</* $@/

$(APPIMAGETOOL):
	wget -O $@ $(APPIMAGETOOL_URL)
	chmod +x $(APPIMAGETOOL)

clean:
	$(RM) -r *.AppImage Display.AppDir

.PHONY: clean
