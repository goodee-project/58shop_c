package goodee.gdj58.shop_c.service;


import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service
public class SignupService {
	/*
    public RecaptchaDTO token(String token) {
        String url = "https://www.google.com/recaptcha/api/siteverify";

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
        map.add("secret", "secret-key");
        map.add("response", token);

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);

        RecaptchaDTO response = restTemplate.postForObject( url, request, RecaptchaDTO.class );

        return response;
    }
*/
}
