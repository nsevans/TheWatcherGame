/* Takes a list of strings and joins them together to create a single string
 * @param arg0 - list of strings to join together
 * @param arg1 - seperator for each string
 */

string_list = argument0
sep = argument1 
new_string = ""


for(var i=0; i<array_length_1d(string_list); i++){
    
    if i == array_length_1d(string_list) - 1{
        new_string += string_list[i]
    }else{    
        new_string += string_list[i] + '' + sep
    }
}

return new_string
