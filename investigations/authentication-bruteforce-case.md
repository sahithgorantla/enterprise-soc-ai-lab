# Authentication Brute-Force Investigation

## Observed activity

- 10 failed authentication attempts
- Same user
- Same source IP
- Followed by a successful authentication
- No subsequent endpoint/network/file telemetry was available

## Analyst assessment

The activity warranted investigation because of the repeated
authentication failures and subsequent successful login.

The available telemetry was insufficient to confirm compromise.

## Investigation pivots

- Identity
- Source IP
- Authentication timeline
- Successful login
- Post-authentication process activity
- Network connections
- File activity