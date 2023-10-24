package net.store.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

//@Controller
public class ImageController {

    private final String FILE_DIR = "src/main/webapp/itemimages/";

    @GetMapping("/itemimages/{image_path}")
    @ResponseBody
    public String imageProcess(@PathVariable String image_path){


        return null;
    }
}
