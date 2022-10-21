using { fpt.zwb2202 as db } from '../db/schema';

service SalesOrderService {

    entity SalesOrder @(restrict : [
        {
            grant : ['READ'],
            to    : ['SalesViewer']
        },
        {
            grant : ['*'],
            to    : ['SalesManager']
        }
    ]) as projection on db.SalesOrderHeads;
    annotate SalesOrder with @odata.draft.enabled;
    
    entity CodeMaster as projection on db.CodeMaster;

    @readonly
    entity BusinessPartners as projection on db.BusinessPartners;
}