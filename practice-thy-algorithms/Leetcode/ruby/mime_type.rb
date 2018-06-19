=begin
@The Goal
MIME types are used in numerous internet protocols to associate a media type (html, image, video ...) with the content sent. 
The MIME type is generally inferred from the extension of the file to be sent.

You have to write a program that makes it possible to detect the MIME type of a file based on its name.

@Rules
You are provided with a table which associates MIME types to file extensions. 
You are also given a list of names of files to be transferred and for each one of these files, you must find the MIME type to be used.

The extension of a file is defined as the substring which follows the last occurrence, if any, of the dot character within the file name.
If the extension for a given file can be found in the association table (case insensitive, e.g. TXT is treated the same way as txt), 
then print the corresponding MIME type. If it is not possible to find the MIME type corresponding to a file, 
or if the file doesn’t have an extension, print UNKNOWN.

=end

associations = {}
filenames = []

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i # Number of elements which make up the association table.
@q = gets.to_i # Number Q of file names to be analyzed.

@n.times do
    # ext: file extension
    # mt: MIME type.
    ext, mt = gets.split(" ")
    ext = ('.' + ext).downcase
    associations[ext] = mt
end

# print associations
# puts ""

@q.times do
    fname = gets.chomp # One file name per line.
    filenames << fname
    # puts fname
end

# print filenames
# puts ""
# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# For each of the Q filenames, display on a line the corresponding MIME type. If there is no corresponding type, then display UNKNOWN.

filenames.each do |fn|
    mime_type = ''
    
    # check if there is a file extensiion after parsing
    # expecting fn.split('') => ['asdfasd', .... , <file ext>] | [<file ext>]
    if !fn.split('.').empty?
        mime_type = '.' + fn.split('.')[-1].downcase
    else
        puts "UNKNOWN"
        next
    end
    
    # create regular expression for mime_type
    regex = /#{mime_type}$/
    # check if file ext is in associations and if fn matches regex
    if associations[mime_type] && regex =~ fn.downcase
        puts associations[mime_type]
    else
        puts "UNKNOWN"
    end
end