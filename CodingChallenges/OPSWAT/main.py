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
    # Not Found have only a single key which is their Hash Value e.g {<Hash Value>: "Not Found"}
    if len(result.json().keys()) > 1:
        OpswatService.print_result(result, filename)
    # # Step 4 if not found then upload and return data_id
    else:
        data_id = OpswatService.upload_file(path, hash)
        # Step 5 repeatedly pull result with data_id
        result = OpswatService.get_results_by_data_id(data_id)
        while len(result.json.keys) < 2:
            result = OpswatService.get_results_by_data_id(data_id)
        # Step 6 print result
        OpswatService.print_result(result, filename)

def main():
    if len(sys.argv) < 2:
        print "Invalid number of arguments"
        return
    else:
        filename = sys.argv[1]
        try:
            scan_file(filename)
        except Exception as e:
            print e.message + "and"
            

if __name__ == "__main__":
    main()
