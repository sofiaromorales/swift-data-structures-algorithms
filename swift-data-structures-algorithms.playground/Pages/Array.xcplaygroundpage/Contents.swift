/*
 Generic collection
 Ordered
 Protocolos:
 * `Sequence` it can be iterated
 * `Collection` it can be traversed
 * `RandomAccessCollection` can retrieve element in a contatn amount of time
 
 Chacracteristics:
 * Order: elements are indexed from 0
 */

var people = ["Brian", "Stanley", "Ringo"]

people.append("Sofia") //time complexity O(1)
people.insert("Dani", at: 0) //time complexity O(n)
print(people)
