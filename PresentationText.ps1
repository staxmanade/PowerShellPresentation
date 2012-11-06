$groupName = 'NNSDG'
. .\TimeTracker.ps1


































Start-TrackingTime 70


<#
 *  ____                        ____  _          _ _ 
 * |  _ \ _____      _____ _ __/ ___|| |__   ___| | |
 * | |_) / _ \ \ /\ / / _ \ '__\___ \| '_ \ / _ \ | |
 * |  __/ (_) \ V  V /  __/ |   ___) | | | |  __/ | |
 * |_|   \___/ \_/\_/ \___|_|  |____/|_| |_|\___|_|_|
 *
 * 
 * A crash course in the shell power of PowerShell
 * 
 * 
 * 
 * 
 *   Jason Jarrett
 *        - @staxmanade
 *        - http://elegantcode.com
 *        - http://github.com/staxmanade
 *        -
 *        - Vertigo - http://vertigo.com
 * 
 * 
 * 
 * 
 * 
 *   J.A.S.O.N.
 *        J - July
 *        A - August
 *        S - September
 *        O - October
 *        N - November
 * 
 * 
 * 
 * 
 * 
 *          ´$$$$`                             ,,, 
 *         ´$$$$$$$`                         ´$$$`
 *          `$$$$$$$`      ,,       ,,      ´$$$$´
 *           `$$$$$$$`    ´$$`    ´$$`     ´$$$$$´
 *            `$$$$$$$` ´$$$$$` ´$$$$$`  ´$$$$$$$´
 *             `$$$$$$$ $$$$$$$ $$$$$$$ ´$$$$$$$´ 
 *              `$$$$$$ $$$$$$$ $$$$$$$`´$$$$$$´ 
 * ,,,,,,       `$$$$$$ $$$$$$$ $$$$$$$ $$$$$$´ 
 * ´$$$$$`      `$$$$$$ $$$$$$$ $$$$$$$ $$$$$$´ 
 *  ´$$$$$$$`  ´$$$$$$$ $$$$$$$ $$$$$$$ $$$$$´ 
 *   ´ $$$$$$$$$$$$$$$$ $$$$$$$ $$$$$$$ $$$$$´ 
 *      `$$$$$$$$$$$$$$ $$$$$$$ $$$$$$ $$$$$$´ 
 *        `$$$$$$$$$$$$$ $$$$$   $$$$$  $$$$´ 
 *         `$$$$$$$$$$$$,___,$$$$,____,$$$$$´ 
 *           `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$´ 
 *            `$$$$$$$$$$$$$$$$$$$$$$$$$$$´ 
 *              `$$$$$$$$$$$$$$$$$$$$$$$$´ 
 * 
 * 
 * 
 * 
 * 
 * 
 #>
HowsMyTime "yourself"











################
################
<#

Goal for this talk:

    - First a little background and fluffy stuff
    - Overview of the PowerShell Language
    - Overview of the PowerShell Runtime Environment
    - Tips/Tricks
    - Fun Stuff

    - Not too deep
    - Not too shallow
    - Just right
#>















################
################
<# Overview

    Where did it come from?
    	- Command.com or cmd.exe
     	- Monad Manifesto (August 2002)
    	- First demoed at (PDC 2003)
    	- V 1.0 (November 2006)
    	- V 2.0 (August 2009)
    	- V 3.0 (Recently 2012)

    	Windows PowerShell AKA (Windows Management Framework)
    	V2.0 came pre-installed on systems > Win7 and Server 2008 R2


    What is it?

       PowerShell is the combination of 2 major components
         1. Language
         2. Runtime environment


    Why should I care about it?

#>

HowsMyTime "powershell overview"
















################
################
# PowerShell Language/Syntax
################
################



<#

	- dynamically typed scripting language

#>








# Comments

    # <--- to comment out a line

    <#
        Comment out a block of stuff
    #>




















# variable declaration
    $v1 = 1
    echo $v1

    $v2 = $v1 + 1;
    echo $v2
    
    # explicitly define it's data type
    [int] $num1 = 1
    echo $num1

    # Notice how the .2 gets rounded as it converts it to an integer
    [int] $num2 = 1.2 
    echo $num2

    [decimal] $num3 = 1.2
    echo $num3




















