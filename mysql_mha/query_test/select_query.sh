#!/bin/bash

# MySQL 연결 정보 설정
DB_HOST="192.168.56.200"
DB_USER="testuser"
DB_PASS="testpassword1!"
DB_NAME="test_db"

# 로그 파일 경로
LOG_FILE="user_select.log"

while true; do
  # MySQL SELECT 쿼리 실행
  #result=$(mysql -h$DB_HOST -u$DB_USER -p"$DB_PASS" --database=$DB_NAME -e "SELECT * FROM users;")
  result=$(mysql -h$DB_HOST -u$DB_USER -p"$DB_PASS" --database=$DB_NAME -e "SELECT * FROM users ORDER BY id DESC LIMIT 5;")
  
  # 쿼리 실행 결과 확인
  if [ $? -eq 0 ]; then
    # 성공한 경우: 결과 출력 (선택 사항)
    echo "Query result: $result"
  else
    # 실패한 경우: 실패 로그를 남김
    current_time=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$current_time] Query failed. Error: $result" >> $LOG_FILE
  fi

  # 1초 대기
  sleep 1
done  

#mysql -hlocalhost -utestuser -p'testpassword1!' --database=users_db -e "SELECT * FROM users ORDER BY id DESC LIMIT 5;"
