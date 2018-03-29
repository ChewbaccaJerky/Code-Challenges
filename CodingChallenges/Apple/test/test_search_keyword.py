import sys
import os
import subprocess
import unittest



class TestSearchKeyword(unittest.TestCase):

    def setUp(self):
        self.route = os.getcwd() + '/Test_Folder'
        self.regex = '.txt'

    def test_missing_arguments(self):
        result = os.popen('python ../search_keyword.py').readline()
        self.assertEqual(result, '{}\n')

    def test_non_existent_root(self):
        result = os.popen('python ../search_keyword.py ./Tes_Folder .txt').read()
        self.assertRegexpMatches(result, 'No such file or directory')

    def test_working_route(self):
        command = "python ../search_keyword.py " + self.route + " test" 
        result = os.popen(command).read()
        print result
        self.assertNotEqual(result, {})

    # def test_matching_regex(self):
    #     command = "python ../search_keyword.py " + self.route + " .txt"
    #     result = os.popen(command).read()
    #     self.assertNotEqual(result, {})
    # def test_working_route_and_regex(self):

    # def test_non_matching_regex(self):
    

if __name__ == '__main__':
    unittest.main()