# Array
    $v3 = @( 1, 2, 3 )
    echo $v3
    
    # Working with Arrays
    
    # Concat 2 arrays
    @(1,2,3) + @('a', 'b', 'c') + @(4,5,6)
    
    # Different ways to add to an array.
    $a1 = @(1,2,3); $a1
    $a1 += 4; $a1
    $a1 += 5; $a1
    $a1 += 6; $a1
    
    $a1 += @(7,8,9); $a1

    # Can't remove from the array.  You'd have to create a new array with just the items you wanted. (Or use a .net class to do it. Like
    $a1 -= 7




















# Hash table
    $v3 = @{
            "name1" = "value1";
            "name2" = "value2"; 
            "name3" = "value3"; 
        }

    # Access value in the hash
    $v3["name1"]
    $v3.name1

    # Set a value
    $v3.HelloKey = "Hello Value"
    $v3["HelloKey"] = "Hello Something else"
    $v3.HelloKey




















# Strings

    # Single quote does not interpolation strings
    'Hello $groupName' 

    # Double quotes will expand variables and evaluate expressions within the string.
    "Hello $groupName"

    # Wrap $(...) around an operation to have powershell evaluate it within the string
    "groupName variable is of type: $($groupName.GetType().FullName)"
    "2 + 1564 = $(2 + 1564)"
    "Current DateTime is = $(get-date)"
    "Current DateTime is = $([System.DateTime]::Now)"


    # escape characters with the ` (back-tick)
    "Escape a quotation `"This is quoted`"."

    # sometimes you can just change the quote type used.
    'Escape a quotation "This is quoted".'
    "Escape a quotation `"$(get-date)`""
    'Escape a quotation "$(get-date)".'    # <-- notice the single quote - no interpolation

















# Comparison operators

    # case-insensitive by default
    
    1 -eq 1 # equal
    1 -ne 0 # not equal 
    1 -gt 0 # greater than
    1 -ge 1 # greater than or equal
    1 -lt 4 # less than
    1 -le 1 # less than or equal
    
    "something" -like "*ethin*"                                  # Wildcard comparison
    "something" -notlike "*gni*"                                 # Wildcard comparison
    "This $groupName is boring!" -replace 'boring', 'AWESOME'    # Replace operator
    @(1,2,3) -contains 1                                         # Containment operator
    @(1,2,3) -notcontains 0                                      # Containment operator
    
    # if you want case-sensitive then put  a 'c' in front of each command. 
    # EX: -eq becomes -ceq (Case sensitive equal to)

    "Welcome to the $groupName" -match "Welcome (.*)"            # Regular expression comparison
    $matches
    "Welcome to the $groupName" -notmatch "Welcome (.*)"         # Regular expression comparison
    $matches


    (!$true -eq $false)     # Not
    (-not $true -eq $false) # Not
    $true -and $true        # And
    $false -or $true        # Or




















# general syntax

    # if block
    if( $true -or $false -or 1 -or "hi") {
        $true
    }

    # if else block
    $v1 = 'c'
    if( $v1 ) {
        "a"
    } elseif( $v1 ) {
        "b"
    } elseif( $v1 ) {
        "c"
    } else {
        "d"
    }


    # while loop
    $v1 = 10
    while( $v1 -gt 0 ) {
        $v1--
        echo $v1
    }

    # do while loop
    $v1 = 10
    do {
        $v1--
        $v1
    } while ( $v1 -gt 0 )
    
    # for loop
    for($i = 0; $i -lt 10; $i++) {
        "$i"
    }

    # foreach
    $files = ls
    foreach($file in $files) {
        "{0,10} bytes" -f $file.Length
    }
    
    # switch
    $v1 = "hi"
    switch($v1) {
        "hello" { "no" }
        "world" { "no" }
        "hi"    { "yes" }
        default { "no" }
    }


    #try/catch/finally
    try {
        throw "Oh SNAP!"
    } catch {
        $_ 
    }
    finally{
        "Do some Cleanup"
    }




















# Pipelines

    # unlike unix pipeline the output of the operation is not text but an object

    ls | Get-Member

    ls | where { $_.Extension -eq ".ps1" } | Sort-Object Length -Descending
    
    $output = (ls | where { $_.Extension -eq ".ps1" } | Sort-Object Length -Descending)
    $output.GetType()
    $output[0].GetType()




















