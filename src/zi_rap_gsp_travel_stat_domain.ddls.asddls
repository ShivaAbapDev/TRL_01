@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Domain Value'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_rap_gsp_travel_stat_domain
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name:'/DMO/OVERALL_STATUS' )
{
  key domain_name,
  key value_position,
      @Semantics.language: true
  key language,
      value_low,
      @ObjectModel.text.element: ['text']
      @Semantics.text: true
      text
}
