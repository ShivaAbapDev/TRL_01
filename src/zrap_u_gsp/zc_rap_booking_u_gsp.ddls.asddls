@EndUserText.label: 'Projection view for Booking unmanaged'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true

define view entity ZC_RAP_BOOKING_U_GSP
  as projection on ZI_RAP_BOOKING_U_GSP
{
      @Search.defaultSearchElement: true
  key TravelId,
      @Search.defaultSearchElement: true
  key BookingId,
      BookingDate,
      @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Customer', element: ' CustomerID' } } ]
      CustomerId,
      @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Carrier', element: 'AirlineID' } } ]
      CarrierId,
      //    @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Connection', element: 'ConnectionID ' } } ]
      @Consumption.valueHelpDefinition: [ { entity: { name:    '/DMO/I_Flight',
                                                      element: 'ConnectionID' },
                                            additionalBinding: [ { localElement: 'FlightDate',
                                                                   element:      'FlightDate',
                                                                   usage: #RESULT },
                                                                 { localElement: 'CarrierID',
                                                                        element: 'AirlineID',
                                                                          usage: #RESULT },
                                                                 { localElement: 'FlightPrice',
                                                                        element: 'Price',
                                                                          usage: #RESULT },
                                                                 { localElement: 'CurrencyCode',
                                                                        element: 'CurrencyCode',
                                                                          usage: #RESULT } ]
                                            } ]
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency' , element: 'Currency' } }]
      CurrencyCode,
      /* Associations */
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent ZC_RAP_TRAVEL_U_GSP
}
