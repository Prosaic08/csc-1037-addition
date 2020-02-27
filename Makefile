
# A poor man's test framework.
#
# We just run each implementation in various ways and grep for the expected result.
#
# Make will fail if any of the greps below fail.
#
# For additional languages, simply append tests as needed below.
#
# You should know that, for all of the indented lines below, the indetation is
# EXACTLY ONE TAB CHARACTER.  Yes.  It's weird.  But that's how it is.

grep = grep -q -w -x

build:
	$(MAKE) -C src build

test:
	$(MAKE) build
	#
	# Test ZSH implementation.
	zsh src/add-arguments.zsh | wc -l | $(grep) 1
	zsh src/add-arguments.zsh | $(grep) 0
	zsh src/add-arguments.zsh 1 2 3 | wc -l | $(grep) 1
	zsh src/add-arguments.zsh 1 2 3 | $(grep) 6
	zsh src/add-arguments.zsh 1 -2 3 | wc -l | $(grep) 1
	zsh src/add-arguments.zsh 1 -2 3 | $(grep) 2
