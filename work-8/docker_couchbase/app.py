from couchbase.cluster import Cluster, ClusterOptions
from couchbase.auth import PasswordAuthenticator
from couchbase.collection import UpsertOptions
from couchbase.exceptions import CouchbaseException

CB_USERNAME = 'admin'
CB_PASSWORD = 'password'
CB_BUCKET = 'example_bucket'

def main():
    try:
        cluster = Cluster('couchbase://localhost', ClusterOptions(PasswordAuthenticator(CB_USERNAME, CB_PASSWORD)))

        bucket = cluster.bucket(CB_BUCKET)
        bucket.on_connect()
        collection = bucket.default_collection()

        print("Adding document...")
        doc_id = "user:1001"
        document = {"name": "Alice", "email": "alice@example.com", "age": 30}
        collection.upsert(doc_id, document, UpsertOptions(timeout=5))

        print("Fetching document...")
        result = collection.get(doc_id)
        print("Document fetched:", result.content_as[dict])

        print("Updating document...")
        updated_document = {"name": "Alice", "email": "alice@newdomain.com", "age": 31}
        collection.replace(doc_id, updated_document)
        print("Document updated successfully!")

        result = collection.get(doc_id)
        print("Updated document:", result.content_as[dict])

    except CouchbaseException as e:
        print("Couchbase error:", e)
    except Exception as ex:
        print("An error occurred:", ex)


if __name__ == "__main__":
    main()
