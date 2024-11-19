# Dockerfile описывает образ контейнера для удобной визуализации данных при помощи Python
FROM python:3.9

RUN pip install jupyter pandas numpy matplotlib seaborn scikit-learn

WORKDIR /home/jovyan/work

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--no-browser"]

