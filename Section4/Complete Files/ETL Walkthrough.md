## The sources

CMS.gov - https://www.cms.gov/research-statistics-data-systems/prescription-drug-plan-formulary-pharmacy-network-and-pricing-information-files-download

The SQLite database with all of the data staged and trasformed: https://www.dropbox.com/sh/r10rmhhg6gxn7uh/AABgU2qi06yf0RwcM31RtlN2a?dl=0

## Staging the text files

We will be selecting the plan information, basic drugs formulary and the beneficary cost files from the downloaded file sent and unzipping them. 

DB Browser allows you to rename the table at the time of the import in the table name box - I chose to rename the files so everything would match. This is optional. 

### Importing the data

Using DB Browser, click on Import CSV file from the File/Import menu and select the following options in the dialog box that appears:
- Column names in first line: Check
- Field seperator: |
- Quote character: "
- Encoding: UTF-8
- Trim FIelds: Check

Click on advanced and then click:
- Disable data type detection

Do this for each file:
- stage_pi_202210.txt
- stage_bcf_202210.txt
- stage_bdf_202210.txt

_Please note: in a production environment with periodic reloads you would not include a date in the file or table name. I left them in here as a note to future me that I may want to pull new versions from time to time._

## Review and plan for translations

Using the data browser and comparing the data that was loaded to the data definition documentation (PUFRecordLayout_Monthly 2023.xlsx) start to plan your data load. 

### Plan Information

Even the most cursory look at this table will reveal that it is not normalized. There is a record for every location a plan services. If we want to examine drug prices then we need to get one record per plan to anchor our queries (Remember that each row on a join is multiplied by the records it matches in the joining table)

You will need to:
- create a plan table
- create a location table 
- write two queries to populate these new tables. 

See the plan information tab in the project file for the commands I used if you get stumped.

### Basic Drugs Formulary

This is where things get more complicated. Looking at the table you will see two columns that are obviously keys for additional tables or recordsets. In a prodcution environment you would need to investigate both rxcui and ndc to come up with data to translate these fields to some dataset containing pharmeceutical data. 

This is quite a rabbit hole and we are not going to go down this one. There is another file I have staged that closes this loop. For now, let's just stage the file and write a query to translate the plan ID.

You will need to:
- create a basicdrugsformulary file
- write a query to join in the plan information table and insert the records to your new table. 

### Beneficiary Cost

There is no way to understand this file without the PUF spreadsheet (by the way - PUF stands for Public Use File). We spent a good amount of time on this transalation in class and it is a good example of doing rule based translations using case statements. The completed query is in the cmspdp.sqlbpro project file. I don't blame you for referring to it - or even copying it. 

If you are tremendously serious about using SQL to translate data then:
- Create a final Beneficiary Cost table
- Write a translation query to translate and insert the rows into your final table. 
	- (My example does not include the mail in pharmacies)

### Creating a lookup table for the NDC code.

We will be importing the stage_ProductPackageNDC.txt This file is tab-seperated so you will need to change the import settings. 