# Range operator

    1..15

    [char]'A'..[char]'z' | %{ [char]$_ }

    1..15 | foreach{ "I can count to $_" }























################
# 4 kinds of commands powershell can execute

    # 1 - cmdlets (pronounced command-lets)
        Get-ChildItem


    # 2 - PowerShell scripts (files with the .ps1 extension)
        ./HelloFromAScript.ps1


    # 3 - Powershell functions
        function HelloFromAFunction()
        {
            echo "Hello World!"
        }
        HelloFromAFunction # Execute the above defined function

        function OneParamApproach($param1, $param2)
        {
            echo $oneParamApproach
        }
        OneParamApproach "Placing the params within the parentheses is one approach"

        #this approach exists to use when writing .ps1 powershell scripts that take parameters.
        function AnotherParamApproach()
        {
            [param](
                $param1,
                $param2
            )

            echo "$param1 - $param2"
        }
        OneParamApproach "Placing the params within the parentheses is one approach"


        # function that supports the pipeline.
        function Add-Them-Up {
            BEGIN {
                # one time (at the beginning) setup code
                $total = 0
            }
            PROCESS {
                # grab the current item
                $currentItem = $_

                # do something with the item
                $total += $currentItem
            }
            END {
                # one time (at the end) teardown code
                $total
            }
        }

        @(1,2,3) | Add-Them-Up
        1..100 | Add-Them-Up


    # 4 - plain ol executables
        ipconfig.exe
        where.exe ipconfig
        where.exe powershell















################
# Interact with the .Net framework

    # new up a .net object given a set of arguments to pass to the constructor
    #    ctor of - DateTime(int year, int month, int day)
    $JanFirst2009 = New-Object System.DateTime @(2009, 1, 1)
    $JanFirst2009

    $JanFirst2009.GetType()

    # calling methods on an object (notice how calling it is different than powershell function
    $JanFirst2009.AddDays(1)

    # Execute a static property
    [System.DateTime]::Now

    # Execute a static function
    [System.String]::Format("Hello {0}!", $groupName)




    # Wire up to a .net event object. (This is really a PITA)
    $timer = New-Object Timers.Timer
    $timer.Interval = 1000
    $timer.Start()
    $job = Register-ObjectEvent -inputObject $timer -eventName Elapsed `
           -sourceIdentifier Timer.Random `
           -Action { Get-Random -Min 0 -Max 100;}

    Receive-Job $job
    $timer.Stop();
    Unregister-Event Timer.Random











################
# XML

$someXml = [xml]'
<root>
    <person id="1002854">
        <firstName>Jason</firstName>
        <lastName>Jarrett</lastName>
    </person>
    <person id="532486">
        <firstName>Jesse</firstName>
        <lastName>Anderson</lastName>
    </person>
</root>'

$someXml
$someXml.GetType()

$someXml.root
$someXml.root.GetType()

$someXml.root.person[0]
$someXml.root.person[0].GetType()

$someXml.root.person[0].firstname
$someXml.root.person[0].firstname.GetType()

$someXml.root.person[0].id


foreach($person in $someXml.root.person){
    $person.lastName
}


$someXml.root.person | where { $_.id -eq 1002854 }













HowsMyTime "the powershell language"













################
################
# PowerShell Runtime Environment
################
################







################
# Tools

# Tools you can write/execute PowerShell
# 	- Powershell Console
# 	- Powershell ISE
# 	- PowerGUI
# 
# Tools that use powershell or help you use powershell
# 	- Chocolatey
# 	- cinst wincommandpaste




################
# drives

    # the usual drives ("hard drives")


    # get a list of all the drive providers
    Get-PSDrive


    # 'mount' a new folder as a namded drive. Note this is not a 
    # system/wide change, but the current powershell environment
    New-PSDrive -PSProvider filesystem -Root C:\Code\ -Name Code


    # "Variable" drive
    ls variable: | measure
    $someNewRandomVar = 1
    ls variable: | measure



    # Registry

        # sample drive is browsing the windows registry
        Push-Location

        #open regedit
        regedit


        cd HKCU:\
        ls
        cd HKCU:\Software
        ls

        # create a registry folder
        mkdir JasonJ
        cd .\JasonJ

        Set-ItemProperty . newproperty "mynewvalue"

        Pop-Location

        # can't get this to work (gives an 'it's in use' error)
        rmdir HKCU:\Software\JasonJ -Force






    # Some other drive providers
    #   - Sql Server
    #   - Active Directory

    # build your own?






