$script:TicketsPath = if ($env:TICKETS_PATH) { $env:TICKETS_PATH } else { "${env:HOME}\tickets" }
