# Cloud Service Metadata Repository #

Here you will find *metadata* in a *computer-friendly format* about
[Amazon Web Services'](http://aws.amazon.com/) (AWS) cloud
infrastructure such as:

* When a service (such as `ec2` or `kinesis`) became available
* Which services are regionless (`iam`), operate in specific regions
  (`s3`) and which are dependent on availability zones within a region
  (`ec2`)
* What services are available in each region and when they became
  available in those regions
* How many availability zones are in a region (and when there were
  changes)

The dataset is most easily usable as a set of the following CSV files:

* [`aws/services.csv`](aws/services.csv) contains a "main" list of
  services and whether they work in regions and if they are dependent
  on zones.
* [`aws/services-state.csv`](aws/services-state.csv) contains
  information when a service was introduced, and what was its
  availability (limited preview / limited beta, public beta and
  general availability/GA).
* [`aws/services-regions.csv`](aws/services-regions.csv) contains
  information for services that operate in a specific region about
  where they are available and when they became available in the
  particular region.
* [`aws/zones.csv`](aws/zones.csv) contains information about each
  region and how many availability zones they contain (and when).

**This is just a dataset repository. There is nothing functional (no
code) in this repository.** You are free to use the data freely (as
long as giving me the credit for the data) as defined by the CC BY 4.0
license.

## Data format description ##

Here are samples as first few lines of each file:

    ==> aws/services-regions.csv <==
    date,service,region,accurate,description
    2004-11-03,sqs,us-east-1,1,http://aws.amazon.com/about-aws/whats-new/2004/11/03/introducing-the-amazon-simple-queue-service/

    ==> aws/services-state.csv <==
    date,service,limited,beta,ga,accurate,description
    2004-10-04,alexa,0,0,1,1,"Announcement http://aws.amazon.com/about-aws/whats-new/2004/10/04/introducing-the-alexa-web-information-service/ doesn't state beta, and earliest product page accessible https://web.archive.org/web/20060223102040/http://www.amazon.com/gp/browse.html?node=12782661 also doesn't state beta (GA). Since no contradictory information, assume GA on release."

    ==> aws/services.csv <==
    service,name,hasregions,haszones,description
    alexa,Alexa Web Information Service,0,0,http://aws.amazon.com/awis/

    ==> aws/zones.csv <==
    date,region,zones,accurate,description
    2007-10-22,us-east-1,1,1,Since zones were introduced 2008-03-27 before that there were ”no” zones – so one only.

* All files start with a header row.
* All dates are ISO 8601 format (YYYY-MM-DD). Dates only.
* Boolean values (`accurate`, `hasregions` and `haszones` columns) are
  stored as `1` for a true value and `0` for a false value.
* `description` field is for human consumption only and contains
  further details such as links to announcements and rationale for
  judgement calls.
* Zone information is included only for zones that actually available
  for use as beta or GA **but not for limited access** (like China as
  of 2014-06-23). Note that `govcloud` is included because although it
  has limited access (US public sector only) it is generally available
  to all those that are allowed to use it.

The names and format of these data files may change in the
future. Consider the dataset as a beta release :-)

There's also a [`aws/updated.csv`](updated.csv) file which contains
just one column and one data row containing one date value being the
date that this dataset is considered to be up-to-date to.

## Why and how? ##

I needed this metadata for a research project (and couldn't find
suitable data online), and it was quite a bit of effort (about 4-5
days of work) so I wanted to share the data in the hope this will save
someone a lot of work and someone will find it useful. (I'd be
delighted to hear if you do find it useful.)

To collect the data I primarily went through
[all news items from AWS](http://aws.amazon.com/new/). I used the
[Internet Archive's Wayback Machine](https://archive.org/web/) a lot
to check up on older versions of product pages, FAQs, infrastructure
information etc. I also searched through AWS developer forum
announcements. Jeff Barr's blog posts in the
[AWS blog](http://aws.amazon.com/blogs/aws/) were often also useful
source of information.

## Contributing ##

If you spot an error in the data, please do one of:

1. Edit the master version (the `.ods` file), run `make` to update CSV
   versions of the files and submit a pull request for those
   changes. (You'll need
   [`unoconv`](https://github.com/dagwieers/unoconv) installed for
   this to work.) **or**
2. Edit the csv in GitHub's editor and send it as a pull request **or**
3. Open an issue, or send email, or get somehow in touch with the
   updated information.

All dates are in ISO 8601 format (YYYY-MM-DD). Many files contain a
`accurate` column which should be `1` (TRUE value) if the date can be
confirmed from sources and `0` if it is interpolated from available
data.

**Please note that all data must be backed up with references.** Use
the `description` column for references and any rationale for
judgement calls.

If you want to add entirely new data (as opposed to fixing errors or
providing more accurate date information) please note that to keep the
`aws/updated.csv` file meaningful **all changes up to the latest
date** must be included in the dataset.

## License ##

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Dataset" property="dct:title" rel="dct:type">Cloud Metadata</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/santtu/cloud-meta" property="cc:attributionName" rel="cc:attributionURL">Santeri Paavolainen</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.
