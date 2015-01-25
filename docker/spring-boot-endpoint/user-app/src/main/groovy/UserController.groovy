package hello

import java.util.concurrent.atomic.AtomicLong;
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseBody

@Controller
@RequestMapping("/users")
class UserController {

    final AtomicLong counter = new AtomicLong()

    @RequestMapping(method=RequestMethod.GET)
    @ResponseBody User processRequest(@RequestParam(value="firstName", required=false, defaultValue="Bob") String firstName,
                                            @RequestParam(value="lastName", required=false, defaultValue="Freemont") String lastName) {
        new User(counter.incrementAndGet(), firstName, lastName)
    }
}
