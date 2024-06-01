using { hRServiceSrv } from '../srv/service.cds';

annotate hRServiceSrv.Ticket with @UI.HeaderInfo: { TypeName: 'Ticket', TypeNamePlural: 'Tickets', Title: { Value: ticketID } };
annotate hRServiceSrv.Ticket with {
  ID @UI.Hidden @Common.Text: { $value: ticketID, ![@UI.TextArrangement]: #TextOnly }
};
annotate hRServiceSrv.Ticket with @UI.Identification: [{ Value: ticketID }];
annotate hRServiceSrv.Ticket with {
  status @Common.ValueList: {
    CollectionPath: 'Status',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: status_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'statusID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'text'
      },
    ],
  }
};
annotate hRServiceSrv.Ticket with @UI.DataPoint #title: {
  Value: title,
  Title: 'Title',
};
annotate hRServiceSrv.Ticket with @UI.DataPoint #description: {
  Value: description,
  Title: 'Description',
};
annotate hRServiceSrv.Ticket with @UI.DataPoint #priority: {
  Value: priority,
  Title: 'Priority',
};
annotate hRServiceSrv.Ticket with {
  ticketID @title: 'ID';
  title @title: 'Title';
  description @title: 'Description';
  priority @title: 'Priority';
  reportedBy @title: 'Reported By';
  createdOn @title: 'Created On';
  closedOn @title: 'Closed On';
  responder @title: 'Responder'
};

annotate hRServiceSrv.Ticket with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ticketID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: priority },
    { $Type: 'UI.DataField', Value: reportedBy },
    { $Type: 'UI.DataField', Value: createdOn },
    { $Type: 'UI.DataField', Value: closedOn },
    { $Type: 'UI.DataField', Value: responder },
    { $Type: 'UI.DataField', Label: 'Status', Value: status_ID }
];

annotate hRServiceSrv.Ticket with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ticketID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: priority },
    { $Type: 'UI.DataField', Value: reportedBy },
    { $Type: 'UI.DataField', Value: createdOn },
    { $Type: 'UI.DataField', Value: closedOn },
    { $Type: 'UI.DataField', Value: responder },
    { $Type: 'UI.DataField', Label: 'Status', Value: status_ID }
  ]
};

annotate hRServiceSrv.Ticket with {
  status @Common.Text: { $value: status.statusID, ![@UI.TextArrangement]: #TextOnly }
};

annotate hRServiceSrv.Ticket with {
  status @Common.Label: 'Status';
  solutions @Common.Label: 'Solutions'
};

annotate hRServiceSrv.Ticket with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#title' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#description' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#priority' }
];

annotate hRServiceSrv.Ticket with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'Solution', Target : 'solutions/@UI.LineItem' }
];

annotate hRServiceSrv.Ticket with @UI.SelectionFields: [
  status_ID
];

annotate hRServiceSrv.Solution with @UI.HeaderInfo: { TypeName: 'Solution', TypeNamePlural: 'Solutions', Title: { Value: solutionID } };
annotate hRServiceSrv.Solution with {
  ID @UI.Hidden @Common.Text: { $value: solutionID, ![@UI.TextArrangement]: #TextOnly }
};
annotate hRServiceSrv.Solution with @UI.Identification: [{ Value: solutionID }];
annotate hRServiceSrv.Solution with {
  ticket @Common.ValueList: {
    CollectionPath: 'Ticket',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: ticket_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ticketID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'title'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'priority'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'reportedBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdOn'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'closedOn'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'responder'
      },
    ],
  }
};
annotate hRServiceSrv.Solution with @UI.DataPoint #requestingEmployee: {
  Value: requestingEmployee,
  Title: 'Requesting Employee',
};
annotate hRServiceSrv.Solution with @UI.DataPoint #respondingHRPersonnel: {
  Value: respondingHRPersonnel,
  Title: 'Responding HR Personnel',
};
annotate hRServiceSrv.Solution with {
  solutionID @title: 'ID';
  requestingEmployee @title: 'Requesting Employee';
  respondingHRPersonnel @title: 'Responding HR Personnel'
};

annotate hRServiceSrv.Solution with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: solutionID },
    { $Type: 'UI.DataField', Value: requestingEmployee },
    { $Type: 'UI.DataField', Value: respondingHRPersonnel }
];

annotate hRServiceSrv.Solution with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: solutionID },
    { $Type: 'UI.DataField', Value: requestingEmployee },
    { $Type: 'UI.DataField', Value: respondingHRPersonnel }
  ]
};

