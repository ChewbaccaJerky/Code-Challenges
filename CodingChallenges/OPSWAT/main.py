import os
import sys

from hash import Hash
from opswat_service import OpswatService

def scan_file(filename):
    path = os.path.realpath(filename)
    # Step 1 Create Hash with MD5 algorithm
    hash = Hash.create(path)

    # Step 2 Hash Look Up
    result = OpswatService.hash_lookup(hash)

    # Step 3 if found go to Step 6
    if result.json()[hash.upper()] != "Not Found":
        return OpswatService.result_to_string(result, filename)
    
    # Step 4 if not found then upload and return data_id
    else:
        url = "https://api.metadefender.com/v2/file"
        OpswatService.upload_file(path, hash)
    # Step 5 print pull result with data_id

    # Step 6 print result


 













def main():
    if len(sys.argv) < 2:
        print "Invalid number of arguments"
        return
    else:
        filename = sys.argv[1]
        try:
            scan_file(filename)
        except Exception as e:
            print e



if __name__ == "__main__":
    main()
