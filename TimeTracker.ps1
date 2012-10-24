
<#


Start-TrackingTime 90

HowsMyTime "some topic"

#>

$timeTracker = @{}


function Start-TrackingTime($allottedMinutes) {

    $timeTracker.StartTime = Get-Date
    $timeTracker.Tick = get-date
    $timeTracker.ExpectedEndTime = $timeTracker.StartTime.AddMinutes($allottedMinutes)

    
    Write-Host -ForegroundColor Green "On your marks, get set, GO... Time is being tracked" 
}

function HowsMyTime($topic){
    $start = $timeTracker.Tick;
    $end = $timeTracker.ExpectedEndTime;

    $timeSpent = New-TimeSpan $start (get-date)
    $timeLeft = New-TimeSpan (get-date) $end

    $timeTracker.Tick = get-date

    if($topic -eq "done"){
        "Hope you enjoyed the talk!"
        ""
        ""
        "(-.-) Zzzzzzz..."
    }
    else{
        ("You've blabbered for {0} minutes about {1} and only have {2} minutes left.") -f ([int]$timeSpent.TotalMinutes), $topic, ([int]$timeLeft.TotalMinutes)
    }
}
