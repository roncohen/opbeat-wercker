# Opbeat notification step

## Options

- `org_id` (required) The Opbeat org id 
- `app_id` (required) The Opbeat app id
- `secret_token` (required) The Opbeat secret token

## Example

```yaml
deploy:
  after-steps:
    - roncohen/opbeat_notify:
        org_id: YOUR_OPBEAT_ORG_ID
        app_id: YOUR_OPBEAT_APP_ID
        secret_token: YOUR_OPBEAT_SECRET_TOKEN
```

Alternatively, parametrize the configuration, and add deploy environment varibles in the Wercker interface:

```yaml
deploy:
  after-steps:
    - roncohen/opbeat_notify:
        org_id: $OPBEAT_ORG_ID
        app_id: $OPBEAT_APP_ID
        secret_token: $OPBEAT_SECRET_TOKEN
```
