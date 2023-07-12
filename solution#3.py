'''
Challenge #3 We have a nested object.
We would like a function where you pass in the object and a key and get back the value.
The choice of language and implementation is up to you. 
Example Inputs 
object = {“a”:{“b”:{“c”:”d”}}} 
key = a/b/c 

object = {“x”:{“y”:{“z”:”a”}}} 
key = x/y/z 
value = a
'''

def get_value_from_nested_object(object_dict, key_string):
    keys = key_string.split('/')
    value = object_dict

    try:
        for key in keys:
            value = value[key]
        return value
    except (KeyError, TypeError):
        return None
    


object = {"a":{"b":{"c":"d"}}} 
key = "a/b/c"

object = {"x":{"y":{"z":"a"}}} 
key = "x/y/z" 
result = get_value_from_nested_object(object, key)
print(result) 
