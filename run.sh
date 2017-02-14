#!/bin/sh
set -e

if [ ! -n "$WERCKER_OPBEAT_NOTIFY_ORG_ID" ]
then
    echo 'missing or empty option org_id, please check wercker.yml'
fi

if [ ! -n "$WERCKER_OPBEAT_NOTIFY_APP_ID" ]
then
    echo 'missing or empty option app_id, please check wercker.yml'
fi

if [ ! -n "$WERCKER_OPBEAT_NOTIFY_SECRET_TOKEN" ]
then
    echo 'missing or empty option secret_token, please check wercker.yml'
fi

result=`curl https://intake.opbeat.com/api/v1/organizations/$WERCKER_OPBEAT_NOTIFY_ORG_ID/apps/$WERCKER_OPBEAT_NOTIFY_APP_ID/releases/ \
    -H "Authorization: Bearer $WERCKER_OPBEAT_NOTIFY_SECRET_TOKEN" \
    -d rev=$WERCKER_GIT_COMMIT \
    -d branch=$WERCKER_GIT_BRANCH \
    -d status=completed \
    --silent \
    --write-out "%{http_code}" \
    --output /dev/stderr`

echo
echo
if [ "$result" = "202" ]; then
  success "Notified Opbeat"
else
  echo "echoed to notify Opbeat"
fi
