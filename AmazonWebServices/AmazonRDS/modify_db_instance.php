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
    "db_instance_identifier:",
    "AllocatedStorage::",
    "DBInstanceClass::",
    "DBSecurityGroups::",
    "ApplyImmediately::",
    "MasterUserPassword::",
    "DBParameterGroupName::",
    "BackupRetentionPeriod::",
    "PreferredBackupWindow::",
    "PreferredMaintenanceWindow::",
    "MultiAZ::",
    "EngineVersion::",
    "AllowMajorVersionUpgrade::",
    "AutoMinorVersionUpgrade::",
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
if (isset($options["db_instance_identifier"])) {
    $db_instance_identifier = $options["db_instance_identifier"];
    $opt = array();

    if (isset($options['AllocatedStorage'])) {
        $opt['AllocatedStorage'] = $options['AllocatedStorage'];

    }
    if (isset($options['DBInstanceClass'])) {
        $opt['DBInstanceClass'] = $options['DBInstanceClass'];

    }
    if (isset($options['DBSecurityGroups'])) {
        $opt['DBSecurityGroups'] = $options['DBSecurityGroups'];

    }
    if (isset($options['ApplyImmediately'])) {
        $opt['ApplyImmediately'] = $options['ApplyImmediately'];

    }
    if (isset($options['MasterUserPassword'])) {
        $opt['MasterUserPassword'] = $options['MasterUserPassword'];

    }
    if (isset($options['DBParameterGroupName'])) {
        $opt['DBParameterGroupName'] = $options['DBParameterGroupName'];

    }
    if (isset($options['BackupRetentionPeriod'])) {
        $opt['BackupRetentionPeriod'] = $options['BackupRetentionPeriod'];

    }
    if (isset($options['PreferredBackupWindow'])) {
        $opt['PreferredBackupWindow'] = $options['PreferredBackupWindow'];

    }
    if (isset($options['PreferredMaintenanceWindow'])) {
        $opt['PreferredMaintenanceWindow'] = $options['PreferredMaintenanceWindow'];

    }
    if (isset($options['MultiAZ'])) {
        $opt['MultiAZ'] = $options['MultiAZ'];

    }
    if (isset($options['EngineVersion'])) {
        $opt['EngineVersion'] = $options['EngineVersion'];

    }
    if (isset($options['AllowMajorVersionUpgrade'])) {
        $opt['AllowMajorVersionUpgrade'] = $options['AllowMajorVersionUpgrade'];

    }
    if (isset($options['AutoMinorVersionUpgrade'])) {
        $opt['AutoMinorVersionUpgrade'] = $options['AutoMinorVersionUpgrade'];

    }
    if (isset($options['curlopts'])) {
        $opt['curlopts'] = $options['curlopts'];

    }
    if (isset($options['returnCurlHandle'])) {
        $opt['returnCurlHandle'] = $options['returnCurlHandle'];

    }


    $response = $rds->modify_db_instance($db_instance_identifier, $opt);
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
