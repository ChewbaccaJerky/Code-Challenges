import hashlib

class Hash:

    @staticmethod
    def create(filename):
        return hashlib.sha256(filename)