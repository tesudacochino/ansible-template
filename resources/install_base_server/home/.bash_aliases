for i in ~/bin/serverconf/bashrc.d/*; do [ -x "$i" ] || continue; . "$i"; done
for i in ~/.ansible.d/bashrc.d/*; do [ -x "$i" ] || continue; . "$i"; done
for i in ~/.bashrc.d/*; do [ -x "$i" ] || continue; . "$i"; done

