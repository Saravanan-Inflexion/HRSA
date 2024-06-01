namespace HRSuccessAssist;

entity Ticket {
  key ID: UUID;
  ticketID: UUID @assert.unique @mandatory;
  title: String(100);
  description: String(500);
  priority: String(20);
  reportedBy: String(100);
  createdOn: DateTime;
  closedOn: DateTime;
  responder: String(100);
  status: Association to Status;
  solutions: Composition of many Solution on solutions.ticket = $self;
}

entity Solution {
  key ID: UUID;
  solutionID: UUID @assert.unique @mandatory;
  requestingEmployee: String(100);
  respondingHRPersonnel: String(100);
  ticket: Association to Ticket;
}

entity Status {
  key ID: UUID;
  statusID: UUID @assert.unique @mandatory;
  text: String(100);
}

entity Priority {
  key ID: UUID;
  priorityID: UUID @assert.unique @mandatory;
  text: String(100);
}

entity MyQueue {
  key ID: UUID;
  myQueueID: UUID @assert.unique @mandatory;
  title: String(100);
  createdBy: String(100);
  createdOn: DateTime;
  timeTaken: Integer;
  ticket: Association to Ticket;
}

entity HRReports {
  key ID: UUID;
  hRReportsID: UUID @assert.unique @mandatory;
  title: String(100);
  createdBy: String(100);
  createdOn: DateTime;
  highPriorityCount: Integer;
  mediumPriorityCount: Integer;
  lowPriorityCount: Integer;
  statusCount: Integer;
  timeTaken: Integer;
  ticket: Association to Ticket;
}

entity EmployeeReports {
  key ID: UUID;
  employeeReportsID: UUID @assert.unique @mandatory;
  title: String(100);
  createdBy: String(100);
  createdOn: DateTime;
  priorityCount: Integer;
  statusCount: Integer;
  timeTaken: Integer;
  ticket: Association to Ticket;
}

entity KnowledgeBase {
  key ID: UUID;
  knowledgeBaseID: UUID @assert.unique @mandatory;
  title: String(100);
  createdBy: String(100);
  createdOn: DateTime;
  ticket: Association to Ticket;
}

