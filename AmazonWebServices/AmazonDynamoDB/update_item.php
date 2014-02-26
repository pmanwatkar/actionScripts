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
    "TableName::",
    "Key::",
    "AttributeUpdates::",
    "Expected::",
    "ReturnValues::",
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
$ddb = new AmazonDynamoDB($creds);


$opt = array();

if (isset($options['TableName'])) {
    $opt['TableName'] = $options['TableName'];

}
if (isset($options['Key'])) {
    $opt['Key'] = $options['Key'];

}
if (isset($options['AttributeUpdates'])) {
    $opt['AttributeUpdates'] = $options['AttributeUpdates'];

}if (isset($options['Expected'])) {
    $opt['Expected'] = $options['Expected'];

}if (isset($options['ReturnValues'])) {
    $opt['ReturnValues'] = $options['ReturnValues'];

}
if (isset($options['curlopts'])) {
    $opt['curlopts'] = $options['curlopts'];

}
if (isset($options['returnCurlHandle'])) {
    $opt['returnCurlHandle'] = $options['returnCurlHandle'];

}


$response = $ddb->update_item( $opt );
//        print_r($response->isOK());
//        print_r($response);

$file = fopen(dirname(__FILE__) . '/' . basename(__FILE__, '.php') . '-' . time() . ".json", 'w');
fwrite($file, json_encode($response));
fclose($file);

return $response;

