enum Ensure {
    Present
    Absent
}


[DscResource()]
class cJenkins {
    [DscProperty(Key)]
    [String] $Ensure
        

    # Gets the resource's current state.
    [cJenkins] Get() {

        $Package = Get-Package -Name 'Jenkins*' -ErrorAction SilentlyContinue

        if ($null -ne $package) {

            $this.Ensure = 'Present'
        }
        else {

            $this.Ensure = 'Absent'
        }

        return $this
    }
        
    # Sets the desired state of the resource.
    [void] Set() {

        # install
        if ($this.Ensure -eq [Ensure]::Present) {

            $DownloadUri = "http://mirrors.jenkins-ci.org/windows-stable/latest"  
            $DownloadPath = Join-Path -Path $ENV:TMP -ChildPath 'jenkins.zip'

            Invoke-WebRequest -Uri $DownloadUri -UseBasicParsing -OutFile $DownloadPath

            Expand-Archive -Path $DownloadPath -DestinationPath $Env:TMP -Force

            $ArgumentList = '/qn /i {0}' -f (Join-Path $ENV:TMP -ChildPath 'jenkins.msi')
            Start-Process  msiexec.exe -ArgumentList  $ArgumentList -Wait
            
        }
        # uninstall
        else {
             Get-Package -Name 'Jenkins*' | Uninstall-Package
        }

    }
        
    # Tests if the resource is in the desired state.
    [bool] Test() {

        $Package = Get-Package -Name 'Jenkins*' -ErrorAction SilentlyContinue

        if ($this.Ensure -eq [Ensure]::Present) {
            return ($null -ne $Package)
        
        }
        else {
            return ($null -eq $package) 
        }
    }
}




