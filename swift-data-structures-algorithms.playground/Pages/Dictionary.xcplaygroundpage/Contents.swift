/*
 Generic collection
 Key:Value pairs
 Non-ordered
 Protocolos:
 * `Hashable` Key is hashable
 * `RandomAccessCollection` can retrieve element in a contatn amount of time
 * `Colection`
 
 Chacracteristics:
 * Order: elements are indexed from 0
 * Dictionary trades away the ability to maintain the order of its elements for fast insertion and searching.
 */

var scores: [String: Int] = ["Eric": 9, "Mark": 12, "Wayne": 1]
scores["Andres"] = 0 //Inserting is always O(1)

scores.keys.contains("Andres") //O(1)
scores.values.contains(12) //O(1)

