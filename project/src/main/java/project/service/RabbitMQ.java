package project.service;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import com.rabbitmq.client.AMQP;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.Consumer;
import com.rabbitmq.client.DefaultConsumer;
import com.rabbitmq.client.Envelope;

public class RabbitMQ {
	
	private final static String QUEUE_NAME = "sendMail";
	Channel channel;
	Connection connection;
	
	public RabbitMQ() throws IOException, TimeoutException{
		ConnectionFactory factory = new ConnectionFactory();
		factory.setHost("localhost");
		connection = factory.newConnection();
		channel = connection.createChannel();
		channel.queueDeclare(QUEUE_NAME, false, false, false, null);
	}
	
	public void publish(String to, String subject,String content) throws IOException, TimeoutException{
		String message=to+"###"+subject+"###"+content;
		channel.basicPublish("", QUEUE_NAME, null, message.getBytes());
		channel.close();
		connection.close();
	}
	
	public void subscribe() throws IOException{
	    Consumer consumer = new DefaultConsumer(channel) {
	      @Override
	      public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties, byte[] body)
	          throws IOException {
	  		//MailService mailService =new MailService("username@gmail.com", "password");
	        String message = new String(body, "UTF-8");
	        String[] parts = message.split("###");
	        System.out.println(parts[0] + " "+  parts[1]+ " "+ parts[2]);
	        //mailService.sendMail(parts[0], parts[1], parts[2]);
	        System.out.println("Email sent!");
	      }
	    };
	    channel.basicConsume(QUEUE_NAME, true, consumer);
	  }
	
}
