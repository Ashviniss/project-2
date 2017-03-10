/*Steps to execute the statewise project.

## convert the data xml to CSV */

A = load 'StatewiseDistrictwisePhysicalProgress.xml' using org.apache.pig.piggybank.storage.XMLLoader('row') as (x:chararray);
B = foreach A generate REPLACE(x,'[\\n]','"') as x;
C = foreach B generate REGEX_EXTRACT_ALL(x,'.*(?:<District_Name>)([^<]*).*(?:<Project_Objectives_IHHL_TOTAL>)([^<]*).*(?:<Project_Performance-IHHL_TOTAL>)([^<]*).*');
D = foreach C generate FLATTEN(($0));
dump D;
STORE D into 'xml_to_csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage();
ash = load 'xml_to_csv/' using PigStorage(',') as (dist_name : chararray,obj : int,perf : int);
dump ash;
filtA = FILTER ash by obj== perf;
dump filtA;



---------------------------------
udf code
 Register '/home/acadgild/workspace/myBPL.jar'
ash = load 'spooldir/xml_to_csv/ash.txt' using PigStorage(',') as (dist_name : chararray,obj : int,perf : int);
dump ash;
res = foreach ash generate myBPL.BPL_percentage(dist_name,obj,
STORE res into '/home/acadgild/spooldir/';




