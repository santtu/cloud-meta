all: csv

csv: aws/services.csv aws/services-state.csv aws/services-regions.csv \
	aws/zones.csv

%.csv: %.ods
	unoconv -f csv $<

clean:
	-rm aws/*.csv

.PHONY: all csv
