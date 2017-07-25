# configuration for deployment automation by adam.chalat@comarch.com (last update: 24.05.2017)

# string 'ENV_LIST' defines supported environments for upload process
# string 'SLACK_CREDENTIALS' determines webhook to application API
# string 'COMPONENTS_CHECK_${PREFIX}' defines which components should be checked (errors reporting)
# string '${RELEASE}' determines in first column: ROOM_ID for Slack API, in second: REMOTE_ADDRESS, in third: softlink name, in fourth: current_md5sum, in fifth: REMOTE_USER, in sixth: REMOTE_DIRECTORY

ENV_LIST TS-R5 TS-PI TS-NGSF TS-SA NGENA NGT

#--------------------------------------------------------------#
#---------------------- DEPLOYMENT LEADS ----------------------#
#--------------------------------------------------------------#

SLACK_CREDENTIALS https://hooks.slack.com/services/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

#--------------------------------------------------------------#
#------------------------- TS PROJECT -------------------------#
#--------------------------------------------------------------#

COMPONENTS_CHECK_TS CRM backend frontend cqrs bss-db DPS

TS-R5 telia_versions 62.71.178.7 latest5_rp TS-R5.md5sum
TS-PI telia_versions 62.71.178.7 latestPI TS-PI.md5sum
TS-NGSF telia_versions 62.71.178.7 latestNGSF TS-NGSF.md5sum
TS-SA telia_versions 62.71.178.7 latestSA TS-SA.md5sum

#--------------------------------------------------------------#
#----------------------- NGENA PROJECT ------------------------#
#--------------------------------------------------------------#

COMPONENTS_CHECK_NGENA CRM backend frontend DPS tum bpc aif

NGENA ngena_versions 10.132.4.72 latestNGN NGENA.md5sum bamboo /data/bamboo/repo-bin/uploaded_packages/NGENA/

#--------------------------------------------------------------#
#------------------------ NGT PROJECT -------------------------#
#--------------------------------------------------------------#

COMPONENTS_CHECK_NGT CRM DPS tum bpc

NGT ngt_versions 10.132.4.72 latestNGT NGT.md5sum bamboo /data/bamboo/repo-bin/uploaded_packages/NGT/
