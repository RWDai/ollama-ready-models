FROM ollama/ollama:latest

RUN mkdir -p /root/.ollama/models

COPY ./models /root/.ollama/models/


EXPOSE 11434

HEALTHCHECK --interval=5s --timeout=3s --start-period=5s \
  CMD curl -f http://localhost:11434/api/version || exit 1

ENTRYPOINT ["/bin/ollama"]
CMD ["serve"]