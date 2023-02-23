DISPLAY=build/
APPIMAGETOOL_URL=https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
APPIMAGETOOL=appimagetool-x86_64.AppImage
MINC_TOOLKIT_IMAGE=docker.io/nistmni/minc-toolkit:1.9.18


Display.AppImage: Display.AppDir $(APPIMAGETOOL)
	./$(APPIMAGETOOL) $< $@

Display.AppDir: root minc-toolkit-artifacts
	mkdir -vp $@/bin $@/lib
	cp -rv root/* minc-toolkit-artifacts/* $@

minc-toolkit-artifacts:
	mkdir -vp $@/bin $@/lib
	docker create --name=copy-display-from-minc $(MINC_TOOLKIT_IMAGE)
	docker cp copy-display-from-minc:/opt/minc/1.9.18/lib/libhdf5.so.103 $@/lib
	docker cp copy-display-from-minc:/opt/minc/1.9.18/lib/libhdf5.so.103.2.0 $@/lib
	docker cp copy-display-from-minc:/opt/minc/1.9.18/bin/Display $@/bin
	docker rm copy-display-from-minc

$(APPIMAGETOOL):
	wget -O $@ $(APPIMAGETOOL_URL)
	chmod +x $(APPIMAGETOOL)

clean:
	$(RM) -r *.AppImage Display.AppDir minc-toolkit-artifacts

.PHONY: clean
