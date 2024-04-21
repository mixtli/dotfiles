alias jdevex=jira issues list -s~Done -q 'project = "DEVEX"' --columns key,assignee,status,summary 
alias jstability=jira issues list -s~Done -q 'project = "ADAP" AND "Scrum Team[Dropdown]" = "ADAP Stability"' --columns key,assignee,status,summary

