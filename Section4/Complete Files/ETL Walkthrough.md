## The sources

CMS.gov - https://www.cms.gov/research-statistics-data-systems/prescription-drug-plan-formulary-pharmacy-network-and-pricing-information-files-download

## Staging the text files

We will be selecting the plan information, basic drugs formulary and the beneficary cost files from the downloaded file sent and unzipping them. 

DB Browser does not support renaming the table created by the import process. Therefore I have renamed them before importing to save a step.

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

### Basic Drug Information

This is where things get more complicated. Looking at the table you will see two columns that are obviously keys for additional tables or recordsets. In a prodcution environment you would need to investigate both rxcui and ndc to come up with data to translate these fields to some dataset containing pharmeceutical data. 
