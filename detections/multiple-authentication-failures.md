# Multiple Authentication Failures

## Objective

Detect repeated authentication failures that may indicate
credential guessing or brute-force activity.

## Detection logic

Index:
lab-security-events*

Filter:
event.outcome: "failure"
AND event.type: "authentication"

Group by:
user.name
source.ip

Threshold:
>= 10 events

Rule schedule:
Every 10 minutes

Additional look-back:
1 minute

## Investigation

When triggered, investigate:

1. Is the account expected to authenticate?
2. Is the source IP expected?
3. Did authentication eventually succeed?
4. What happened after successful authentication?
5. Are other accounts or systems affected?

## Limitations

This detection can miss distributed attacks where attempts are
spread across multiple source IP addresses.

A separate password-spraying/distributed-authentication detection
will be added later.