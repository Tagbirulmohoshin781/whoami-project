tool_name=kali-whoami
src_dir=/usr/share
trigger_dir=/usr/bin

install:
	install -d $(trigger_dir)
	install -m 755 kali-whoami $(trigger_dir)/$(tool_name)
	mkdir -p $(src_dir)/$(tool_name)/backups
	cp -r assets $(src_dir)/$(tool_name)/
	chmod -R 755 $(src_dir)/$(tool_name)/assets/scripts
	mkdir -p $(src_dir)/applications
	cp -f assets/kali-whoami.desktop $(src_dir)/applications/
	if [ -d $(src_dir)/kali-menu ]; then \
		mkdir -p $(src_dir)/kali-menu/applications; \
		cp -f assets/kali-whoami.desktop $(src_dir)/kali-menu/applications/; \
	fi

uninstall:
	rm -f $(trigger_dir)/$(tool_name)
	rm -rf $(src_dir)/$(tool_name)
	rm -f $(src_dir)/kali-menu/applications/kali-whoami.desktop
	rm -f $(src_dir)/applications/kali-whoami.desktop

reinstall: uninstall install

.PHONY: install uninstall reinstall
