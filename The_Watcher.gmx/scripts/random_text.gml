/* Creates a random string of characters given a range of lengths
 * @param arg0 - min length of the string
 * @param arg1 - max length of the string
 */

str = ''
rand_len = irandom_range(argument0, argument1)
for(var i=0; i<rand_len; i++){
    str += chr(irandom_range(ord('!'), ord('_')))
}

return str
