Configuration InstallJenkins {
    param (

        $NodeName = $ENV:COMPUTERNAME
    )

    # import dsc resource
    Import-DscResource -ModuleName cJenkins

    Node $NodeName {

        cJenkinsInstaller Install {
            Ensure = 'Present'
        }
    }

}