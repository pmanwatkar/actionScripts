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
    "image_id:",
    "min_count:",
    "max_count:",
    "KeyName::", // Optional value
    "SecurityGroup::", // Optional value
    "SecurityGroupId::", // Optional value
    "UserData::", // Optional value
    "AddressingType::", // Optional value
    "InstanceType::", // Optional value
    "Placement::", // Optional value
    "KernelId::", // Optional value
    "RamdiskId::", // Optional value
    "BlockDeviceMapping::", // Optional value
    "Monitoring.Enabled::", // Optional value
    "SubnetId::", // Optional value
    "DisableApiTermination::", // Optional value
    "InstanceInitiatedShutdownBehavior::", // Optional value
    "License::", // Optional value
    "PrivateIpAddress::", // Optional value
    "ClientToken::", // Optional value
    "NetworkInterface::", // Optional value
    "IamInstanceProfile::", // Optional value
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
if (isset($options["image_id"]) && isset($options["min_count"]) && isset($options["max_count"])) {
    $image_id = $options["image_id"];
    $min_count = $options["min_count"];
    $max_count = $options["max_count"];
    $opt = array();
    if (isset($options['KeyName'])) {
        $opt['KeyName'] = $options['KeyName'];

    }

    if (isset($options['SecurityGroup'])) {
        $opt['SecurityGroup'] = $options['SecurityGroup'];

    }
    if (isset($options['SecurityGroupId'])) {
        $opt['SecurityGroupId'] = $options['SecurityGroupId'];

    }
    if (isset($options['UserData'])) {
        $opt['UserData'] = $options['UserData'];

    }
    if (isset($options['AddressingType'])) {
        $opt['AddressingType'] = $options['AddressingType'];

    }
    if (isset($options['InstanceType'])) {
        $opt['InstanceType'] = $options['InstanceType'];

    }
    if (isset($options['Placement'])) {
        $opt['Placement'] = $options['Placement'];

    }
    if (isset($options['KernelId'])) {
        $opt['KernelId'] = $options['KernelId'];

    }
    if (isset($options['RamdiskId'])) {
        $opt['RamdiskId'] = $options['RamdiskId'];

    }
    if (isset($options['BlockDeviceMapping'])) {
        $opt['BlockDeviceMapping'] = $options['BlockDeviceMapping'];

    }
    if (isset($options['Monitoring.Enabled'])) {
        $opt['Monitoring.Enabled'] = $options['Monitoring.Enabled'];

    }
    if (isset($options['SubnetId'])) {
        $opt['SubnetId'] = $options['SubnetId'];

    }
    if (isset($options['DisableApiTermination'])) {
        $opt['DisableApiTermination'] = $options['DisableApiTermination'];

    }
    if (isset($options['InstanceInitiatedShutdownBehavior'])) {
        $opt['InstanceInitiatedShutdownBehavior'] = $options['InstanceInitiatedShutdownBehavior'];

    }
    if (isset($options['License'])) {
        $opt['License'] = $options['License'];

    }
    if (isset($options['PrivateIpAddress'])) {
        $opt['PrivateIpAddress'] = $options['PrivateIpAddress'];

    }
    if (isset($options['ClientToken'])) {
        $opt['ClientToken'] = $options['ClientToken'];

    }
    if (isset($options['NetworkInterface'])) {
        $opt['NetworkInterface'] = $options['NetworkInterface'];

    }
    if (isset($options['IamInstanceProfile'])) {
        $opt['IamInstanceProfile'] = $options['IamInstanceProfile'];

    }

    if (isset($options['curlopts'])) {
        $opt['curlopts'] = $options['curlopts'];

    }
    if (isset($options['returnCurlHandle'])) {
        $opt['returnCurlHandle'] = $options['returnCurlHandle'];

    }


    $response = $ec2->run_instances($image_id, $min_count, $max_count, $opt);
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

