using { fpt.zwb2202 as db } from '../db/schema';

// Annotate Sales Order
annotate db.SalesOrderHeads with {
    ID @(
        UI.Hidden,
        Common : {Text : SOrderNumber}
    );
}

// Annotate Sales Order
annotate db.CodeMaster with {
    CD1 @(UI.Hidden);
}