FROM ubuntu:20.04

WORKDIR /app

RUN apt-get update && apt-get install \
  -y --no-install-recommends python3-dev python3.8-venv gcc

ENV PORT 8501
EXPOSE 8501

ENV PYTHONUNBUFFERED=1
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY . .
RUN pip3 install -r requirements.txt

CMD [ "streamlit", "run", "app.py" ]