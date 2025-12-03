query 50500 "Dime Query VOT BLI"
{
    APIGroup = 'apiGroup';
    APIPublisher = 'publisherName';
    APIVersion = 'v1.0';
    EntityName = 'entityName';
    EntitySetName = 'entitySetName';
    QueryType = API;

    elements
    {
        dataitem(dimeDSOrderLineLink; "Dime DS Order Line Link")
        {
            // --- Bestaande kolommen ---
            column(appointmentId; "Appointment Id") { }
            column(documentNo; "Document No.") { }
            column(documentType; "Document Type") { }
            column(endingDatetime; "Ending Datetime") { }
            column(operationNo; "Operation No.") { }
            column(pillarDescriptionVOT; "Pillar Description VOT") { }
            column(resourceNo; "Resource No.") { }
            column(startingDateTime; "Starting DateTime") { }
            column(votDSBody; "VOT DS Body") { }
            column(votDSCategory; "VOT DS Category") { }
            column(votDSConversionRate; "VOT DS Conversion rate") { }
            column(votDSDiameterPole; "VOT DS Diameter Pole") { }
            column(votDSDurationSec; "VOT DS Duration(Sec)") { }
            column(votDSEndingDate; "VOT DS Ending Date") { }
            column(votDSImportance; "VOT DS Importance") { }
            column(votDSKopschotCapacity; "VOT DS KopschotCapacity") { }
            column(votDSLengthPole; "VOT DS Length Pole") { }
            column(votDSLinkedAppointment; "VOT DS Linked Appointment") { }
            column(votDSLinkedAppointmentId; "VOT DS Linked Appointment Id") { }
            column(votDSLinkedResource; "VOT DS Linked Resource") { }
            column(votDSManualInsert; "VOT DS Manual Insert") { }
            column(votDSMengselKwaliteit; "VOT DS Mengsel Kwaliteit") { }
            column(votDSMengselType; "VOT DS Mengsel Type") { }
            column(votDSNoOfPoles; "VOT DS No. of Poles") { }
            column(votDSProjectNo; "VOT DS Project No.") { }
            column(votDSStrengPatroonAantal; "VOT DS StrengPatroon Aantal") { }
            column(votDSStrengPatroonDiameter; "VOT DS StrengPatroon Diameter") { }
            column(votDSTemporaryCapacityLink; "VOT DS Temporary Capacity Link") { }
            column(votDSTemporaryReplace; "VOT DS Temporary Replace") { }
            column(votDSTimeMarker; "VOT DS Time Marker") { }
            column(votDSTotalLength; "VOT DS Total Length") { }

            dataitem(assemblyHeader; "Assembly Header")
            {
                DataItemLink = "No." = dimeDSOrderLineLink."Document No.";
                DataItemTableFilter = "Document Type" = const("Document Type"::Order);

                // Voeg kolommen uit Assembly Header toe
                column(assemblyNo; "No.") { }
                column(assemblyItemNo; "Item No.") { }
                column(assemblyQuantity; Quantity) { }
                column(assemblyDescription; Description) { }
                column(assemblySalesOrderNo; "Sales Document No. VOT") { }
                column(assemblySalesLineNo; "Sales Document Line No. VOT") { }
                column(assemblyPillarColor; "Pillar Color VOT") { }

                dataitem(salesCommentLine; "Sales Comment Line")
                {
                    DataItemLink = "No." = assemblyHeader."Sales Document No. VOT",
                                    "Document Type" = assemblyHeader."Sales Document Type VOT",
                                    "Document Line No." = assemblyHeader."Sales Document Line No. VOT";
                    column(commentLineGlobalCode; "Global Code VOT") { }
                    column(commentLineCommentText; "Big Comment Text VOT") { }
                }
            }
        }
    }

    trigger OnBeforeOpen()
    begin
    end;
}