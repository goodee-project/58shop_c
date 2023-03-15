package goodee.gdj58.shop_c.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

@Service
public class SignupService {
	
	public static final String SECRET_KEY = "6LdO2uEkAAAAAA4cwUEVZ35tj_MnOlcgZLutOHg9";
    public static final String SITE_VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";
    @Autowired RestTemplateBuilder builder;

    // 구글 recaptcha
    public String recaptcha(String token){
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
        map.add("secret", SECRET_KEY);
        map.add("response", token);

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);

        ResponseEntity<String> response = builder.build().postForEntity(SITE_VERIFY_URL, request, String.class);

        return response.getBody();
    }
}
