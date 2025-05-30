package application.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.model.Plataforma;
import application.repository.PlataformaRepository;

@Controller
@RequestMapping(value = "/plataforma")
public class PlataformaController {
    @Autowired
    private PlataformaRepository plataformaRepo;

    @RequestMapping(value = "/list")
    public String select(Model ui){
        ui.addAttribute("plataformas", plataformaRepo.findAll());

        return "/plataforma/list";
    }

    @RequestMapping(value = "/insert")
    public String insert(){
        return "/plataforma/insert";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestParam("descricao") String descricao){
        Plataforma plataforma = new Plataforma();
        plataforma.setDescricao(descricao);

        plataformaRepo.save(plataforma);

        return "redirect:/plataforma/insert";
    }

    @RequestMapping(value = "/update/{id}")
    public String update(@PathVariable long id, Model ui){
        Optional<Plataforma> resultado = plataformaRepo.findById(id);

        if(resultado.isPresent()){
            ui.addAttribute("plataforma", resultado.get());
            
            return "/plataforma/update";
        }

        return "/plataforma/list";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam("id") long id, @RequestParam("descricao") String descricao){
        Optional<Plataforma> resultado = plataformaRepo.findById(id);

        if(resultado.isPresent()){
            resultado.get().setDescricao(descricao);
            plataformaRepo.save(resultado.get());
        }

        return "redirect:/plataforma/list";
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable long id, Model ui){
        Optional<Plataforma> resultado = plataformaRepo.findById(id);

        if(resultado.isPresent()){
            ui.addAttribute("plataforma", resultado.get());

            return "/plataforma/delete";
        }
        return "/plataforma/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam("id") long id){
        Optional<Plataforma> resultado = plataformaRepo.findById(id);

        if (resultado.isPresent()) {
            plataformaRepo.deleteById(id);            
        }
        return "redirect:/plataforma/list";
    }
}
