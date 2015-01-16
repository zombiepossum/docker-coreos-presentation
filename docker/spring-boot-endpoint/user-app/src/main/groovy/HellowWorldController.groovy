package hello

import java.util.concurrent.atomic.AtomicLong;
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseBody

@Controller
@RequestMapping("/hello-world")
class HelloWorldController {

    static final String template = "Hello, %s!"
    final AtomicLong counter = new AtomicLong()

    @RequestMapping(method=RequestMethod.GET)
    @ResponseBody Greeting sayHello(@RequestParam(value="name", required=false, defaultValue="Stranger") String name) {
        new Greeting(counter.incrementAndGet(), String.format(template, name))
    }

}
