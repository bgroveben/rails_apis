# Here we open a new file. The first argument is the name of the file.
# The second argument specifies that we're going to w-rite the file.
f = File.open("MyFirstFile.txt", "w")

# The write() method adds a string to the file.
# You can change this string to be your own message.
f.write("I made this on Codecademy!")

# close() will save and close the file.
f.close

# This time we'll open the file with r-ead permissions.
f = File.open("MyFirstFile.txt", "r")

# Here we'll print out the contents of the file.
puts f.read 

f.close
