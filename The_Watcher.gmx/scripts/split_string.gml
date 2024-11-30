/* Splits a string into an array based off of it's delimiter
 * @param arg0 - string to be split
 * @param arg1 - delimiter to split string by
 */

var str = argument0;
var delimiter = argument1;

var cur_index = 0;  //Current index for storing split string
var output; //Array to hold and return output
var cur_split_str = "";   //Holds current split being created

for (var i=1; i<string_length(str)+1; i++) {
    var cur_str = string_copy(str, i, 1)
    if(cur_str == delimiter){
        output[cur_index] = cur_split_str;
        cur_index++;
        cur_split_str = "";
    }else {
        cur_split_str += cur_str
        output[cur_index] = cur_split_str
    }
}

return output
