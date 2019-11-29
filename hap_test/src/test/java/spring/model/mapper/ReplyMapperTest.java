package spring.model.mapper;

import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired; 
 
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import spring.model.bbs.ReplyDTO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations =
		{ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })

public class ReplyMapperTest {
	@Autowired
	private ReplyMapper mapper;


	/*
	 * @Test // @Ignore public void testMapper() { logger.info("mapper:" +
	 * mapper.getClass().getName()); }
	 */

	private static final Logger logger = LoggerFactory.getLogger(ReplyMapperTest.class);

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testRcount() {
		int bbsno = 1;
		logger.info("rcount:"+mapper.rcount(bbsno));
	}

	@Test
	@Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("bbsno", 1);
		map.put("sno", 1);
		map.put("eno", 5);
		List<ReplyDTO> list = mapper.list(map);
		logger.info("list:" + list);
	}

	@Test
	@Ignore
	public void testTotal() {
		int bbsno = 1;// 글번호
		int cnt = mapper.total(bbsno);
		logger.info("total:" + cnt);
	}

	@Test
	@Ignore
	public void testCreate() {
		ReplyDTO dto = new ReplyDTO();
		dto.setBbsno(1);
		dto.setContent("댓글1");
		dto.setId("1");

		assertTrue(mapper.create(dto) > 0);
	}

	@Test
	@Ignore
	public void testRead() {
		ReplyDTO dto = mapper.read(1);
		logger.info("dto"+dto);
	}

	@Test
	@Ignore
	public void testUpdate() {
		ReplyDTO dto = new ReplyDTO();
		dto.setContent("댓글2");
		dto.setRnum(10);
		assertTrue(mapper.update(dto)>0);
//		fail("Not yet implemented");
	}

	@Test
	@Ignore
	public void testDelete() {
		int rnum = 4;
		assertTrue(mapper.delete(rnum) > 0);
	}

}
