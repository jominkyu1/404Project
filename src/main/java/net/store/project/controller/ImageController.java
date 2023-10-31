package net.store.project.controller;

import net.store.project.api.ImageHandler;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
/**
 * 배포환경에서 사용할 IMAGE CONTROLLER
 * */
public class ImageController {

    private final String FILE_DIR = ImageHandler.FILE_DIR;

    @GetMapping("/itemimages/{date_path}/{image_path}")
    @ResponseBody
    public Resource imageProcess(@PathVariable String date_path, @PathVariable String image_path) throws MalformedURLException {
        image_path = date_path + "/" + image_path;
        Path itemPath = Paths.get(FILE_DIR + image_path);

        return new UrlResource("file:" + itemPath);
    }
}
