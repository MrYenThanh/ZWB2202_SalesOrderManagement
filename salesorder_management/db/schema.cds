namespace fpt.zwb2202;

using {
    managed,
    cuid,
    sap.common
} from '@sap/cds/common';

entity SalesOrderHeads : cuid, managed {
        SOrderNumber         : String(10)        @title : 'Sales Order Number';
        CCode                : String(5)         @title : 'Currency Code';
        GrossAmount          : Decimal(15, 2)    @title : 'Total Gross Amount';
        NetAmount            : Decimal(15, 2)    @title : 'Total Net Amount';
        TaxAmount            : Decimal(15, 2)    @title : 'Total Tax Amount';
        OverallStatus        : String(1)         @title : 'Overall Status';
        Note                 : String(80)        @title : 'Note';
        PaymentMethod        : String(1)         @title : 'Payment Method';
        
        virtual Criticality  : Integer;         // virtual field will not reflect in Database
        
        OverallStatus_asso   : Association to CodeMaster 
                                            on OverallStatus_asso.CD1 = 'Z001'
                                            and OverallStatus_asso.Value = $self.OverallStatus;

        PaymentMethod_asso   : Association to CodeMaster 
                                            on PaymentMethod_asso.CD1 = 'Z002'
                                            and PaymentMethod_asso.Value = $self.PaymentMethod;
        // Buyer
}

entity CodeMaster {
    key CD1   : String(4)  @title : 'CD1';
    key Value : String(10) @title : 'Value';
        Text  : String(50) @title : 'Text';
}