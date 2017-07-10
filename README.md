# cJenkins
PowerShell DSC for installing Jenkins


## DSC Resources
* **cJenkinsInstaller** DSC resource to controll jenkins installation


## Examples

```powershell
Configuration DSCJenkins {
    param (

        $NodeName = $ENV:COMPUTERNAME
    )

    Import-DscResource -ModuleName cJenkins

    Node $NodeName {

        cJenkinsInstaller Install {
            Ensure = 'Present'
        }
    }

}
```

Ensures that Jenkins is installed.



```powershell
Configuration DSCJenkins {
    param (

        $NodeName = $ENV:COMPUTERNAME
    )

    Import-DscResource -ModuleName cJenkins

    Node $NodeName {

        cJenkinsInstaller Install {
            Ensure = 'Absent'
        }
    }

}
```

Ensures that Jenkins is not installed.
