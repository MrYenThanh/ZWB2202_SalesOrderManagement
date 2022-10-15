using SalesOrderService as service from '../../srv/SalesOrderService';

// List Report Page
annotate service.SalesOrder with @(
    UI.DeleteHidden : true,
    // Header Info
    UI.HeaderInfo : {
        TypeName       : 'SalesOrder',
        TypeNamePlural : 'Sales Orders',
        Title          : {Value : SOrderNumber},
        Description    : {Value : Note}
    },
    // Filter Bar
    UI.SelectionFields : [SOrderNumber, CCode, OverallStatus],
    // Main Table
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : SOrderNumber,
            ![@HTML5.CssDefaults] : {width : '12rem'}, // Column width
        },
        {
            $Type : 'UI.DataField',
            Value : CCode,
            ![@HTML5.CssDefaults] : {width : '10rem'}, // Column width
        },
        {
            $Type : 'UI.DataField',
            Value : GrossAmount,
            ![@HTML5.CssDefaults] : {width : '12rem'}, // Column width
        },
        {
            $Type : 'UI.DataField',
            Value : NetAmount,
            ![@HTML5.CssDefaults] : {width : '12rem'}, // Column width
        },
        {
            $Type : 'UI.DataField',
            Value : TaxAmount,
            ![@HTML5.CssDefaults] : {width : '10rem'}, // Column width
        },
        {
            $Type : 'UI.DataField',
            Value : Note,
            ![@HTML5.CssDefaults] : {width : '15rem'}, // Column width
        },
        {
            $Type : 'UI.DataField',
            Value : OverallStatus,
            Criticality : Criticality,
            ![@HTML5.CssDefaults] : {width : '10rem'},
        },
        {
            $Type : 'UI.DataField',
            Value : PaymentMethod,
            ![@HTML5.CssDefaults] : {width : '10rem'}, // Column width
        }
    ]
);

// Object Page
annotate service.SalesOrder with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : SOrderNumber,
            },
            {
                $Type : 'UI.DataField',
                Value : CCode,
            },
            {
                $Type : 'UI.DataField',
                Value : GrossAmount,
            },
            {
                $Type : 'UI.DataField',
                Value : NetAmount,
            },
            {
                $Type : 'UI.DataField',
                Value : TaxAmount,
            },
            {
                $Type : 'UI.DataField',
                Value : OverallStatus,
                Criticality : Criticality,
            },
            {
                $Type : 'UI.DataField',
                Value : Note,
            },
            {
                $Type : 'UI.DataField',
                Value : PaymentMethod,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);

// Value Help for field SO Status
// And set Status to show Text instead of Code
annotate service.SalesOrder with {
    OverallStatus @(Common : {
        //show text, not id for mitigation in the context of risks
        Text            : OverallStatus_asso.Text,
        TextArrangement : #TextFirst, // Show text in format: Text(Code)
//      Value Help for field SO Status
        ValueList       : {
            Label          : 'Overall Status',
            CollectionPath : 'CodeMaster',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : OverallStatus,
                    ValueListProperty : 'Value'
                },{
                    $Type : 'Common.ValueListParameterConstant',
                    Constant : 'Z001',
                    ValueListProperty : 'CD1',
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Text'
                }
            ]
        }
    });
}