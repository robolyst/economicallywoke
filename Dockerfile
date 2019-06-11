FROM python:3.6.8-jessie

RUN apt update

# These are needed to install and run python packages
RUN apt install build-essential libssl-dev libffi-dev libxml2-dev libxslt1-dev \
  zlib1g-dev libgomp1 postgresql libpq-dev -y

# Create a virtualenv for the application dependencies.
RUN pip install --no-cache-dir virtualenv && virtualenv venv
ENV PATH /venv/bin:$PATH

# Install python packages
ADD ./requirements.txt /app/requirements.txt
RUN cd /app && pip install -r requirements.txt
