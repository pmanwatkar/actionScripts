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
    "db_parameter_group_name:",
    "db_parameter_group_family:",
    "description:",
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
if (isset($options["db_parameter_group_name"]) && isset($options["db_parameter_group_family"]) && isset($options["description"])) {
    $db_parameter_group_name = $options["db_parameter_group_name"];
    $db_parameter_group_family = $options["db_parameter_group_family"];
    $description = $options["description"];
    $opt = array();

    if (isset($options['curlopts'])) {
        $opt['curlopts'] = $options['curlopts'];

    }
    if (isset($options['returnCurlHandle'])) {
        $opt['returnCurlHandle'] = $options['returnCurlHandle'];

    }


    $response = $rds->create_db_parameter_group($db_parameter_group_name, $db_parameter_group_family, $description, $opt);
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
