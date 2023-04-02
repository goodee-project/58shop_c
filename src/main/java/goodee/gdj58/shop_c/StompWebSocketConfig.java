package goodee.gdj58.shop_c;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@EnableWebSocketMessageBroker
public class StompWebSocketConfig implements WebSocketMessageBrokerConfigurer {
	
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/stomp/chat")
		        .setAllowedOriginPatterns("*") // http://43.200.113.246
		        .withSockJS();
    }

    /*어플리케이션 내부에서 사용할 path를 지정할 수 있음*/

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
    	log.debug("\u001B[44m" + "configureMessageBroker");
    	
    	// Client에서 SEND 요청을 처리
        registry.setApplicationDestinationPrefixes("/pub"); // /topic, /queue
        registry.enableSimpleBroker("/sub");
    }
}