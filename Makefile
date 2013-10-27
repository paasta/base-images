
prepare: cookbooks/.done
prepare: template.json

cookbooks/.done: Cheffile Cheffile.lock
	librarian-chef install
	touch cookbooks/.done

template.json: template.yaml
	cat template.yaml | ./yaml2json > template.json

.PHONY: prepare
