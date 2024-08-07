@AbapCatalog.viewEnhancementCategory: [ #NONE ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight info'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel: {
    usageType: {
        serviceQuality: #X,
        sizeCategory: #S,
        dataClass: #MIXED
    }
}
@UI.headerInfo: {
    typeName: 'Flight',
    typeNamePlural: 'Flights'
}
@Search.searchable: true
define view entity ZI_RAP_GSP_Flight_R
  as select from /dmo/flight as _flight
  association [1] to ZI_RAP_GSP_Carrier_R as _Carrier on $projection.CarrierId = _Carrier.CarrierId
{
      @UI.facet: [{ id: 'Flights',
                          purpose: #STANDARD,
                          type: #IDENTIFICATION_REFERENCE,
                          position: 10,
                          label: 'Flights' }]
      @UI.identification: [{ position: 10}]
      @UI.lineItem: [{ position: 10 }]
      @ObjectModel.text.association: '_Carrier'
      @Search.defaultSearchElement: true
  key carrier_id     as CarrierId,
      @UI.identification: [{ position: 20}]
      @UI.lineItem: [{ position: 20 }]
  key connection_id  as ConnectionId,
      @UI.identification: [{ position: 30}]
      @UI.lineItem: [{ position: 30 }]
  key flight_date    as FlightDate,
      @UI.identification: [{ position: 40}]
      @UI.lineItem: [{ position: 40 }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      currency_code  as CurrencyCode,
      @UI.identification: [{ position: 50}]
      @UI.lineItem: [{ position: 50 }]
      @Search.defaultSearchElement: true
      plane_type_id  as PlaneTypeId,
      @UI.identification: [{ position: 60}]
      @UI.lineItem: [{ position: 60 }]
      seats_max      as SeatsMax,
      @UI.identification: [{ position: 70}]
      @UI.lineItem: [{ position: 70 }]
      seats_occupied as SeatsOccupied,
      _Carrier

}
