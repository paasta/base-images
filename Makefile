
prepare: cookbooks/.done

cookbooks/.done: Berksfile.lock
	rm -rf cookbooks
	berks install --path cookbooks
	touch cookbooks/.done

.PHONY: prepare
