# 014 Groups

## Introduction

### Purpose

In this section we will learn how use groups of objects in Python.


### Prerequisites

You will need some understanding of the following:


* [001 Using Notebooks](001_Notebook_use.md)
* [005 Getting help](005_Help.md)
* [010 Variables, comments and print()](010_Python_Introduction.md)
* [011 Data types](011_Python_data_types.md) In particular, you should be understand strings.
* [012 String formatting](012_Python_strings.md)
* [013_Python_string_methods](013_Python_string_methods.md)

In the exercises below, make use of f-strings when building statements to print.

### Timing

The session should take around 30 minutes.



## Groups of things
Very often, we will want to group items together. There are several main mechanisms for doing this in Python, known as:

* string e.g. `hello`
* tuple, e.g. `(1, 2, 3)`
* list, e.g. `[1, 2, 3]`

A slightly different form of group is a dictionary:

* dict, e.g. `{1:'one', 2:'two', 3:'three'}`

You will notice that each of the grouping structures `tuple`, `list` and `dict` use a different form of bracket and that quotes are used to bracket a string.

We have seen that a string is an ordered collection in the material above, so will deal with the others here.

We noted the concept of length (`len()`), that elements of the ordered collection could be accessed via an index or slice. All of these same ideas apply to the first set of groups (string, tuple, list, numpy array) as they are all ordered collections.

A dictionary is not (by default) ordered, however, so indices have no role. Instead, we use 'keys'.

###  `tuple`
A tuple is a group of items separated by commas. In the case of a tuple, the brackets are optional.
You can have a group of differnt types in a tuple (e.g. `int`, `float`, `str`, `bool`)

#### Using a `tuple`


```python
# for spacing
dash = '\n----------'

# load into the tuple

t = (1, 2, 'three', False)

# unload from the tuple
# notice we must have the same number of items
a,b,c,d = t

print(t,dash)
print(a,b,c,d,dash)

print('the type of t is',type(t))
```

    (1, 2, 'three', False) 
    ----------
    1 2 three False 
    ----------
    the type of t is <class 'tuple'>


If there is only one element in a tuple, you must put a comma , at the end, otherwise it is not interpreted as a tuple:




```python
t = (1)
print (t,type(t))
t = (1,)
print (t,type(t))
```

    1 <class 'int'>
    (1,) <class 'tuple'>


You can have an empty tuple though:




```python
t = ()
print (t,type(t))
```

    () <class 'tuple'>


#### Exercise

* create a tuple called `t` that contains the integers `1` to `5` inclusive
* print out the value of `t`
* use the tuple to set variables `a1`,`a2`,`a3`,`a4`,`a5`
* print  `a1`,`a2`,`a3`,`a4`,`a5`


### `list`
A `list` is similar to a `tuple`. One main difference is that you can **change individual elements in a list but not in a tuple**.
To convert between a list and tuple, use the 'casting' methods `list()` and `tuple()`:


```python

# a tuple
t0 = (1,2,3)

# cast to a list
l = list(t0)

# cast to a tuple
t = tuple(l)

print('type of {} is {}'.format(t,type(t)))
print('type of {} is {}'.format(l,type(l)))
```

    type of (1, 2, 3) is <class 'tuple'>
    type of [1, 2, 3] is <class 'list'>


You can concatenate (join) lists or tuples with the `+` operator:




```python
l0 = [1,2,3]
l1 = [4,5,6]

l = l0 + l1
print ('joint list:',l)
```

    joint list: [1, 2, 3, 4, 5, 6]


A common method associated with lists or tuples is:
* `index()`


```python
l0 = [2,8,4,32,16]

# print the index of the item integer 4 
# in the tuple / list

item_number = 4

# Note the dot . here
# as index is a method of the class list
ind  = l0.index(item_number)

# notice that this is different
# as len() is not a list method, but 
# does operatate on lists/tuples
# Note: do not use len as a variable name!
llen = len(l0)

print(f'the index of {item_number} in {l0} is {ind}')
print(f'the length of the {type(l0)} {l0} is {llen}')
```

    the index of 4 in [2, 8, 4, 32, 16] is 2
    the length of the <class 'list'> [2, 8, 4, 32, 16] is 5


#### Exercise

* copy the code to a new code block below, and test that this works with lists, as well as tuples

#### Exercise

* set a list called `l0` with `l0 = [2,8,4,32,16]`
* find the index of the integer 16 in the tuple/list
* what is the index of the first item?
* what is the length of the tuple/list?
* what is the index of the last item?

A list has a much richer set of methods than a tuple. This is because we can add or remove list items (but not tuple).

* `insert(i,j)` : insert `j` beore item `i` in the list
* `append(j)` : append `j` to the end of the list
* `sort()` : sort the list

