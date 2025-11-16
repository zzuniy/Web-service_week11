# 1. Tomcat + JDK 17을 사용하는 기본 이미지
FROM tomcat:9.0-jdk17

# 2. 기존 기본 ROOT 앱 삭제 (기본 Tomcat 페이지)
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# 3. Maven 빌드 결과(war 파일)를 Tomcat에 복사
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# 4. Tomcat 포트 설정
EXPOSE 8080

# 5. Tomcat 실행 명령
CMD ["catalina.sh", "run"]
