FROM ubuntu

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update 
RUN apt-get install -y curl vim python3 python3-pip git libffi-dev libssl-dev supervisor openssh-server git

COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

COPY id_rsa_ans.pub /root/.ssh/id_rsa.pub
COPY id_rsa_ans /root/.ssh/id_rsa 
RUN cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys 
RUN chmod 600 -R /root/.ssh/ 

RUN service ssh start

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf 
EXPOSE 22     

