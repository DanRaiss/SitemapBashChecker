<?php
    // Declare the path to the bash script
    $bash_script = '/path/to/your/sitemap_bash_checker.sh';

    // Use the exec function to run the pgrep command and search for the running process of the bash script
    exec("pgrep -f '$bash_script'", $pids);

    // If the pids array is empty, it means the script is not running
    if(empty($pids)) {
        // Use the exec function to run the bash script and redirect the output to /dev/null, and run the script in background
        exec("$bash_script > /dev/null &");
    }
?>
