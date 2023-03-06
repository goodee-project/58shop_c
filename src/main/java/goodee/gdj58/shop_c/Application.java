package goodee.gdj58.shop_c;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan	// Filter 사용 설정
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

}
