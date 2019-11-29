package spring.sts.test;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TestLog {
	private static final Logger log = LoggerFactory.getLogger(TestLog.class);

	public static void main(String[] args) {
		System.out.println("로그 기록 테스트");
		log.info("TestLog 클래스를 실행했습니다." + new Date().toLocaleString());
		log.debug("TestLog 클래스를 실행했습니다." + new Date().toLocaleString());
	}
}
