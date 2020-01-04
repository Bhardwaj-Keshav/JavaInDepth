package com.jarvis.config.processor;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.web.client.RestTemplate;

public class HTTPExecutor {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		RestTemplate rest = new RestTemplate();

		Map<String, Object> service = new LinkedHashMap<>();
		Map<String, Object> taskTemplate = new LinkedHashMap<>();
		Map<String, Object> containerSpec = new HashMap<>();
		containerSpec.put("Image", "redis");
		taskTemplate.put("ContainerSpec", containerSpec);
		service.put("name", "web");
		service.put("TaskTemplate", taskTemplate);
		HttpEntity<Map> req = new HttpEntity<Map>(service);

		System.out.println(rest.exchange("http://localhost:2375/services/create", HttpMethod.POST, req, String.class));

	}

}
