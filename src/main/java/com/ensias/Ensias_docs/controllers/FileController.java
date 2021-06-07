package com.ensias.Ensias_docs.controllers;

import com.ensias.Ensias_docs.models.Document;
import com.ensias.Ensias_docs.models.User;
import com.ensias.Ensias_docs.services.DocumentService;
import com.ensias.Ensias_docs.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/files")
public class FileController {

    @Autowired
    DocumentService documentService;
    @Autowired
    UserService us;
    @GetMapping("/{filename:.+}")
    @ResponseBody
    public ResponseEntity<Resource> serveFile(@PathVariable int filename) {

        Document document = documentService.finddocument(filename);

        Resource file = documentService.loadDocument(document);
        return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION,
                "attachment; filename=\"" +document.getDocName()+ "\"").body(file);
    }


}
