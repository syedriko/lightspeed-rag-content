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
    parser.add_argument(
        "-p",
         "--db-path",
         required=True,
         nargs="+",
         help="path(s) to the vector db",
     )
    parser.add_argument(
        "-m", "--model-path", required=True, help="path to the embedding model"
    )
    parser.add_argument("-q", "--query", help="query to run")
    parser.add_argument("-k", "--top-k", type=int, help="similarity_top_k")
    args = parser.parse_args()

    os.environ["TRANSFORMERS_CACHE"] = args.model_path
    os.environ["TRANSFORMERS_OFFLINE"] = "1"

    Settings.llm = resolve_llm(None)
    Settings.embed_model = HuggingFaceEmbedding(model_name=args.model_path)

    # Create Faiss vector stores for each DB path
    faiss_vector_stores = []
    for db_path in args.db_path:
        faiss_vector_stores.append(FaissVectorStore.from_persist_dir(db_path))

    # Create StorageContexts for each vector store
    storage_contexts = []
    for fvs, db_path in zip(faiss_vector_stores, args.db_path):
        storage_contexts.append(
            StorageContext.from_defaults(
                vector_store=fvs,
                persist_dir=db_path
            )
        )

    # Load VectorStoreIndex for each vector store
    retrievers = []
    for sc in storage_contexts:
        retrievers.append(load_index_from_storage(storage_context=sc).as_retriever())

    retriever = QueryFusionRetriever(retrievers, similarity_top_k=5)
    for n in retriever.retrieve(args.query):
        print(n.__repr__())
