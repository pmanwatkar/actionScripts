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
    "region:",
);
$options = getopt($shortopts, $longopts);


$options = $params;

$err = "Not sufficient arguments";
$creds = array();
$creds['key'] = $access_key;
$creds['secret'] = $secret_key;
//    print_r($creds);
$sdb = new AmazonSDB($creds);
if (isset($options["region"])) {
    $region = $options["region"];


    $response = $sdb->set_region ( $region );
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
<html xmlns:mso="urn:schemas-microsoft-com:office:office" xmlns:msdt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882"><head>
<!--[if gte mso 9]><xml>
<mso:CustomDocumentProperties>
<mso:ContentType msdt:dt="string">Document</mso:ContentType>
</mso:CustomDocumentProperties>
</xml><![endif]-->
<title></title></head>