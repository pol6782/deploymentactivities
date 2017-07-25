import urllib2, json

log_jira = open("/data/das/bin/JIRA/Temp_files/log_jira", "w")
log_bamboo = open("/data/das/bin/JIRA/Temp_files/log_bamboo", "w")

def basic_authorization(user, password):
    s = user + ":" + password
    return "Basic " + s.encode("base64").rstrip()

req = urllib2.Request("https://jira.extra.sonera.fi/rest/api/2/search?jql=fixVersion=PI1v3",
                headers = {"Authorization": basic_authorization("ca_bamboo", "7Acq8WVD")})

f = urllib2.urlopen(req)
result = json.loads(f.read())

for doc in result['issues']:
	sequence = doc['key']
	print >>log_jira, sequence + ", "
	
log_jira.close()
	
data = open("/data/das/bin/JIRA/Temp_files/log_jira").read().replace('\n', '')
rm_last_character = data[:-2]
print >> log_bamboo, "curl -X POST --user ts_jira:489fjm28%1a -H \"Content-Type: application/json\" -d '{\"content\":\"" +rm_last_character +"\"}' http://moria.stadi.sonera.fi:8085/rest/api/latest/result/AD-RD7-bamboo/comment"

log_bamboo.close()