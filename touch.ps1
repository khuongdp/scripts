$parent = "c:\inetpub\wwwroot\rochs3"
$webconfigfolders = "rochs", "rochs.admin", "rochs.auction", "rochs.booking", "rochs.car", "rochs.carreport", "rochs.creditcar", "rochs.incomingvehicle", "rochs.photo", "rochs.release", "rochs.remark", "rochs.resource", "rochs.undecor"
$filename = "web.config"

$now = get-date 
$now | out-string
foreach($folder in $webconfigfolders)
{
		$fullfilename = $parent + "\" + $folder + "\" + $filename
		$fullfilename | Out-String
		(get-item $fullfilename).lastwritetime = $now
}
