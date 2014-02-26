<?php
/**
 * User: Suraj.Savita
 * Date: 6/26/12
 * Time: 3:35 PM
 */


error_reporting(-1);

// Set plain text headers
header("Content-type: text/plain; charset=utf-8");
ini_set('include_path', ini_get('include_path') . ';C:\wamp\www');

// Include the SDK


//    $___ACCESS_KEEEY = $_GET["access_key"];
//    $___SECRET_KEEEY = $_GET["secret_key"];
require_once '/sdk-1.5.7/sdk.class.php';
require_once '/include/get_account_name_creds.php';

$shortopts = "abc"; // These options do not accept values

$longopts = array(
    "InstanceId::", // Required value
    "Filter::", // Optional value
    "curlopts::", // No value
    "returnCurlHandle::", // No value
);
$options = getopt($shortopts, $longopts);


$options = $params;

$err = "Not sufficient arguments";
$creds = array();
$creds['key'] = $access_key;
$creds['secret'] = $secret_key;
//  print_r($creds);
$ec2 = new AmazonEC2($creds);


$opt = array();

if (isset($options['InstanceId'])) {
    $opt['InstanceId'] = $options["InstanceId"];

}

if (isset($options['Filter'])) {
    $opt['Filter'] = $options['Filter'];

}

if (isset($options['curlopts'])) {
    $opt['curlopts'] = $options['curlopts'];

}
if (isset($options['returnCurlHandle'])) {
    $opt['returnCurlHandle'] = $options['returnCurlHandle'];

}


$response = $ec2->describe_instances($opt);
//        print_r($response->isOK());
//        print_r($response);
$file = fopen(dirname(__FILE__) . '/' . basename(__FILE__, '.php') . '-' . time() . ".json", 'w');
fwrite($file, json_encode($response));
fclose($file);
return $response;


