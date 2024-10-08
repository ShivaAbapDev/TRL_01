@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for travel'
define root view entity ZI_RAP_travel_gsp
  as select from zrap_travel_gsp as Travel
  composition [0..*] of ZI_RAP_BOOKING_GSP            as _Booking
  association [0..1] to /DMO/I_Agency                 as _Agency     on $projection.AgencyId = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer               as _Customer   on $projection.CustomerId = _Customer.CustomerID
  association [0..1] to I_Currency                    as _Currency   on $projection.CurrencyCode = _Currency.Currency
  association [0..1] to zi_rap_gsp_travel_stat_domain as _TravelStat on $projection.OverallStatus = _TravelStat.value_low
{
  key travel_uuid            as TravelUuid,
      travel_id              as TravelId,
      agency_id              as AgencyId,
      customer_id            as CustomerId,
      begin_date             as BeginDate,
      end_date               as EndDate,
      booking_fee            as BookingFee,
      total_price            as TotalPrice,
      currency_code          as CurrencyCode,
      description            as Description,
      overall_status         as OverallStatus,
      cast(case
      when overall_status = 'O' then '2'
      when overall_status = 'A' then '3'
      else '1'
      end  as abap.char(1) ) as OverallStatus1,

      created_by             as CreatedBy,
      created_at             as CreatedAt,
      last_changed_by        as LastChangedBy,
      last_changed_at        as LastChangedAt,
      local_last_changed_at  as LocalLastChangedAt,
      _Booking, // Make association public
      _Agency,
      _Customer,
      _Currency,
      _TravelStat
}
