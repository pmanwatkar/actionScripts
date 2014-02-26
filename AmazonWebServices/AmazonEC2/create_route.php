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
    "route_table_id:", // Required Value
    "destination_cidr_block:", // Required Value
    "GatewayId::", // Optional Value
    "InstanceId::", // Optional Value
    "NetworkInterfaceId::", // Optional Value
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
if (isset($options["route_table_id"]) && isset($options["destination_cidr_block"])) {
    $route_table_id = $options["route_table_id"];
    $destination_cidr_block = $options["destination_cidr_block"];

    $opt = array();

    if (isset($options['GatewayId'])) {
        $opt['GatewayId'] = $options['GatewayId'];

    }
    if (isset($options['InstanceId'])) {
        $opt['InstanceId'] = $options['InstanceId'];

    }
    if (isset($options['NetworkInterfaceId'])) {
        $opt['NetworkInterfaceId'] = $options['NetworkInterfaceId'];

    }
    if (isset($options['curlopts'])) {
        $opt['curlopts'] = $options['curlopts'];

    }
    if (isset($options['returnCurlHandle'])) {
        $opt['returnCurlHandle'] = $options['returnCurlHandle'];

    }


    $response = $ec2->create_route($route_table_id, $destination_cidr_block, $opt);
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




