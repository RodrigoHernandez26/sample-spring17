package com.example.demo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class DemoApplicationTests {

	@Autowired
	private DemoController demoController;

	@Test
	void contextLoads() {
	}

	@Test
	void testHelloWorld() {
		String result = demoController.hello();
		assert(result.equals("Hello, World!"));
	}

}
