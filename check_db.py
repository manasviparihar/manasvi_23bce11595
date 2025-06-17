from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")
db = client["medical_db"]
collection = db["records"]

records = list(collection.find({}, {'_id': 0}))
print("Records in DB:", records)

