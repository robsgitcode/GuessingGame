all: readme.md

readme.md: guessinggame.sh
	echo '# Robs Guessing Game Project' > readme.md
	echo ' ' >> readme.md
	echo -n "This make was run on " >> readme.md
	date "+%H:%M:%S  %d/%m/%y" >> readme.md
	echo ' ' >> readme.md
	echo -n "guessinggame.sh contains the following number of lines: " >> readme.md
	wc -l guessinggame.sh | egrep -o "[0-9]+" >> readme.md

clean:
	rm guessinggame.sh readme.md

