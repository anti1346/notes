#!/bin/bash

# MySQL 연결 정보 설정
DB_HOST="192.168.56.200"
DB_USER="testuser"
DB_PASS="testpassword1!"
DB_NAME="test_db"

# 반복 횟수 설정 (원하는 만큼 변경)
NUM_INSERTS=100

# INSERT 쿼리를 반복 실행
for ((i=1; i<=$NUM_INSERTS; i++)); do
  # 삽입할 데이터 준비 (user1, user1@example.com)
  USERNAME="user$i"
  EMAIL="user$i@example.com"

  # MySQL INSERT 쿼리 실행
  mysql -h$DB_HOST -u$DB_USER -p"$DB_PASS" --database=$DB_NAME -e "INSERT INTO users (username, email) VALUES ('$USERNAME', '$EMAIL');"

  # 성공 메시지 출력
  echo "Inserted data: username=$USERNAME, email=$EMAIL"

  # 1초 대기 (선택 사항)
  sleep 1
done

echo "Insertion completed."

# mysql -h192.168.56.200 -utestuser -p'testpassword1!' --database=users_db -e "INSERT INTO users (username, email) VALUES ('user1', 'user1@example.com');"
