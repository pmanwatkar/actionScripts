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
    "reserved_instances_offering_id:", // Required Value
    "instance_count:", // Required Value
    "curlopts::", // Optional Value
    "returnCurlHandle::",
);
$options = getopt($shortopts, $longopts);


$options = $params;

$err = "Not sufficient arguments";
$creds = array();
$creds['key'] = $access_key;
$creds['secret'] = $secret_key;
//    print_r($creds);
$ec2 = new AmazonEC2($creds);
if (isset($options["reserved_instances_offering_id"]) && isset($options["instance_count"])) {
    $reserved_instances_offering_id = $options["reserved_instances_offering_id"];
    $instance_count = $options["instance_count"];

    $opt = array();

    if (isset($options['curlopts'])) {
        $opt['curlopts'] = $options['curlopts'];

    }
    if (isset($options['returnCurlHandle'])) {
        $opt['returnCurlHandle'] = $options['returnCurlHandle'];

    }


    $response = $ec2->purchase_reserved_instances_offering($reserved_instances_offering_id, $instance_count, $opt);
//        print_r($response->isOK());
//        print_r($response);
    $file = fopen(dirname(__FILE__) . '/' . basename(__FILE__, '.php') . '-' . time() . ".json", 'w');
    fwrite($file, json_encode($response));
    fclose($file);
    return $response;

} else {
//    print_r($err);

    return $err;

}




