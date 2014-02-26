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
    "Attribute::",
    "OperationType::",
    "UserId::",
    "UserGroup::",
    "ProductCode::",
    "Value::",
    "LaunchPermission::",
    "Description.Value::",
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
if (isset($options["image_id"])) {
    $image_id = $options["image_id"];
    $opt = array();

    if (isset($options['Attribute'])) {
        $opt['Attribute'] = $options['Attribute'];

    }
    if (isset($options['OperationType'])) {
        $opt['OperationType'] = $options['OperationType'];

    }
    if (isset($options['UserId'])) {
        $opt['UserId'] = $options['UserId'];

    }
    if (isset($options['UserGroup'])) {
        $opt['UserGroup'] = $options['UserGroup'];

    }
    if (isset($options['ProductCode'])) {
        $opt['ProductCode'] = $options['ProductCode'];

    }
    if (isset($options['Value'])) {
        $opt['Value'] = $options['Value'];

    }
    if (isset($options['LaunchPermission'])) {
        $opt['LaunchPermission'] = $options['LaunchPermission'];

    }
    if (isset($options['Description.Value'])) {
        $opt['Description.Value'] = $options['Description.Value'];

    }
    if (isset($options['curlopts'])) {
        $opt['curlopts'] = $options['curlopts'];

    }
    if (isset($options['returnCurlHandle'])) {
        $opt['returnCurlHandle'] = $options['returnCurlHandle'];

    }


    $response = $ec2->modify_image_attribute($image_id, $opt);
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