################
# Aliases
    #   Many of the commands you may know from dos or linux scripting work in PowerShell - accomplished by aliases
    #   (map commands to shortcuts)

        alias # prints all alises
        
        alias dir # shows what the underlying command is for 'dir'
        alias ls # shows what the underlying command is for 'ls'


        # Create your own aliases
        set-alias foo Get-ChildItem # alias foo to the Get-ChildItem cmdlet
        foo











################
# Profile

$Profile

# When you first start up - it won't exist, but the path is specified
# 1. Create the directory
# 2. Create the file
# 3. Customize it for your own needs


# what is in the current profile?
cat $Profile

notepad $profile












################
# Execution Environment

Get-ExecutionPolicy

Set-ExecutionPolicy -ExecutionPolicy Restricted

<#
    Restricted - No scripts can be run. Windows PowerShell can be used only in interactive mode.

    AllSigned - Only scripts signed by a trusted publisher can be run.

    RemoteSigned - Downloaded scripts must be signed by a trusted publisher before they can be run.

    Unrestricted - No restrictions; all Windows PowerShell scripts can be run.
#>






















################
# Commandlets and common parameters

    get-help about_CommonParameters

    # WhatIf
    mkdir temp
    cd .\temp
    1..10 | %{ new-item -Name "$_.txt" -type file }
    rm *.txt -WhatIf
    ls

    # ErrorAction
    rm This_file_doesnt_exist_on_disk.txt
    rm This_file_doesnt_exist_on_disk.txt -ErrorAction silentlycontinue
    











HowsMyTime "the powershell runtime environment"

















################
# Usefull tips/tricks
#
# (dot) sourcing a file (NOTE: see the TimeTracker.ps1 at the top of this file)
#
#
#
# II (Invoke-Item)
#
# something... | clip
#
# Get-History
#
# Start a powershell process as administrator 
# Start-Process PowerShell -Verb RunAs
#
# Out-GridView
#
# ([xml] (new-object net.webclient).downloadstring('http://softwaredevelopersgroup.com/wp-feed.php')) | %{ $_.rss.channel.Item } | select title, creator
#
# progress bar
# 1..100 | foreach{ Write-Progress -activity "Sample progress bar" -PercentComplete $_; sleep -Milliseconds 20 }
#
# - Potentially review my setup script? BoxStarter?
#
# gitinit function? https://github.com/staxmanade/PsProfile/tree/master/GlobalScripts
# CD override?
#
#






HowsMyTime "so-called useful stuff"













################
# PowerShell and some boring stuff


    # http://elegantcode.com/2011/08/30/powershell-text-to-speech-and-fun-with-a-4yr-old/
        # case internet is down
        function Start-The-Fun()
        {
    	    $voice = new-object -com SAPI.SpVoice;

    	    while($true)
    	    {
    		    write-host "->" -NoNewLine;
    		    $msg = read-host;
    		    $Voice.Speak( $msg, 1 ) | out-null;
    	    }
        }


    iex (New-Object Net.WebClient).DownloadString("http://bit.ly/e0Mw9w")





























HowsMyTime "done"

<#
 *  
 *   Thanks for listening...
 *  
 *  
 *   Jason Jarrett
 *        - @staxmanade
 *        - http://elegantcode.com
 *        - http://github.com/staxmanade
 *        -
 *        - Vertigo - http://vertigo.com
 *  
 *  
 *  
 *  ____                        ____  _          _ _ 
 * |  _ \ _____      _____ _ __/ ___|| |__   ___| | |
 * | |_) / _ \ \ /\ / / _ \ '__\___ \| '_ \ / _ \ | |
 * |  __/ (_) \ V  V /  __/ |   ___) | | | |  __/ | |
 * |_|   \___/ \_/\_/ \___|_|  |____/|_| |_|\___|_|_|
 *
 * 
#>