### Azure Data Factory info
$SubscriptionName = "AIA - Azure Internal Subscription"
$ResourceGroupName = "aia-braze-v2-poc-rg"
$DataFactoryName = "aia-braze-v2-poc-adf"
$AzureSSISName = "SSISAzureIntegrationRuntime-05"
$AzureSSISDescription = "Testing SSIS IR Deployment through PowerShell"
$AzureSSISLocation = "CanadaCentral"
$AzureSSISNodeSize = "Standard_D1_v2"
$AzureSSISNodeNumber = 1
$AzureSSISEdition = "Standard"
$AzureSSISLicenseType = "BasePrice"
$AzureSSISMaxParallelExecutionsPerNode = 4
$VNetId = "/subscriptions/ce859648-30e1-4135-9d0f-8358aebfe789/resourceGroups/aia-sqlinsights-rg/providers/Microsoft.Network/virtualNetworks/aiacanadacentralvnet"
$Subnet = "ADF_IR_Subnet_clone"

### Sign in and select subscription
Connect-AzAccount
Select-AzSubscription -SubscriptionName $SubscriptionName

### Create an integration runtime
Set-AzDataFactoryV2IntegrationRuntime -ResourceGroupName $ResourceGroupName `
    -DataFactoryName $DataFactoryName `
    -Name $AzureSSISName `
    -Description $AzureSSISDescription `
    -Type Managed `
    -Location $AzureSSISLocation `
    -NodeSize $AzureSSISNodeSize `
    -NodeCount $AzureSSISNodeNumber `
    -Edition $AzureSSISEdition `
    -LicenseType $AzureSSISLicenseType `
    -MaxParallelExecutionsPerNode $AzureSSISMaxParallelExecutionsPerNode `
    -VNetId $VNetId `
    -Subnet $Subnet

### Start integration runtime
write-host("##### Starting #####")
Start-AzDataFactoryV2IntegrationRuntime -ResourceGroupName $ResourceGroupName `
    -DataFactoryName $DataFactoryName `
    -Name $AzureSSISName `
    -Force `
    -Debug

write-host("##### Completed #####")
write-host("If any cmdlet is unsuccessful, please consider using -Debug option for diagnostics.")