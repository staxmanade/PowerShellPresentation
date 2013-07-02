    <#
       ____                        ____  _          _ _ 
      |  _ \ _____      _____ _ __/ ___|| |__   ___| | |
      | |_) / _ \ \ /\ / / _ \ '__\___ \| '_ \ / _ \ | |
      |  __/ (_) \ V  V /  __/ |   ___) | | | |  __/ | |
      |_|   \___/ \_/\_/ \___|_|  |____/|_| |_|\___|_|_|
      
      

## A crash course in the shell power of PowerShell


![vertical space](http://is.gd/VertSpace)


















    #>

    # pay no attn to the below goop (this should help me track my progress during the talk)
    $groupName = 'TODO Fill this in!!!'
    . .\TimeTracker.ps1
    Start-TrackingTime 65 # <-- how long is this talk?
    <#

![vertical space](http://is.gd/VertSpace)





















# Who am I?

## Jason Jarrett

> * Twitter: [@staxmanade](https://twitter.com/staxmanade)
> * Blog: [http://elegantcode.com](http://elegantcode.com)
> * Some Code: [http://github.com/staxmanade](http://github.com/staxmanade)
> * Employer: [Vertigo](http://vertigo.com)

## Some cool months of the year!

     J.A.S.O.N.
       J - July
       A - August
       S - September
       O - October
       N - November


![vertical space](http://is.gd/VertSpace)
















    #>
    
    HowsMyTime "yourself"

    <#

![vertical space](http://is.gd/VertSpace)
















# Enough about me! What about you?

- How many have ever used powershell?
- Programming experience:
  - More than 10 years?
  - Between 5-10 years?
  - Between 3-5 years?
  - Less than 3 years?
- Who has any amount of background in the Microsoft .Net space?


![vertical space](http://is.gd/VertSpace)

















# Goals for the talk:
- First a little background and fluffy stuff
- Language intro/overview
- Runtime Environment intro/overview
- Tips/Tricks
- Fun Stuff

![vertical space](http://is.gd/VertSpace)















# Overview

## What is it?

Windows PowerShell AKA (Windows Management Framework)

PowerShell is a `dynamically typed scripting language` composed of 2 major components

* Language
* Runtime environment

![vertical space](http://is.gd/VertSpace)













## Brief history

- Command.com or cmd.exe
- Monad Manifesto (August 2002)
- First demoed at (PDC 2003)
- V 1.0 (November 2006)
- V 2.0 (August 2009)
- V 3.0 (Last quarter of 2012)


![vertical space](http://is.gd/VertSpace)













## Where can I use it?
* V2.0 comes pre-installed on systems >= Win7 and Server 2008 R2
* V2.0 can be installed on windows going all the way back to Windows XP
* OSS linux ports out there that run on top of the Mono framework

![vertical space](http://is.gd/VertSpace)








    

## Why should I care about it?

- Automate your daily mundane
- Prototype against .Net framework classes w/out having to `File -> New -> Console Project`
- If you know .net you are almost there

![vertical space](http://is.gd/VertSpace)














        #>

         HowsMyTime "powershell overview"

        <#

![vertical space](http://is.gd/VertSpace)















# PowerShell Language/Syntax
    
    
    
## Comments
    
    # <--- to comment out a line
    
    <#
        Comment out a block of stuff
        
        This whole presentation is littered with them :) !!!!
    #>
    
# ![vertical space](http://is.gd/VertSpace)

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
# Variable Declaration
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
    
# ![vertical space](http://is.gd/VertSpace)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
# Arrays
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

    # Can't remove from the array.  You'd have to create a new array with just the items you wanted. (Or use a .net class to do it list)
    $a1 -= 7
    
# ![vertical space](http://is.gd/VertSpace)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
# Hash table
    $v3 = @{
        "name1" = "value1";
        "name2" = "value2"; 
        "name3" = "value3"; 
    }
    
## Read a value
    $v3["name1"]
    
    $v3.name1
    
## Set a value
    $v3.HelloKey = "Hello Value"
    
    $v3["HelloKey"] = "Hello Something else"
    
    $v3.HelloKey
    
# ![vertical space](http://is.gd/VertSpace)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
# Strings
    
    'Hello World!' 
    # or
    "Hello World!"

## Multiline strings

    @'
    Hello
    World
    '@

Note - these won't work

    @'Hello
    World
    '@

    @'
    Hello
    World'@


## String Interpolation

### Single quotes `don't` interpolate
    'Hello $groupName' 
    
### Double quotes `DO` interpolate
    "Hello $groupName"
        
    
### Wrap `$(...)` around expression within an string
    "groupName variable is of type: $($groupName.GetType().FullName)"
    "2 + 1564 = $(2 + 1564)"
    "Current DateTime is = $(get-date)"
    "Current DateTime is = $([System.DateTime]::Now)"

    
### Escape characters with the ` (back-tick)
    "Escape a quotation `"This is quoted`"."
    
### sometimes you can just change the quote type used.
    'Escape a quotation "This is quoted".'
    "Escape a quotation `"$(get-date)`""
    'Mix single and double quotes "$(get-date)".'    # <-- notice the single quote - no interpolation
    
# ![vertical space](http://is.gd/VertSpace)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
# Comparison operators
    
### Are case-insensitive by default
        
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

### Case-sensitive - put  a `c` in front of each operator. 
        # EX: -eq becomes -ceq (Case sensitive equal to)
        "aBc" -ceq "ABC" # (nope)

### Regex
        "Welcome to the $groupName" -match "Welcome (.*)"            # Regular expression comparison
        $matches
        "Welcome to the $groupName" -notmatch "Welcome (.*)"         # Regular expression comparison
        $matches

### Some other bits
        !$true              # Not $true
        (-not $true)        # Not $true
        $true -and $true    # And
        $false -or $true    # Or
    
# ![vertical space](http://is.gd/VertSpace)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
# General Syntax
    
### if block

    if( $true -or $false -or 1 -or "hi") {
        $true
    }

    
### if elseif else block

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
    
    
### while loop

    $v1 = 10
    while( $v1 -gt 0 ) {
        $v1--
        echo $v1
    }

    
### do while loop

    $v1 = 10
    do {
        $v1--
        $v1
    } while ( $v1 -gt 0 )

    
### for loop

    for($i = 0; $i -lt 10; $i++) {
        "$i"
    }

    
### foreach

    $files = ls
    foreach($file in $files) {
        "{0,10} bytes" -f $file.Length
    }


### switch

    $v1 = "hi"
    switch($v1) {
        "hello" { "no" }
        "world" { "no" }
        "hi"    { "yes" }
        default { "no" }
    }
    
    
###try/catch/finally

    try {
        throw "Oh SNAP!"
    } catch {
        $_ 
    }
    finally{
        "Do some Cleanup"
    }

    
# ![vertical space](http://is.gd/VertSpace)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
# Pipelines
    
    # unlike *nix pipeline the output of the operation is not text but an object
    
    ls | Get-Member
    
    ls | where { $_.Extension -eq ".ps1" } | Sort-Object Length -Descending
    
    $output = (ls | where { $_.Extension -eq ".ps1" } | Sort-Object Length -Descending)
    $output.GetType()
    $output[0].GetType()
    

# ![vertical space](http://is.gd/VertSpace)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
# Range operator
    
    1..15
    
    [char]'A'..[char]'z' | %{ [char]$_ }
    
    1..15 | foreach{ "I can count to $_" }
    
# ![vertical space](http://is.gd/VertSpace)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
# 4 kinds of commands powershell can execute
    
### Cmdlets (pronounced command-lets)
    Get-ChildItem
    

    
### Script files (*.ps1 extension)
    ./HelloFromAScript.ps1



### Functions
    function HelloFromAFunction()
    {
        echo "Hello World!"
    }
    
    HelloFromAFunction # Execute the above defined function
    
    
    function OneParamApproach($param1, $param2)
    {
        echo "$param1 - $param2"
    }
    
    OneParamApproach "Placing the params within the parentheses is one approach"
    
    
    # same as above example for 2 parameters
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
    

    
### plain ol executables

    # already in your environment's "PATH"
        ipconfig.exe
        where.exe ipconfig
        where.exe powershell

    # by specifying full path
        C:\Windows\System32\ipconfig.exe

    # execute a command who's path was stored in a variable
        $cmd = 'C:\Windows\System32\ipconfig.exe'
        & $cmd /?

    # same as above (without the variable)
        C:\Windows\System32\ipconfig.exe /?
    

# ![vertical space](http://is.gd/VertSpace)

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
# Interact with the .Net framework
    
### new up a .net object given a set of arguments to pass to the constructor
    #    ctor of - DateTime(int year, int month, int day)
    $JanFirst2009 = New-Object System.DateTime @(2009, 1, 1)
    $JanFirst2009
    
    $JanFirst2009.GetType()
    
### calling methods on an object
#### (notice how calling .net function is different than powershell function (use of parenthases)
    $JanFirst2009.AddDays(1)
    
### Call a static property
    [System.DateTime]::Now
    
### Execute a static function
    [System.String]::Format("Hello {0}!", $groupName)
    
    
    
    
### Wire up to a .net event object. (This is really a PITA)
# TODO: check the PS 3 to see if this got better
        $timer = New-Object Timers.Timer
        $timer.Interval = 1000
        $timer.Start()
        $job = Register-ObjectEvent -inputObject $timer -eventName Elapsed `
               -sourceIdentifier Timer.Random `
               -Action { Get-Random -Min 0 -Max 100;}
    
        Receive-Job $job
        $timer.Stop();
        Unregister-Event Timer.Random
    
# ![vertical space](http://is.gd/VertSpace)
    
    
    
    
    
    
    
    
    






    
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
    

# ![vertical space](http://is.gd/VertSpace)
    
    
    
    
    
    
    
    
    
    


    
    HowsMyTime "the powershell language"
    
# ![vertical space](http://is.gd/VertSpace)
    
    
    
    
    
    
    
    
    
    
    
    
# PowerShell Runtime Environment

# ![vertical space](http://is.gd/VertSpace)
    
    
    
    



    
    
    <#    
# Tools

## Tools for composing and executing PowerShell
    - Powershell Console (Built-in)
    - Powershell ISE (Built-in)
    - PowerGUI (3rd party)
    - others? (probably)

# Great tools that leverage powershell or help you with powershell

 	- Chocolatey
 	- cinst wincommandpaste

    #>    

# ![vertical space](http://is.gd/VertSpace)













# Drives
    
### The usual drives ("hard drives")
    cd C:\
    ls \\SomeNetworkShare\Folder\file.txt
    
    
### get a list of all the drive providers
    Get-PSDrive
    
    
### 'mount' a new folder as a namded drive. 
    # Note this is not a system/wide change, but the current powershell environment
    New-PSDrive -PSProvider filesystem -Root C:\Code\ -Name Code
    

### Variable drive
    ls variable: | measure
    $someNewRandomVar = 1
    ls variable: | measure
    
### Registry

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
    

    rmdir HKCU:\Software\JasonJ -Force
    

### Some other drive providers
    # - Sql Server
    # - Active Directory
    # - build your own?

# ![vertical space](http://is.gd/VertSpace)















    
    
    
    
    
# Aliases
    #   Many of the commands you may know from dos or linux scripting work in PowerShell - accomplished by aliases
    #   (map commands to shortcuts)
    
### Print all alises
    alias
    
### Show what the underlying command is for `dir` and `ls`
    alias dir
    alias ls
    
    
### Create your own aliases
    # alias foo to the Get-ChildItem cmdlet
    
    set-alias foo Get-ChildItem 
    
    foo
    
# ![vertical space](http://is.gd/VertSpace)
    
    
    
    
    
    
    
    









    
# Profile

### `$Profile` is a global variable that describes where the current environment can load a profile script
    $Profile
    
### When you first start up - it (`$profile`) won't exist, but the path is specified
    # 1. Create the directory
    # 2. Create the file
    # 3. Customize it for your own needs
    
    # what is in the current profile?
    cat $Profile
    
    notepad $profile

### Different environment specify different paths depending on the runtime/editor
    # Powershell Console
    # Powershell ISE
    # The NuGet Package Manager Console (inside Visual Studio) uses different path


# ![vertical space](http://is.gd/VertSpace)
    

    
    
    
    
    
    
    
    






    
# Execution Environment
    
    Get-ExecutionPolicy
    
    Set-ExecutionPolicy -ExecutionPolicy Restricted
    
    <#
        Restricted - No scripts can be run. Windows PowerShell can be used only in interactive mode.
    
        AllSigned - Only scripts signed by a trusted publisher can be run.
    
        RemoteSigned - Downloaded scripts must be signed by a trusted publisher before they can be run.
    
        Unrestricted - No restrictions; all Windows PowerShell scripts can be run.
    #>

    
# ![vertical space](http://is.gd/VertSpace)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
# Commandlets and common parameters
    
    get-help about_CommonParameters
    
    # WhatIf
    mkdir temp
    cd .\temp
    1..10 | %{ new-item -Name "$_.txt" -type file }
    rm *.txt -WhatIf
    ls
    rm *.txt
    ls
    
    # ErrorAction
    rm This_file_doesnt_exist_on_disk.txt
    rm This_file_doesnt_exist_on_disk.txt -ErrorAction silentlycontinue
    
# ![vertical space](http://is.gd/VertSpace)
    
    
    
    
    
    
    
    
    
    
    
    HowsMyTime "the powershell runtime environment"
    
# ![vertical space](http://is.gd/VertSpace)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
# Usefull tips/tricks

### Dot-sourcing a file (EX: see the TimeTracker.ps1 at the top of this file)

    . .\SomeExternalScript.ps1
    # Now I can access functions/variables the external script contains


### II (Invoke-Item)
    # open windows explorer at the current directory
    ii .
    
    ii http://google.com # <-- I wish this worked - might write my own a wrapper?

    
### Pipe output to the clipboard

    "Hello $groupName" | clip

    cat README.md | clip


### Get-Help

    Get-Help
    Get-Help ls
    Get-Help alias

### Show-Command

    Show-Command ls

### Get-History

    Get-History


### Start a powershell process as administrator 

    Start-Process PowerShell -Verb RunAs


### Out-GridView

    ls | out-gridview


### Download and parse some XML
    ([xml] (new-object net.webclient).downloadstring('http://feeds.feedburner.com/ElegantCode')) | %{ $_.rss.channel.Item } | select title, creator


### Progress Bar
    1..100 | foreach{ 
        Write-Progress -activity "Sample progress bar" -PercentComplete $_;
        sleep -Milliseconds 20
    }

# Some special number shortcuts

    1kb   # ==> kilo-byte 1024
    1mb   # ==> mega-byte 1048576
    1gb   # ==> giga-byte 1073741824
    1tb   # ==> tera-byte 1099511627776
    1pb   # ==> peta-byte 11258999068426240  11,258,999,068,426,240
    
    #1eb   # ==> exa-byte ERR: does not work (but why would you need something that big?)
    #1zb   # ==> zetta-byte ERR: wat?
    #1yb   # ==> yotta-byte ERR: really?

> note you don't have to use 1*b (ex: 1kb) you can specify any number (213kb ==> 218112)

### Dig into my development environment setup script?
    
    set-executionpolicy unrestricted;
   
    iex ((new-object net.webclient).DownloadString('https://raw.github.com/staxmanade/DevMachineSetup/master/Bootstrap/BootIt.ps1'))

    # Of particular interest
    # - CD override
    # http://elegantcode.com/2012/11/01/more-than-slightly-modified-cd-command-for-powershell/    

    
# ![vertical space](http://is.gd/VertSpace)
    
    










    
    HowsMyTime "so-called useful stuff"

# ![vertical space](http://is.gd/VertSpace)
    
    
    
    
    
    
    
    
    
    
    
    
    
# What is this?
    
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
    

### I promise to only do this (whever I feel it!) :)
    iex (New-Object Net.WebClient).DownloadString("http://bit.ly/e0Mw9w")

# ![vertical space](http://is.gd/VertSpace)
   
    










    HowsMyTime "done"

# ![vertical space](http://is.gd/VertSpace)

    <#

# This Presentation can be found at

> [http://github.com/staxmanade/PowershellPresentation](http://github.com/staxmanade/PowershellPresentation)


## Jason Jarrett

> * Twitter: [@staxmanade](https://twitter.com/staxmanade)
> * Blog: [http://elegantcode.com](http://elegantcode.com)
> * Some Code: [http://github.com/staxmanade](http://github.com/staxmanade)
> * Employer: [Vertigo](http://vertigo.com)


# Thanks for listening...

       ____                        ____  _          _ _ 
      |  _ \ _____      _____ _ __/ ___|| |__   ___| | |
      | |_) / _ \ \ /\ / / _ \ '__\___ \| '_ \ / _ \ | |
      |  __/ (_) \ V  V /  __/ |   ___) | | | |  __/ | |
      |_|   \___/ \_/\_/ \___|_|  |____/|_| |_|\___|_|_|
     
    #>
