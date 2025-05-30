package application.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.model.Modo;
import application.repository.ModoRepository;

@Controller
@RequestMapping(value = "/modo")
public class ModoController {
    @Autowired
    private ModoRepository modoRepo;

    @RequestMapping(value = "/list")
    public String select(Model ui){
        ui.addAttribute("modos", modoRepo.findAll());

        return "/modo/list";
    }

    @RequestMapping(value = "/insert")
    public String insert(){
        return "/modo/insert";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestParam("descricao") String descricao){
        Modo modo = new Modo();
        modo.setDescricao(descricao);

        modoRepo.save(modo);
        
        return "redirect:/modo/insert";
    }

    @RequestMapping(value = "/update/{id}")
    public String update(@PathVariable long id, Model ui){
        Optional<Modo> resultado = modoRepo.findById(id);
        if(resultado.isPresent()){
            ui.addAttribute("modo", resultado.get());
            return "/modo/update";
        } 
        return "redirect:/modo/list";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam("id") long id, @RequestParam("descricao") String descricao){
        Optional<Modo> resultado = modoRepo.findById(id);

        if (resultado.isPresent()) {
            resultado.get().setDescricao(descricao);
            modoRepo.save(resultado.get());
        }

        return "redirect:/modo/list";
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable long id,Model ui){
        Optional<Modo> resultado = modoRepo.findById(id);

        if (resultado.isPresent()) {
            ui.addAttribute("modo", resultado.get());
            
            return "/modo/delete";
        }

        return "/modo/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam("id") long id){
        modoRepo.deleteById(id);
        
        return "redirect:/modo/list";
    }
}
