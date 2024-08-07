@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value help for airport'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity ZI_RAP_GSP_Airport_VH
  as select from /dmo/airport
{
      @Search.defaultSearchElement: true
  key airport_id as AirportId,
      @Search.fuzzinessThreshold: 0.7
      @Search.defaultSearchElement: true
      name       as Name,
      @Search.defaultSearchElement: true
      city       as City,
      @Search.defaultSearchElement: true
      country    as Country
}
