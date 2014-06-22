if [ ! -n "$WERCKER_CAMPFIRE_NOTIFY_TOKEN" ]; then
  error 'Please specify token property'
  exit 1
fi

OPBEAT_ORG_ID=`get_option opbeat_org_id`
OPBEAT_APP_ID=`get_option opbeat_app_id`
OPBEAT_SECRET_TOKEN=`get_option opbeat_secret_token`


curl https://opbeat.com/api/v1/organizations/$OPBEAT_ORG_ID/apps/$OPBEAT_APP_ID/releases \
    -H "Authorization: Bearer $OPBEAT_SECRET_TOKEN" \
    -d rev=$WERCKER_GIT_COMMIT \
    -d branch=$WERCKER_GIT_BRANCH \
    -d status=completed


success "Notified Opbeat"