Recall from [005_Help](005_Help.md#Exercise) that `sort()` is an `in-place` operation, and remeber the consequences of that. Notice that `insert()` and `append()` are also `in-place` operations.

This list of methods suggests that tuples and lists are 'ordered' (i.e. they maintain the order they are loaded in) so that indiviual elements may be accessed through an 'index'. The index values start at 0 as we saw above. The index of the last element in a list/tuple is the length of the group, minus 1. This can also be referred to an index `-1`.


```python
l0 = [2,8,4,32,16]

# insert 64 at the begining (before item 0)
# Note that this inserts 'in place'
# i.e. the list is changed by calling this
l0.insert(0,64)

# insert 128 *before* the last item (item -1)
l0.insert(-1,128)

# append 256 on the end
l0.append(256)

# copy the list and sort the copy
# Note the use of the copy() method here
# to create a copy because the in-place method
# will change l0
l1 = l0.copy()

# Note that this sorts 'in place'
# i.e. the list is changed by calling this
l1.sort()

print(f'the list {l0} once sorted is {l1}')
```

    the list [64, 2, 8, 4, 32, 128, 16, 256] once sorted is [2, 4, 8, 16, 32, 64, 128, 256]


#### Exercise

* set a list called `l0` with `l0 = [2,8,4,32,16]`
* find the index of `16` in this list
* use this insert the number `128` between the entries for `32` and `16`
* take a copy of `l0`, call it `l0_test` and insert the string `'hello world'` at index `-2`
* what positive index number could we have used in place of `-2` here?
* why?

### multiple dimensional lists

Lists and tuples are not limited to a single dimension. Sometimes we will want to define multi-dimensional lists, e.g.:         


```python
x = [[1,2,3],[4,5,6,7],[9,[4,2]],8]
print(x)
print(x[1])
print(x[1][2])
```

    [[1, 2, 3], [4, 5, 6, 7], [9, [4, 2]], 8]
    [4, 5, 6, 7]
    6


but the structure and parsing of this is now quite complicated.

Using multiple dimensions is sometime necessary, but can cause complications. Often we can find a simpler alternative.

One time we may want them is in associating one list with another, for example:


```python
values = [1,2,3,4]
keys = ['one','two','three','four']

combined = [values,keys]
print(combined)
```

    [[1, 2, 3, 4], ['one', 'two', 'three', 'four']]


This is a *regular* list, because the length of the sub-list is the same in both cases. 

###  `dict`



The collections we have used so far have all been ordered. This means that we can refer to a particular element in the group by an index, e.g. `array[10]`.

A dictionary is not (by default) ordered. Instead of indices, we use 'keys' to refer to elements: each element has a key associated with it. It can be very useful for data organisation (e.g. databases) to have a key to refer to, rather than e.g. some arbitrary column number in a gridded dataset.

A dictionary is defined as a group in braces (curley brackets). For each elerment, we specify the key and then the value, separated by `:`.


```python
a = {'one': 1, 'two': 2, 'three': 3}

# we then refer to the keys and values in the dict as:

print (f'a:\n\t {a}')
print (f'a.keys():\n\t {a.keys()}')     # the keys
print (f'a.values():\n\t {a.values()}') # returns the values
print (f'a.items():\n\t {a.items()}')   # returns a list of tuples
```

    a:
    	 {'one': 1, 'two': 2, 'three': 3}
    a.keys():
    	 dict_keys(['one', 'two', 'three'])
    a.values():
    	 dict_values([1, 2, 3])
    a.items():
    	 dict_items([('one', 1), ('two', 2), ('three', 3)])


We refer to specific items using the key e.g.:


```python
print(a['one'])
```

    1


You can add to a dictionary using the in-place operator `update`:


```python
help(dict.update)
```

    Help on method_descriptor:
    
    update(...)
        D.update([E, ]**F) -> None.  Update D from dict/iterable E and F.
        If E is present and has a .keys() method, then does:  for k in E: D[k] = E[k]
        If E is present and lacks a .keys() method, then does:  for k, v in E: D[k] = v
        In either case, this is followed by: for k in F:  D[k] = F[k]
    



```python
a.update({'four':4,'five':5})
print(a)

# or for a single value
a['six'] = 6
print(a)
```

    {'one': 1, 'two': 2, 'three': 3, 'four': 4, 'five': 5}
    {'one': 1, 'two': 2, 'three': 3, 'four': 4, 'five': 5, 'six': 6}


Quite often, you find that you have the keys you want to use in a dictionary as a list or array, and the values in another list.

In such a case, we can use the method `zip(keys,values)` to load into the dictionary. For example:


```python
values = [1,2,3,4]
keys = ['one','two','three','four']

a = dict(zip(keys,values))

print(a)
```

    {'one': 1, 'two': 2, 'three': 3, 'four': 4}


#### Exercise

* create a list called `months` with the names of the months of the year
* create a list called `ndays` with the number of days in each month (for this year)
* confirm that the two lists have the same length (12)
* Use these two lists to make a dictionary called `days_in_month` with the key as month name and value as the number of days in that month.
* print out the dictionary and confirm it is as expected
* set a variable `m` to be the name of a month
* using `m` and your dictionary, print out the number of days in month `m`

## Summary

In this section, we have extended the types of data we might come across to include groups. We dealt with ordered groups of various types (`tuple`, `list`). We saw dictionaries as collections with which we refer to individual items with a key. We saw how we can use `zip()` to help load a dataset from arrays into a dictionary.

You should know how to build, access and modify strings, lists, tuples and dictionaries. You should be very familiar with formatted print statements by now.