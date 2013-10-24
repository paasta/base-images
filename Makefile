
prepare: cookbooks/.done
prepare: template.json

cookbooks/.done: Berksfile.lock
	rm -rf cookbooks
	berks install --path cookbooks
	touch cookbooks/.done

template.json: template.yaml
	cat template.yaml | ./yaml2json > template.json

.PHONY: prepare
