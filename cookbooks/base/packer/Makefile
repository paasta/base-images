
prepare: cookbooks/.done

cookbooks/.done: ../Berksfile.lock
	rm -rf cookbooks
	cd .. && berks install --path packer/cookbooks
	rm -rf cookbooks/base/packer
	touch cookbooks/.done

.PHONY: prepare
