package com.bin.test;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.webAppContextSetup;

import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(value = {"file:WebContent/WEB-INF/root-context.xml","file:WebContent/WEB-INF/spring-servlet.xml"})
public class Test{

	@Autowired
	private WebApplicationContext wac;
	private MockMvc mockmvc;
	@Before
	public void setup(){
		this.mockmvc = webAppContextSetup(this.wac).build();
	}
	@org.junit.Test
	public void test(){
		try {
			mockmvc.perform(post("/admin/good/countByYear").param("id", "6").param("year", "2017")).andExpect(status().isOk()).andDo(print());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}