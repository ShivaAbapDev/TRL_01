@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking interface view for Unmanaged RAP'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_RAP_BOOKING_U_GSP
  as select from /dmo/booking
  association        to parent ZI_RAP_TRAVEL_U_GSP as _Travel     on  $projection.TravelId = _Travel.TravelId
  association [0..1] to /DMO/I_Customer            as _Customer   on  $projection.CustomerId = _Customer.CustomerID
  association [0..1] to /DMO/I_Connection          as _Connection on  $projection.CarrierId    = _Connection.AirlineID
                                                                  and $projection.ConnectionId = _Connection.ConnectionID
  association [0..1] to /DMO/I_Carrier             as _Carrier    on  $projection.CarrierId = _Carrier.AirlineID
{
  key travel_id     as TravelId,
  key booking_id    as BookingId,
      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,
      currency_code as CurrencyCode,

      /*associations*/
      _Travel,
      _Carrier,
      _Connection,
      _Customer
}
