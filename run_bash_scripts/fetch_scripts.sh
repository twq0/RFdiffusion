find . -name '*.sh' -exec cp {} test/ \; -exec sh -c 'mv test/$(basename "{}") test/$(echo "{}" | sed "s/\//_/g; s/^\.\(.*\)/\1/")' \;
