"""Utility script for querying RAG database."""

import argparse
import os
#import faiss
import json


from llama_index.core import Settings, load_index_from_storage
from llama_index.core.llms.utils import resolve_llm
from llama_index.core.storage.storage_context import StorageContext
from llama_index.embeddings.huggingface import HuggingFaceEmbedding
from llama_index.vector_stores.faiss import FaissVectorStore
from llama_index.core.retrievers import QueryFusionRetriever

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Utility script for querying RAG database"
    )
    # parser.add_argument(
    #     "-p",
    #     "--db-path",
    #     required=True,
    #     help="path to the vector db",
    # )
    # parser.add_argument("-x", "--product-index", required=True, help="product index")
    parser.add_argument(
        "-m", "--model-path", required=True, help="path to the embedding model"
    )
    parser.add_argument("-q", "--query", help="query to run")
    parser.add_argument("-k", "--top-k", type=int, help="similarity_top_k")
#    parser.add_argument("-n", "--node", help="retrieve node")
    args = parser.parse_args()

    os.environ["TRANSFORMERS_CACHE"] = args.model_path
    os.environ["TRANSFORMERS_OFFLINE"] = "1"

    Settings.llm = resolve_llm(None)
    Settings.embed_model = HuggingFaceEmbedding(model_name=args.model_path)

    # # Load the two FaissVectorStore indices from their respective directories
    # faiss_vector_store_1 = FaissVectorStore.from_persist_dir("/home/syedriko/lightspeed-config/vector_db/serverless/1.33")
    # faiss_vector_store_2 = FaissVectorStore.from_persist_dir("/home/syedriko/lightspeed-config/vector_db/ocp_product_docs/4.15")

    # # Retrieve the actual FAISS indices from each FaissVectorStore
    # faiss_index1 = faiss_vector_store_1._faiss_index
    # faiss_index2 = faiss_vector_store_2._faiss_index

    # # Combine the two FAISS indices using IndexShards
    # dimension = faiss_index1.d  # Assuming both indices have the same dimension
    # combined_index = faiss.IndexShards(dimension)

    # # Add the loaded FAISS indices as shards
    # combined_index.add_shard(faiss_index1)
    # combined_index.add_shard(faiss_index2)

    # # Now wrap the combined FAISS index in a new FaissVectorStore
    # faiss_vector_store_combined = FaissVectorStore(faiss_index=combined_index)

    # # Create a StorageContext using the combined FaissVectorStore
    # storage_context = StorageContext.from_defaults(
    #     vector_store=faiss_vector_store_combined,
    #     #persist_dir="/home/syedriko/lightspeed-config/vector_db/combined",
    # )

    # # Load the vector index from the storage context
    # vector_index = load_index_from_storage(storage_context=storage_context)


    # Directories containing the saved FAISS indices and metadata
    index_dir_1 = '/home/syedriko/lightspeed-config/vector_db/serverless/1.33'
    index_dir_2 = '/home/syedriko/lightspeed-config/vector_db/ocp_product_docs/4.15'

    # Load the FAISS Vector Stores from the respective directories
    faiss_vector_store_1 = FaissVectorStore.from_persist_dir(index_dir_1)
    faiss_vector_store_2 = FaissVectorStore.from_persist_dir(index_dir_2)

    # Create StorageContexts for each vector store
    storage_context_1 = StorageContext.from_defaults(
        vector_store=faiss_vector_store_1,
        persist_dir=index_dir_1
    )

    storage_context_2 = StorageContext.from_defaults(
        vector_store=faiss_vector_store_2,
        persist_dir=index_dir_2
    )

    # Load VectorStoreIndex for each FAISS vector store
    vector_index_1 = load_index_from_storage(storage_context=storage_context_1)
    vector_index_2 = load_index_from_storage(storage_context=storage_context_2)

    retriever = QueryFusionRetriever([vector_index_1.as_retriever(), vector_index_2.as_retriever()], similarity_top_k=5)
    for n in retriever.retrieve(args.query):
        print(n.__repr__())


    # Create a ComposedIndex to combine the two vector store indexes
    #composite_index = SummaryIndex([vector_index_1, vector_index_2])

    # Set up query engines for each index
    # query_engine_1 = vector_index_1.as_query_engine()
    # query_engine_2 = vector_index_2.as_query_engine()

    # Function to query both indexes and combine results
    # def query_combined_indexes(query_str, top_k=5):
    #     # Query both indexes
    #     results_1 = query_engine_1.query(str_or_query_bundle=query_str)
    #     results_2 = query_engine_2.query(str_or_query_bundle=query_str)

    #     # Combine the results (you can sort them by score if needed)
    #     combined_results = results_1.source_nodes + results_2.source_nodes
    #     combined_results.sort(key=lambda x: x.score, reverse=True)  # Assuming higher scores are better
    #     return combined_results[:args.top_k]  # Return the top K results overall

    # # Query both indexes
    # results = query_combined_indexes(query_str=args.query, top_k=5)

    # for r in results:
    #     print(r.__repr__())

    # Set up a query engine for the composite index
#    query_engine = VectorIndexQueryEngine(index=composite_index)


    # storage_context = StorageContext.from_defaults(
    #     vector_store=FaissVectorStore.from_persist_dir(args.db_path),
    #     persist_dir=args.db_path,
    # )
    # vector_index = load_index_from_storage(
    #     storage_context=storage_context,
    #     index_id=args.product_index,
    # )

    # serverless_storage_context = StorageContext.from_defaults(
    #     vector_store=FaissVectorStore.from_persist_dir("/home/syedriko/lightspeed-config/vector_db/serverless/1.33/"),
    #     persist_dir="/home/syedriko/lightspeed-config/vector_db/serverless/1.33/",
    # )
    # serverless_vector_index = load_index_from_storage(
    #     storage_context=serverless_storage_context,
    #     index_id="serverless-1.33",
    # )

    # retriever = composite_index.as_retriever(similarity_top_k=args.top_k)
    # for n in retriever.retrieve(args.query):
    #     print(n.__repr__())
