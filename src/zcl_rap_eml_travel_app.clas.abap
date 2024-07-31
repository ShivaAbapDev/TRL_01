CLASS zcl_rap_eml_travel_app DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_eml_travel_app IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*    " step 1 - READ
*    READ ENTITIES OF zi_rap_travel_gsp
*      ENTITY travel
*        FROM VALUE #( ( TravelUUID = '1AE5C07030481EDF8FEDFED641C5876E' ) )
*      RESULT DATA(travels).
*
*    out->write( travels ).

* " step 2 - READ with Fields
*    READ ENTITIES OF ZI_RAP_TRAVEL_GSP
*        ENTITY travel
*            FIELDS ( AgencyID CustomerID )
*            WITH value #(  ( TravelUuid =  '1AE5C07030481EDF8FEDFED641C5876E' ) )
*        RESULT DATA(travels).
*
*    out->write( travels ).

    "Step 3 - Read with all fields
*    READ ENTITIES OF zi_rap_travel_gsp
*        ENTITY travel
*            ALL FIELDS WITH VALUE #( ( travelUuid = '1AE5C07030481EDF8FEDFED641C5876E' ) )
*        RESULT DATA(travels).
*
*    out->write( travels ).

*    " step 4 - READ By Association
*    READ ENTITIES OF ZI_RAP_travel_gsp
*        ENTITY travel BY \_Booking
*        ALL FIELDS WITH VALUE #( ( TravelUuid = '1AE5C07030481EDF8FEDFED641C5876E' ) )
*       RESULT DATA(Bookings).

*    out->write(  Bookings ).

    " step 5 - Unsuccessful READ
*    READ ENTITIES OF ZI_RAP_Travel_gsp
*           ENTITY travel
*             ALL FIELDS WITH VALUE #( ( TravelUUID = '11111111111111111111111111111111' ) )
*           RESULT DATA(travels)
*           FAILED DATA(failed)
*           REPORTED DATA(reported).
*
*    out->write( travels ).
*    out->write( failed ).    " complex structures not supported by the console output
*    out->write( reported ).  " complex structures not supported by the console output


*    " step 6 - MODIFY Update
*    MODIFY ENTITIES OF zi_rap_travel_gsp
*        ENTITY travel
*            UPDATE
*                SET FIELDS WITH VALUE #(  ( TravelUUid = '1AE5C07030481EDF8FEDFED641C5876E'
*                                            Description = '00123123 Description') )
*            FAILED DATA(Failed)
*            REPORTED DATA(Reported).
*
*    out->write( failed ).    " complex structures not supported by the console output
*    out->write( reported ).  " complex structures not supported by the console output


    " step 6b - Commit Entities
*     COMMIT ENTITIES
*       RESPONSE OF ZI_RAP_Travel_gsp
*       FAILED     DATA(failed_commit)
*       REPORTED   DATA(reported_commit).

*    READ ENTITIES OF zi_rap_travel_gsp
*        ENTITY travel
*            ALL FIELDS WITH VALUE #( ( travelUuid = '1AE5C07030481EDF8FEDFED641C5876E' ) )
*        RESULT DATA(travels).
*
*    out->write( travels ).

*    " Step7- Modify create
*    MODIFY ENTITIES OF ZI_RAP_Travel_gsp
*        ENTITY Travel
*            CREATE
*                SET FIELDS WITH VALUE #( (
*                 %cid        = 'MyContentID_1'
*                 AgencyID    = '70012'
*                 CustomerID  = '14'
*                 BeginDate   = cl_abap_context_info=>get_system_date( )
*                 EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                 Description = 'Frist Insert through RAP Code' )  )
*
*        MAPPED DATA(Mapped)
*        FAILED DATA(failed)
*        REPORTED DATA(reported).
*
*    out->write( Mapped-travel ).
*
*    COMMIT ENTITIES
*           RESPONSE OF ZI_RAP_travel_gsp
*           FAILED DATA(failed_commit)
*           REPORTED DATA(reported_commit).
*
*    out->write(  'Create Done' ).

*
*   READ ENTITIES OF zi_rap_travel_gsp
*        ENTITY travel
*            ALL FIELDS WITH VALUE #( ( travelUuid = '1AE5C07030481EEF9080E9892CE82ED0' ) )
*        RESULT DATA(travels).
*
*    out->write( travels ).

*    " step 8 - MODIFY Delete
*    MODIFY ENTITIES OF ZI_RAP_travel_gsp
*            ENTITY Travel
*           DELETE FROM
*            VALUE #( ( TravelUuid = '1AE5C07030481EEF9080E9892CE82ED0' ) )
*           FAILED DATA(failed)
*           REPORTED DATA(reported).
*
*    COMMIT ENTITIES RESPONSE OF ZI_RAP_Travel_gsp
*        FAILED DATA(failed_commit)
*        REPORTED DATA(reported_commit).


*    READ ENTITIES OF zi_rap_travel_gsp
*         ENTITY travel
*             ALL FIELDS WITH VALUE #( ( travelUuid = '1AE5C07030481EEF9080E9892CE82ED0' ) )
*         RESULT DATA(travels)
*         FAILED DATA(failed_read)
*         REPORTED DATA(reported_read).
*
*    out->write( travels ).
*    out->write( failed_read ).
*    out->write( reported_read ).

  ENDMETHOD.

ENDCLASS.
