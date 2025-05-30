package application.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.model.Genero;
import application.repository.GeneroRepository;

@Controller
@RequestMapping(value = "/genero")
public class GeneroController {
    @Autowired
    private GeneroRepository generoRepo;
    
    @RequestMapping(value = "/list")
    public String select(Model ui){
        ui.addAttribute("generos", generoRepo.findAll());

        return "/genero/list";
    }

    @RequestMapping(value = "/insert")
    public String insert(){
        return "genero/insert";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestParam("nome") String nome){
        Genero genero = new Genero();
        genero.setNome(nome);

        generoRepo.save(genero);

        return "redirect:/genero/insert";
    }

    @RequestMapping(value = "/update/{id}")
    public String update(Model ui, @PathVariable long id){
        Optional<Genero> resultado = generoRepo.findById(id);

        if(resultado.isPresent()){
            ui.addAttribute("genero", resultado.get());

            return "/genero/update";
        }
        return "/genero/list";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam("id") long id, @RequestParam("nome") String nome){
        Optional<Genero> resultado = generoRepo.findById(id);

        if(resultado.isPresent()){
            resultado.get().setNome(nome);
            generoRepo.save(resultado.get());
        }

        return "redirect:/genero/list";
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable long id ,Model ui){
        Optional<Genero> resultado = generoRepo.findById(id);

        if(resultado.isPresent()){
            ui.addAttribute("genero", resultado.get());

            return "/genero/delete";
        }

        return "/genero/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam("id") long id){
        Optional<Genero> resultado = generoRepo.findById(id);

        if (resultado.isPresent()) {
            generoRepo.deleteById(resultado.get().getId());
        }

        return "redirect:/genero/list";
    }
}