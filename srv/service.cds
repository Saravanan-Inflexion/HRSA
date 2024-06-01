using { HRSuccessAssist as my } from '../db/schema.cds';

@path: '/service/hRService'
@requires: 'authenticated-user'
service hRServiceSrv {
  @odata.draft.enabled
  entity Ticket as projection on my.Ticket;
  @odata.draft.enabled
  entity Status as projection on my.Status;
  @odata.draft.enabled
  entity Priority as projection on my.Priority;
  @odata.draft.enabled
  entity MyQueue as projection on my.MyQueue;
  @odata.draft.enabled
  entity HRReports as projection on my.HRReports;
  @odata.draft.enabled
  entity EmployeeReports as projection on my.EmployeeReports;
  @odata.draft.enabled
  entity KnowledgeBase as projection on my.KnowledgeBase;
}