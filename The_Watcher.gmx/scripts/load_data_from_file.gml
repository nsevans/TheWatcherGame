/* Given a json file, load it into a list to be easily looped through
 * @param argument0 -> file name to read from
 * @return list of files contents
 */

var file_name = argument0
// Open the file for reading
var file = file_text_open_read(working_directory+"\data\"+file_name)

// Create the list that stores each line of the given file
var string_list = ds_list_create()

var i = 0
while(!file_text_eof(file)) {
    
    // Store the line in the array
    string_list[i++] = file_text_read_string(file)
    
    // Go to next line
    file_text_readln(file)
}
// Close the file
file_text_close(file)

return string_list


