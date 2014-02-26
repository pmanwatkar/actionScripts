<?php
/**
 * User: Suraj.Savita
 * Date: 6/26/12
 * Time: 3:35 PM
 */


error_reporting(-1);

// Set plain text headers
header("Content-type: text/plain; charset=utf-8");

// Include the SDK


ini_set('include_path', ini_get('include_path') . ';C:\wamp\www');
require_once '/sdk-1.5.7/sdk.class.php';
require_once '/include/get_account_name_creds.php';

$shortopts = "abc"; // These options do not accept values

$longopts = array(
    "ReservedDBInstancesOfferingId::",
    "DBInstanceClass::",
    "Duration::",
    "ProductDescription::",
    "MultiAZ::",
    "MaxRecords::",
    "Marker::",
    "curlopts::",
    "returnCurlHandle::",
);
$options = getopt($shortopts, $longopts);


$options = $params;

$err = "Not sufficient arguments";
$creds = array();
$creds['key'] = $access_key;
$creds['secret'] = $secret_key;
//    print_r($creds);
$rds = new AmazonRDS($creds);

$opt = array();


if (isset($options['ReservedDBInstancesOfferingId'])) {
    $opt['ReservedDBInstancesOfferingId'] = $options['ReservedDBInstancesOfferingId'];

}
if (isset($options['DBInstanceClass'])) {
    $opt['DBInstanceClass'] = $options['DBInstanceClass'];

}

if (isset($options['Duration'])) {
    $opt['Duration'] = $options['Duration'];

}
if (isset($options['ProductDescription'])) {
    $opt['ProductDescription'] = $options['ProductDescription'];

}

if (isset($options['MultiAZ'])) {
    $opt['MultiAZ'] = $options['MultiAZ'];

}
if (isset($options['MaxRecords'])) {
    $opt['MaxRecords'] = $options['MaxRecords'];

}
if (isset($options['Marker'])) {
    $opt['Marker'] = $options['Marker'];

}

if (isset($options['curlopts'])) {
    $opt['curlopts'] = $options['curlopts'];

}
if (isset($options['returnCurlHandle'])) {
    $opt['returnCurlHandle'] = $options['returnCurlHandle'];

}


$response = $rds->describe_reserved_db_instances_offerings($opt);
//        print_r($response->isOK());
//        print_r($response);

$file = fopen(dirname(__FILE__) . '/' . basename(__FILE__, '.php') . '-' . time() . ".json", 'w');
fwrite($file, json_encode($response));
fclose($file);

return $response;

