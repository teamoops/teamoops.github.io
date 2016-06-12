help: # shows help
	@cat makefile | grep ':' | grep '#' | grep -v 'Makefile' | sed 's/:.*#/#/g' | column -t -s'#'

build: writeups projects # build the site
	jekyll build

writeups: # copy writeups over
	cd _writeups/ && git submodule update
	find ./_writeups/ -type f -name '*.md' | grep -v 'README' | xargs -I'%' cp % ./_posts/

projects: # generate _data/projects.yml
	curl -s https://github.com/teamoops | \
		grep repo-list-name -A1 | \
		grep -o 'href="[^"]\+"' | \
		sed -e 's/href="//' | \
		tr -d '"' | \
		xargs -I'%' basename % | \
		xargs -I'%' printf "- name: %\n  url: https://github.com/teamoops/%\n" > _data/projects.yml

push: build # build and upload site
	git add --all
	git commit -m "update ($(date))"
	git push origin master
