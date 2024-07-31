@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for Booking'
define view entity ZI_RAP_BOOKING_GSP
  as select from ZRAP_BOOKING_GSP
  association        to parent ZI_RAP_TRAVEL_GSP as _Travel     on  $projection.TravelUUID = _Travel.TravelUUID
  association [1..1] to /DMO/I_Customer          as _Customer   on  $projection.CustomerID = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier           as _Carrier    on  $projection.CarrierID = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection        as _Connection on  $projection.CarrierID    = _Connection.AirlineID
                                                                and $projection.ConnectionID = _Connection.ConnectionID
  association [1..1] to /DMO/I_Flight            as _Flight     on  $projection.CarrierID    = _Flight.AirlineID
                                                                and $projection.ConnectionID = _Flight.ConnectionID
                                                                and $projection.FlightDate   = _Flight.FlightDate
  association [0..1] to I_Currency               as _Currency   on  $projection.CurrencyCode = _Currency.Currency
{
  key booking_uuid          as BookingUuid,
      travel_uuid           as TravelUuid,
      booking_id            as BookingId,
      booking_date          as BookingDate,
      customer_id           as CustomerId,
      carrier_id            as CarrierId,
      connection_id         as ConnectionId,
      flight_date           as FlightDate,
      flight_price          as FlightPrice,
      currency_code         as CurrencyCode,
      created_by            as CreatedBy,
      last_changed_by       as LastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      _Travel, // Make association public
      _Customer,
      _Carrier,
      _Connection,
      _Flight,
      _Currency
}
