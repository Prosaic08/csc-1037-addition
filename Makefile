
# A poor man's test framework.
#
# We just run each implementation in various ways and grep for the expected result.
#
# Make will fail if any of the greps below fail.

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
	#
	# Test Python3 implementation.
	python3 src/add-python3.py | wc -l | $(grep) 1
	python3 src/add-python3.py | $(grep) 0
	python3 src/add-python3.py 1 2 3 | wc -l | $(grep) 1
	python3 src/add-python3.py 1 2 3 | $(grep) 6
	python3 src/add-python3.py 1 -2 3 | wc -l | $(grep) 1
	python3 src/add-python3.py 1 -2 3 | $(grep) 2
