targetScope = 'subscription'

//////////////////////////
//   Input Parameters   //
//////////////////////////
@description('Optional. A parameter to control which deployments should be executed')
@allowed([
    'All'
    'Only infrastructure'
    'Only storage & image'
    'Only image'
])
param deploymentsToPerform string = 'All'

@description('Optional. Specifies the location for resources.')
param location string = 'WestEurope'

/////////////////////////////
//   Template Deployment   //
/////////////////////////////
module imageInfraDeployment '../templates/imageInfra.deploy.bicep' = {
    name: '${uniqueString(deployment().name)}-imageInfra-sbx'
    params: {
        location: location
        deploymentsToPerform: deploymentsToPerform
        computeGalleryName: 'aibgallery'
        storageAccountName: 'shaibstorage'
    }
}