annotate hRServiceSrv.Solution with {
  ticket @Common.Text: { $value: ticket.ticketID, ![@UI.TextArrangement]: #TextOnly }
};

annotate hRServiceSrv.Solution with {
  ticket @Common.Label: 'Ticket'
};

annotate hRServiceSrv.Solution with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#requestingEmployee' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#respondingHRPersonnel' }
];

annotate hRServiceSrv.Solution with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate hRServiceSrv.Solution with @UI.SelectionFields: [
  ticket_ID
];

annotate hRServiceSrv.Status with @UI.HeaderInfo: { TypeName: 'Status', TypeNamePlural: 'Statuses', Title: { Value: statusID } };
annotate hRServiceSrv.Status with {
  ID @UI.Hidden @Common.Text: { $value: statusID, ![@UI.TextArrangement]: #TextOnly }
};
annotate hRServiceSrv.Status with @UI.Identification: [{ Value: statusID }];
annotate hRServiceSrv.Status with @UI.DataPoint #text: {
  Value: text,
  Title: 'Text',
};
annotate hRServiceSrv.Status with {
  statusID @title: 'ID';
  text @title: 'Text'
};

annotate hRServiceSrv.Status with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: statusID },
    { $Type: 'UI.DataField', Value: text }
];

annotate hRServiceSrv.Status with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: statusID },
    { $Type: 'UI.DataField', Value: text }
  ]
};

annotate hRServiceSrv.Status with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#text' }
];

annotate hRServiceSrv.Status with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate hRServiceSrv.Status with @UI.SelectionFields: [
  statusID
];

annotate hRServiceSrv.Priority with @UI.HeaderInfo: { TypeName: 'Priority', TypeNamePlural: 'Priorities', Title: { Value: priorityID } };
annotate hRServiceSrv.Priority with {
  ID @UI.Hidden @Common.Text: { $value: priorityID, ![@UI.TextArrangement]: #TextOnly }
};
annotate hRServiceSrv.Priority with @UI.Identification: [{ Value: priorityID }];
annotate hRServiceSrv.Priority with @UI.DataPoint #text: {
  Value: text,
  Title: 'Text',
};
annotate hRServiceSrv.Priority with {
  priorityID @title: 'ID';
  text @title: 'Text'
};

annotate hRServiceSrv.Priority with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: priorityID },
    { $Type: 'UI.DataField', Value: text }
];

annotate hRServiceSrv.Priority with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: priorityID },
    { $Type: 'UI.DataField', Value: text }
  ]
};

annotate hRServiceSrv.Priority with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#text' }
];

annotate hRServiceSrv.Priority with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate hRServiceSrv.Priority with @UI.SelectionFields: [
  priorityID
];

annotate hRServiceSrv.MyQueue with @UI.HeaderInfo: { TypeName: 'MyQueue', TypeNamePlural: 'MyQueues', Title: { Value: myQueueID } };
annotate hRServiceSrv.MyQueue with {
  ID @UI.Hidden @Common.Text: { $value: myQueueID, ![@UI.TextArrangement]: #TextOnly }
};
annotate hRServiceSrv.MyQueue with @UI.Identification: [{ Value: myQueueID }];
annotate hRServiceSrv.MyQueue with {
  ticket @Common.ValueList: {
    CollectionPath: 'Ticket',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: ticket_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ticketID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'title'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'priority'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'reportedBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdOn'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'closedOn'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'responder'
      },
    ],
  }
};
annotate hRServiceSrv.MyQueue with @UI.DataPoint #title: {
  Value: title,
  Title: 'Title',
};
annotate hRServiceSrv.MyQueue with @UI.DataPoint #createdBy: {
  Value: createdBy,
  Title: 'Created By',
};
annotate hRServiceSrv.MyQueue with @UI.DataPoint #createdOn: {
  Value: createdOn,
  Title: 'Created On',
};
annotate hRServiceSrv.MyQueue with {
  myQueueID @title: 'ID';
  title @title: 'Title';
  createdBy @title: 'Created By';
  createdOn @title: 'Created On';
  timeTaken @title: 'Time Taken'
};

annotate hRServiceSrv.MyQueue with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: myQueueID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: createdBy },
    { $Type: 'UI.DataField', Value: createdOn },
    { $Type: 'UI.DataField', Value: timeTaken },
    { $Type: 'UI.DataField', Label: 'Ticket', Value: ticket_ID }
];

annotate hRServiceSrv.MyQueue with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: myQueueID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: createdBy },
    { $Type: 'UI.DataField', Value: createdOn },
    { $Type: 'UI.DataField', Value: timeTaken },
    { $Type: 'UI.DataField', Label: 'Ticket', Value: ticket_ID }
  ]
};

