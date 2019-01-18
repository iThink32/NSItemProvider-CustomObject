# NSItemProvider-CustomObject
A simple class that shows you how to use a custom class for NSItemProvider used for drag/drop in a collection view
This repo has two classes namely MenuItemModel and Encodable+Additions
You can consider this as a utility repo / one stop solution instead of breaking your head searching for the solution.

## MenuItemProvider

- its a custom class , can contain any types of dicts,structs, enums provided they conform to Codable.
- you use it as follows :

```
let itemProvider = NSItemProvider(object:reqdItem)
```

where reqdItem is an instance of MenuItemModel

## Encodable+Additions :

is an extension that can be used to convert a dict to a Codable type or decode a Codable type into a dict.

For example If menuItemModel is an instance of MenuItemModel then

```
menuItemModel.dictionary() 
```

would give you a dictionary of type -> [AnyHashable:Any]? 

The other way is if you have a dictionary and a codable type , you can initialize it like so :

```
MenuItemModel(dict:[AnyHashable:Any])
```

I agree this is a very simple repo but it proved to be very useful to me for drag/drop collection view implementation.
