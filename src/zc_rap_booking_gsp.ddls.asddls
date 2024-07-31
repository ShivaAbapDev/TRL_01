@EndUserText.label: 'Projection View for Booking'
@Search.searchable: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_RAP_BOOKING_GSP
  as projection on ZI_RAP_BOOKING_GSP as Booking
{
  key BookingUuid,
      TravelUuid,
      @Search.defaultSearchElement: true
      BookingId,
      BookingDate,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer' , element: 'CustomerID'} }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerId,
      _Customer.LastName as CustomerName,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Carrier' , element: 'AirlineID'} }]
      @ObjectModel.text.element: ['CarrierName']
      CarrierId,
      _Carrier.Name      as CarrierName,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      @Consumption.valueHelpDefinition: [{ entity:{ name: 'I_Currency' , element: 'Currency' } }]
      CurrencyCode,
      CreatedBy,
      LastChangedBy,
      LocalLastChangedAt,
      /* Associations */
      _Travel : redirected to parent ZC_RAP_TRAVEL_GSP,
      _Carrier,
      _Connection,
      _Currency,
      _Customer,
      _Flight
}
