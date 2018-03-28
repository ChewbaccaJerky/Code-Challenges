import sys
import os
import re
import pygal

'''
    Search_Keyword
    @params root_dir: directory current path
            keyword: regular expression searched
    @output print dictionary of Key: Relative Path and Value: Number of matched items

'''
result = {}
base_dir = os.getcwd()

def search_keyword(root_dir, keyword):
    # Change directory to root_dir
    os.chdir(root_dir)
    # Create regex object with keyword
    pattern = re.compile(keyword)
    # Retrieve items in current directory
    items = os.listdir(root_dir)

    dirs = []
    count = 0

    # print items
    # Iterate through directory items
    for item in items:
        # Count matching items
        if pattern.search(item):
            count += 1

        # Append directories to array
        if os.path.isdir(item):
            dirs.append(item)
    
    # Add results to store
    result[root_dir] = count

    # Recursive call to new directories
    for dir in dirs:
        new_dir = root_dir + '/' + dir
        search_keyword(new_dir, keyword)

    return result

'''
    Generate_Chart
    @params dictionary{path, count}
    @output generates bar chart of (X:Path, Y:Count)
'''

def generate_chart(list):
    bar_chart = pygal.Bar()

    # Append bars to chart
    for key in list:
        bar_chart.add(key, list[key])

    # Get Current Path
    path = os.getcwd() + '/' + 'keyword_chart.svg'
    bar_chart.render_to_file(path)
    

def main():
    if len(sys.argv) < 3:
        print {}
        return

    try:
        search_keyword(sys.argv[1], sys.argv[2])
    except Exception as e:
        print e
    else:
        os.chdir(base_dir)
        generate_chart(result)
        print result

if __name__ == "__main__":
    main()