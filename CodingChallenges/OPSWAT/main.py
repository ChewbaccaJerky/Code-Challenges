import os
import sys

from hash import Hash
from opswat_service import OpswatService

def scan_file(filename):
    
    # Step 1 Create Hash with SHA256 algorithm
    hash = Hash.create(filename)

    # Step 2 Hash Look Up
    OpswatService.hash_lookup(hash)

    # Step 3 if found go to Step 6

    # Step 4 if not found upload and return data_id

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