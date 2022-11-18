post:
	@echo "New post: ${title}"
	formattedTitle=$$(echo "$(title)" | tr '[:upper:]' '[:lower:]' | tr -c a-z0-9 - | sed 's/--\+/-/g;s/^-\+//;s/-\+$$//'); \
	hugo new posts/$$formattedTitle.md

wget:
	@echo "Downloader fil til: $(url)"
	wget -P static/$(url)

dev:
	hugo server -D

commit:
	git add . && git commit -m "Content" && git push origin master

