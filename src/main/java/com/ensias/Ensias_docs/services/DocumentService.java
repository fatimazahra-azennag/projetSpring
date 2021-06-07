package com.ensias.Ensias_docs.services;


import com.ensias.Ensias_docs.models.Document;
import com.ensias.Ensias_docs.models.Element;
import com.ensias.Ensias_docs.repositories.DocumentRepository;
import com.ensias.Ensias_docs.repositories.ElementRepository;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.print.Doc;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Data
@Service
public class DocumentService {

    @Autowired
    ElementRepository elementRepository;
    @Autowired
    private DocumentRepository documentRepository;
    @Autowired
    private StorageService storageService;

    public void saveDocument(int elm_id, MultipartFile file,String type){


        Optional<Element> elementOp = elementRepository.findById(elm_id);
        if(elementOp.isPresent()){
            Document document = new Document();
            document.setDoc_elm(elementOp.get());
            document.setDocName(file.getOriginalFilename());
            document.setDocMime(file.getContentType());
            document.setDocPath("NO NEED");
            document.setDocType(type);

            try {
                documentRepository.save(document);
                storageService.store(file,document.getDoc_elm().getElm_id()+"",document.getDoc_id()+"");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public Resource loadDocument(Document document){
        return  storageService.loadResource(document);
    }
    public Document finddocument(int doc_id){
        Optional<Document> docOp = documentRepository.findById(doc_id);
        if(docOp.isPresent()){
            return docOp.get();
        }
        return null;
    }
    public List<Document> findDocByElement(int id_elm){
        List<Document> documentElms=new ArrayList<Document>();
        List<Document> documents=documentRepository.findAll();
        Element element=elementRepository.findById(id_elm).get();
        for(Document doc:documents){
            if(element.equals(doc.getDoc_elm()))
                documentElms.add(doc);

        }
        return  documentElms;

    }
    public List<String> getTypes(List<Document> docs){
        List<String> types = new ArrayList<>();
        for(Document doc : docs) {
            if(!types.contains(doc.getDocType())) types.add(doc.getDocType());
        }
        return types;
    }

}