annotate hRServiceSrv.MyQueue with {
  ticket @Common.Text: { $value: ticket.ticketID, ![@UI.TextArrangement]: #TextOnly }
};

annotate hRServiceSrv.MyQueue with {
  ticket @Common.Label: 'Ticket'
};

annotate hRServiceSrv.MyQueue with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#title' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#createdBy' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#createdOn' }
];

annotate hRServiceSrv.MyQueue with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate hRServiceSrv.MyQueue with @UI.SelectionFields: [
  ticket_ID
];

annotate hRServiceSrv.HRReports with @UI.HeaderInfo: { TypeName: 'HRReport', TypeNamePlural: 'HRReports', Title: { Value: hRReportsID } };
annotate hRServiceSrv.HRReports with {
  ID @UI.Hidden @Common.Text: { $value: hRReportsID, ![@UI.TextArrangement]: #TextOnly }
};
annotate hRServiceSrv.HRReports with @UI.Identification: [{ Value: hRReportsID }];
annotate hRServiceSrv.HRReports with {
  ticket @Common.ValueList: {
    CollectionPath: 'Ticket',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: ticket_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ticketID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'title'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'priority'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'reportedBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdOn'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'closedOn'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'responder'
      },
    ],
  }
};
annotate hRServiceSrv.HRReports with @UI.DataPoint #title: {
  Value: title,
  Title: 'Title',
};
annotate hRServiceSrv.HRReports with @UI.DataPoint #createdBy: {
  Value: createdBy,
  Title: 'Created By',
};
annotate hRServiceSrv.HRReports with @UI.DataPoint #createdOn: {
  Value: createdOn,
  Title: 'Created On',
};
annotate hRServiceSrv.HRReports with {
  hRReportsID @title: 'ID';
  title @title: 'Title';
  createdBy @title: 'Created By';
  createdOn @title: 'Created On';
  highPriorityCount @title: 'High Priority Count';
  mediumPriorityCount @title: 'Medium Priority Count';
  lowPriorityCount @title: 'Low Priority Count';
  statusCount @title: 'Status Count';
  timeTaken @title: 'Time Taken'
};

annotate hRServiceSrv.HRReports with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: hRReportsID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: createdBy },
    { $Type: 'UI.DataField', Value: createdOn },
    { $Type: 'UI.DataField', Value: highPriorityCount },
    { $Type: 'UI.DataField', Value: mediumPriorityCount },
    { $Type: 'UI.DataField', Value: lowPriorityCount },
    { $Type: 'UI.DataField', Value: statusCount },
    { $Type: 'UI.DataField', Value: timeTaken },
    { $Type: 'UI.DataField', Label: 'Ticket', Value: ticket_ID }
];

annotate hRServiceSrv.HRReports with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: hRReportsID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: createdBy },
    { $Type: 'UI.DataField', Value: createdOn },
    { $Type: 'UI.DataField', Value: highPriorityCount },
    { $Type: 'UI.DataField', Value: mediumPriorityCount },
    { $Type: 'UI.DataField', Value: lowPriorityCount },
    { $Type: 'UI.DataField', Value: statusCount },
    { $Type: 'UI.DataField', Value: timeTaken },
    { $Type: 'UI.DataField', Label: 'Ticket', Value: ticket_ID }
  ]
};

annotate hRServiceSrv.HRReports with {
  ticket @Common.Text: { $value: ticket.ticketID, ![@UI.TextArrangement]: #TextOnly }
};

annotate hRServiceSrv.HRReports with {
  ticket @Common.Label: 'Ticket'
};

annotate hRServiceSrv.HRReports with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#title' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#createdBy' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#createdOn' }
];

annotate hRServiceSrv.HRReports with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate hRServiceSrv.HRReports with @UI.SelectionFields: [
  ticket_ID
];

annotate hRServiceSrv.EmployeeReports with @UI.HeaderInfo: { TypeName: 'EmployeeReport', TypeNamePlural: 'EmployeeReports', Title: { Value: employeeReportsID } };
annotate hRServiceSrv.EmployeeReports with {
  ID @UI.Hidden @Common.Text: { $value: employeeReportsID, ![@UI.TextArrangement]: #TextOnly }
};
annotate hRServiceSrv.EmployeeReports with @UI.Identification: [{ Value: employeeReportsID }];
annotate hRServiceSrv.EmployeeReports with {
  ticket @Common.ValueList: {
    CollectionPath: 'Ticket',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: ticket_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ticketID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'title'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'priority'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'reportedBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdOn'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'closedOn'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'responder'
      },
    ],
  }
};
annotate hRServiceSrv.EmployeeReports with @UI.DataPoint #title: {
  Value: title,
  Title: 'Title',
};
annotate hRServiceSrv.EmployeeReports with @UI.DataPoint #createdBy: {
  Value: createdBy,
  Title: 'Created By',
};
annotate hRServiceSrv.EmployeeReports with @UI.DataPoint #createdOn: {
  Value: createdOn,
  Title: 'Created On',
};
annotate hRServiceSrv.EmployeeReports with {
  employeeReportsID @title: 'ID';
  title @title: 'Title';
  createdBy @title: 'Created By';
  createdOn @title: 'Created On';
  priorityCount @title: 'Priority Count';
  statusCount @title: 'Status Count';
  timeTaken @title: 'Time Taken'
};

