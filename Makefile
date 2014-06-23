GENERATED = \
	aws/services.csv aws/services-state.csv \
	aws/services-regions.csv aws/zones.csv

all: $(GENERATED)

%.csv: %.ods
	unoconv -f csv $<

clean:
	-rm $(GENERATED)

.PHONY: all clean
