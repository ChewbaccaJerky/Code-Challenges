import requests
API_KEY = "ba73d9dfb10ee957005455ba228a0c00"
test_hash = "E71A6D8760B37E45FA09D3E1E67E2CD3"
class OpswatService:

    @staticmethod
    def hash_lookup(hash):
        headers = {'apikey': API_KEY}
        url = "https://api.metadefender.com/v2/hash/" + hash
        result = requests.get(url, headers=headers)
        return result


    @staticmethod
    def upload_file(path, filename):
        url = "https://api.metadefender.com/v2/file"
        print filename

    @staticmethod
    def get_results(data_id):
        print data_id

    @staticmethod
    def result_to_string(res, filename):

        result = res.json()["scan_results"]
        details = result["scan_details"]

        print "\nfilename: " + filename
        print "overall status: " + result["scan_all_result_a"] + "\n"

        for key in details:
            print "engine: " + key
            if details[key]["threat_found"] == "":
                print "overall status: Clean"
            else:
                print "threat_found: " + details[key]["threat_found"]
                print "scan_result: " + str(details[key]["scan_result_i"])
                print "def_time: " + details[key]["def_time"]

            print "\n"
