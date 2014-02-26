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
//require_once '/test.php';

//$shortopts = "abc"; // These options do not accept values
//
//$longopts = array(
//    "ImageId::", // Required value
//    "Owner::", // Optional value
//    "ExecutableBy::", // Optional value
//    "Filter::", // Optional value
//    "curlopts::", // No value
//    "returnCurlHandle::", // No value
//);
//$options = getopt($shortopts, $longopts);
//$options = My_parser($options);


$options = $params;

$err = "Not sufficient arguments";
$creds = array();
$creds['key'] = $access_key;
$creds['secret'] = $secret_key;
//  print_r($creds);
$ec2 = new AmazonEC2($creds);


//$opt = array();
echo "Start \$options variable :".PHP_EOL;
var_dump($options);
echo "Stop \$options variable :".PHP_EOL;

//echo "decoded \r\n";
//print_r(json_decode($options['Filter'],true));
if (isset($options['ImageId'])) {
    $opt['ImageId'] = $options["ImageId"];
//    var_dump($opt);

}
if (isset($options['Owner'])) {
    $opt['Owner'] = $options['Owner'];

}
if (isset($options['ExecutableBy'])) {
    $opt['ExecutableBy'] = $options['ExecutableBy'];

}


if (isset($options['Filter'])) {
    $opt['Filter'] = $options['Filter']; //array(array('Name' => 'hypervisor','Value' => 'ovm'),) ;

}

if (isset($options['curlopts'])) {
    $opt['curlopts'] = $options['curlopts'];

}
if (isset($options['returnCurlHandle'])) {
    $opt['returnCurlHandle'] = $options['returnCurlHandle'];

}

var_dump($opt);
$response = $ec2->describe_images($opt);
//        print_r($response->isOK());
//        print_r($response);
$file = fopen(dirname(__FILE__) . '/' . basename(__FILE__, '.php') . '-' . time() . ".json", 'w');
fwrite($file, json_encode($response));
fclose($file);
return $response;


