FROM registry.access.redhat.com/ubi9/ubi:latest

RUN dnf install -y python3.11 python3.11-pip wget
COPY requirements.cpu.txt .
RUN pip3.11 install --upgrade pip && pip3.11 install --no-cache-dir -r requirements.cpu.txt

#USER 0
WORKDIR /workdir
COPY embeddings_model ./embeddings_model
COPY byok/generate_embeddings_tool.py .
#RUN chown -R 1001:0 /workdir

#COPY s2i/byok-build/s2i/bin/ /usr/libexec/s2i

USER 1001

#CMD ["/usr/libexec/s2i/usage"]
