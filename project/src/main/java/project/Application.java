package project;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import project.service.RabbitMQ;


@SpringBootApplication
public class Application{	
	
		public static void main(String[] args) throws IOException, TimeoutException {
			RabbitMQ rabbitMQ=new RabbitMQ();
			rabbitMQ.subscribe();
			SpringApplication.run(Application.class, args);
		}

}
