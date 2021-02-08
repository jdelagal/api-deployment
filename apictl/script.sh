./apictl add-env -e dev --apim https://172.18.0.1:9443
./apictl login dev -u admin -p admin -k
./apictl list apis -e dev -k