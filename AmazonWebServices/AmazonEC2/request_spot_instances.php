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
    "spot_price:",
    "InstanceCount::",
    "Type::",
    "ValidFrom::",
    "ValidUntil::",
    "LaunchGroup::",
    "AvailabilityZoneGroup::",
    "LaunchSpecification::",
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
$ec2 = new AmazonEC2($creds);
if (isset($options["spot_price"])) {
    $spot_price = $options["spot_price"];
    $opt = array();
    if (isset($options['InstanceCount'])) {
        $opt['InstanceCount'] = $options['InstanceCount'];

    }
    if (isset($options['Type'])) {
        $opt['Type'] = $options['Type'];

    }
    if (isset($options['ValidFrom'])) {
        $opt['ValidFrom'] = $options['ValidFrom'];

    }
    if (isset($options['ValidUntil'])) {
        $opt['ValidUntil'] = $options['ValidUntil'];

    }
    if (isset($options['LaunchGroup'])) {
        $opt['LaunchGroup'] = $options['LaunchGroup'];

    }
    if (isset($options['AvailabilityZoneGroup'])) {
        $opt['AvailabilityZoneGroup'] = $options['AvailabilityZoneGroup'];

    }
    if (isset($options['LaunchSpecification'])) {
        $opt['LaunchSpecification'] = $options['LaunchSpecification'];

    }
    if (isset($options['curlopts'])) {
        $opt['curlopts'] = $options['curlopts'];

    }
    if (isset($options['returnCurlHandle'])) {
        $opt['returnCurlHandle'] = $options['returnCurlHandle'];

    }


    $response = $ec2->request_spot_instances($spot_price, $opt);
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