annotate hRServiceSrv.EmployeeReports with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: employeeReportsID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: createdBy },
    { $Type: 'UI.DataField', Value: createdOn },
    { $Type: 'UI.DataField', Value: priorityCount },
    { $Type: 'UI.DataField', Value: statusCount },
    { $Type: 'UI.DataField', Value: timeTaken },
    { $Type: 'UI.DataField', Label: 'Ticket', Value: ticket_ID }
];

annotate hRServiceSrv.EmployeeReports with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: employeeReportsID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: createdBy },
    { $Type: 'UI.DataField', Value: createdOn },
    { $Type: 'UI.DataField', Value: priorityCount },
    { $Type: 'UI.DataField', Value: statusCount },
    { $Type: 'UI.DataField', Value: timeTaken },
    { $Type: 'UI.DataField', Label: 'Ticket', Value: ticket_ID }
  ]
};

annotate hRServiceSrv.EmployeeReports with {
  ticket @Common.Text: { $value: ticket.ticketID, ![@UI.TextArrangement]: #TextOnly }
};

annotate hRServiceSrv.EmployeeReports with {
  ticket @Common.Label: 'Ticket'
};

annotate hRServiceSrv.EmployeeReports with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#title' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#createdBy' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#createdOn' }
];

annotate hRServiceSrv.EmployeeReports with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate hRServiceSrv.EmployeeReports with @UI.SelectionFields: [
  ticket_ID
];

annotate hRServiceSrv.KnowledgeBase with @UI.HeaderInfo: { TypeName: 'KnowledgeBase', TypeNamePlural: 'KnowledgeBases', Title: { Value: knowledgeBaseID } };
annotate hRServiceSrv.KnowledgeBase with {
  ID @UI.Hidden @Common.Text: { $value: knowledgeBaseID, ![@UI.TextArrangement]: #TextOnly }
};
annotate hRServiceSrv.KnowledgeBase with @UI.Identification: [{ Value: knowledgeBaseID }];
annotate hRServiceSrv.KnowledgeBase with {
  ticket @Common.ValueList: {
    CollectionPath: 'Ticket',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: ticket_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ticketID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'title'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'priority'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'reportedBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdOn'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'closedOn'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'responder'
      },
    ],
  }
};
annotate hRServiceSrv.KnowledgeBase with @UI.DataPoint #title: {
  Value: title,
  Title: 'Title',
};
annotate hRServiceSrv.KnowledgeBase with @UI.DataPoint #createdBy: {
  Value: createdBy,
  Title: 'Created By',
};
annotate hRServiceSrv.KnowledgeBase with @UI.DataPoint #createdOn: {
  Value: createdOn,
  Title: 'Created On',
};
annotate hRServiceSrv.KnowledgeBase with {
  knowledgeBaseID @title: 'ID';
  title @title: 'Title';
  createdBy @title: 'Created By';
  createdOn @title: 'Created On'
};

annotate hRServiceSrv.KnowledgeBase with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: knowledgeBaseID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: createdBy },
    { $Type: 'UI.DataField', Value: createdOn },
    { $Type: 'UI.DataField', Label: 'Ticket', Value: ticket_ID }
];

annotate hRServiceSrv.KnowledgeBase with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: knowledgeBaseID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: createdBy },
    { $Type: 'UI.DataField', Value: createdOn },
    { $Type: 'UI.DataField', Label: 'Ticket', Value: ticket_ID }
  ]
};

annotate hRServiceSrv.KnowledgeBase with {
  ticket @Common.Text: { $value: ticket.ticketID, ![@UI.TextArrangement]: #TextOnly }
};

annotate hRServiceSrv.KnowledgeBase with {
  ticket @Common.Label: 'Ticket'
};

annotate hRServiceSrv.KnowledgeBase with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#title' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#createdBy' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#createdOn' }
];

annotate hRServiceSrv.KnowledgeBase with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate hRServiceSrv.KnowledgeBase with @UI.SelectionFields: [
  ticket_ID
];

