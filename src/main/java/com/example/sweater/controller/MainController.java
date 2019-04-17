package com.example.sweater.controller;

import com.example.sweater.domain.Message;
import com.example.sweater.domain.User;
import com.example.sweater.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.List;
import java.util.Map;

@Controller
public class MainController {
    @Autowired
    private MessageRepo messageRepo;

    @GetMapping("/")
    public String greeting(
           // @RequestParam(name="name", required=false, defaultValue="World") String name,
          //  Map< String, Object> model
    )
    {
      //  model.put("name", name);
        return "greeting";
    }
    @GetMapping("/main")
    public String main(){
        return "main";
    }
    @PostMapping("addition")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag){
        Message message=new Message(text,tag,user);
        messageRepo.save(message);
        return "main";

    }

    @PostMapping("delete")
    public String delete(@RequestParam String tag){
        List<Message> messages = messageRepo.findByTag(tag);
        for(Message m:messages) {
            messageRepo.delete(m);
        }
        return "main";

    }

    @PostMapping("view_all")
    public String view_all(Map<String,Object> model ){
         Iterable<Message> messages=messageRepo.findAll();
         model.put("messages",messages);
         return "main";

    }

    @PostMapping("filter")
    public String filter(@RequestParam String tag,Map<String,Object> model ){
        List<Message> messages = messageRepo.findByTag(tag);
        model.put("messages",messages);
        return "main";

    }

}
