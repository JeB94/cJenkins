# cJenkins
PowerShell DSC for installing Jenkins


## DSC Resources
* **cJenkinsInstaller** DSC resource to controll jenkins installation


## Examples

```powershell
configuration JenkinsInstallation
{
    Import-DscResource -ModuleName 'cJenkins'

    cJenkinsInstaller InstallJenkins
    {
        Ensure    = 'Present'
    }
}
```

Ensures that Jenkins is installed.



```powershell
configuration JenkinsInstallation
{
    Import-DscResource -ModuleName 'cJenkins'

    cJenkinsInstaller InstallJenkins
    {
        Ensure    = 'Absent'
    }
}
```

Ensures that Jenkins is not installed.
