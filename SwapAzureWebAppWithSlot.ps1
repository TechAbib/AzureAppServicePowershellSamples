﻿

$webAppName = "powershelldemowebapp"
$subscriptionId = "31af7401-5a70-49be-80c7-7a6b85da7287"

#Login-AzureRmAccount
#Select-AzureRmSubscription -SubscriptionId $subscriptionId


$rgName = GetResourceGroupForWebApp $webAppName

$ParametersObject = @{
	targetSlot = "staging"
	preserveVnet = "true"
}

Invoke-AzureRmResourceAction -ResourceGroupName $rgName `
    -ResourceType Microsoft.Web/sites `
    -ResourceName $webAppName -Action slotsswap -Parameters $ParametersObject -ApiVersion 2015-08-01 -Force