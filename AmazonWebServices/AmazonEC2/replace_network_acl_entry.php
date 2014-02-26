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
    "network_acl_id:",
    "rule_number:",
    "protocol:",
    "rule_action:",
    "egress:",
    "cidr_block:",
    "Icmp::",
    "PortRange::",
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
if (isset($options["network_acl_id"]) && isset($options["rule_number"]) && isset($options["protocol"]) && isset($options["rule_action"]) && isset($options["egress"]) && isset($options["cidr_block"])) {
    $network_acl_id = $options["network_acl_id"];
    $rule_number = $options["rule_number"];
    $protocol = $options["protocol"];
    $rule_action = $options["rule_action"];
    $egress = $options["egress"];
    $cidr_block = $options["cidr_block"];
    $opt = array();
    if (isset($options['Icmp'])) {
        $opt['Icmp'] = $options['Icmp'];

    }
    if (isset($options['PortRange'])) {
        $opt['PortRange'] = $options['PortRange'];

    }
    if (isset($options['curlopts'])) {
        $opt['curlopts'] = $options['curlopts'];

    }
    if (isset($options['returnCurlHandle'])) {
        $opt['returnCurlHandle'] = $options['returnCurlHandle'];

    }


    $response = $ec2->replace_network_acl_entry($network_acl_id, $rule_number, $protocol, $rule_action, $egress, $cidr_block, $opt);
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
