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
@Search.searchable: true
define view entity zi_rap_connection_r
  as select from /dmo/connection as _Connection
  association [1..*] to ZI_RAP_GSP_Flight_R  as _Flight      on  $projection.CarrierId    = _Flight.CarrierId
                                                             and $projection.ConnectionId = _Flight.ConnectionId
  association [1]    to ZI_RAP_GSP_Carrier_R as _Carrier     on  $projection.CarrierId = _Carrier.CarrierId
  association [1]    to /DMO/I_Airport       as _FromAirport on  $projection.AirportFromId = _FromAirport.AirportID
  association [1]    to /DMO/I_Airport       as _ToAirport   on  $projection.AirportToId = _ToAirport.AirportID


{

      @UI.facet: [{ id: 'Connection',
                    purpose: #STANDARD,
                    type: #IDENTIFICATION_REFERENCE,
                    position: 10,
                    label: 'Connection' },
                  { id: 'Flight',
                    purpose: #STANDARD,
                    type: #LINEITEM_REFERENCE,
                    position: 10,
                    label: 'Flights',
                    targetElement: '_Flight' }]
      @UI.lineItem: [{ position: 10, label: 'Airline' }]
      @UI.identification: [{ position: 10 }]
      @ObjectModel.text.association: '_Carrier'
      @Search.defaultSearchElement: true

      //    @ObjectModel.text.element: [ '_Carrier.CarrierName' ]
  key carrier_id      as CarrierId,

      @UI.lineItem: [{ position: 20 }]
      @UI.identification: [{ position: 20 }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
  key connection_id   as ConnectionId,

      @UI.selectionField: [{ position: 10 }]
      @UI.lineItem: [{ position: 30 }]
      @UI.identification: [{ position: 30 }]
      @Search.defaultSearchElement: true
      @Semantics.language: true
      @ObjectModel.text.association: '_FromAirport'
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_RAP_GSP_Airport_VH',
                                                     element: 'AirportId' } }]
      airport_from_id as AirportFromId,
      @UI.selectionField: [{ position: 20 }]
      @UI.lineItem: [{ position: 40 }]
      @UI.identification: [{ position: 40 }]
      @ObjectModel.text.association: '_ToAirport'
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_RAP_GSP_Airport_VH',
                                                  element: 'AirportId' } }]
      airport_to_id   as AirportToId,

      @UI.lineItem: [{ position: 50 ,label: 'Departure Time' }]
      @UI.identification: [{ position: 50 }]
      departure_time  as DepartureTime,

      @UI.lineItem: [{ position: 60, label: 'Arrial Time' }]
      @UI.identification: [{ position: 60 }]
      arrival_time    as ArrivalTime,

      @UI.lineItem: [{ position: 70 }]
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      @UI.identification: [{ position: 70 }]
      distance        as Distance,

      distance_unit   as DistanceUnit,
      /*associations*/
      @Search.defaultSearchElement: true
      _Flight,
      _Carrier,
      @Search.defaultSearchElement: true
      _FromAirport,
      @Search.defaultSearchElement: true
      _ToAirport
}
