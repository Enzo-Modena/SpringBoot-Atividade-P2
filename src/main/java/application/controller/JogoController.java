package application.controller;

import java.util.HashSet;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import application.model.Genero;
import application.model.Jogo;
import application.model.Modo;
import application.model.Plataforma;
import application.repository.GeneroRepository;
import application.repository.JogoRepository;
import application.repository.ModoRepository;
import application.repository.PlataformaRepository;

@Controller
@RequestMapping(value = "/jogo")
public class JogoController {
    @Autowired
    private JogoRepository jogoRepo;
    @Autowired
    private PlataformaRepository plataformaRepo;
    @Autowired
    private GeneroRepository generoRepo;
    @Autowired
    private ModoRepository modoRepo;

    @RequestMapping(value = "/list")
    public String select(Model ui){
        ui.addAttribute("jogos", jogoRepo.findAll());

        return "/jogo/list";
    }

    @RequestMapping(value = "/insert")
    public String insert(Model ui){
        ui.addAttribute("plataformas", plataformaRepo.findAll());
        ui.addAttribute("generos", generoRepo.findAll());
        ui.addAttribute("modos", modoRepo.findAll());

        return "/jogo/insert";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestParam("titulo") String titulo, 
                        @RequestParam("id_plataforma") long[] idPlataformas, 
                        @RequestParam("id_genero") long[] idGeneros,
                        @RequestParam("id_modo") long idModo){
        
        Optional<Modo> resultModo = modoRepo.findById(idModo);

        if(resultModo.isPresent()){
            Jogo jogo = new Jogo();
            jogo.setTitulo(titulo);
            jogo.setModo(resultModo.get());
            
            for (long id : idGeneros) {
                Optional<Genero> resultGenero = generoRepo.findById(id);
    
                if (resultGenero.isPresent()) {
                    jogo.getGeneros().add(resultGenero.get());
                }
            }

            for (long id : idPlataformas){
                Optional<Plataforma> resultPlataforma = plataformaRepo.findById(id);

                if (resultPlataforma.isPresent()) {
                    jogo.getPlataformas().add(resultPlataforma.get());
                }
            }

            jogoRepo.save(jogo);
        }
        return "redirect:/jogo/insert";
    }

    @RequestMapping(value = "/update/{id}")
    public String update(@PathVariable long id, Model ui){
        Optional<Jogo> resultado = jogoRepo.findById(id);

        if(resultado.isPresent()){
            ui.addAttribute("jogo", resultado.get());
            ui.addAttribute("plataformas", plataformaRepo.findAll());
            ui.addAttribute("generos", generoRepo.findAll());
            ui.addAttribute("modos", modoRepo.findAll());
            return "/jogo/update";
        }
        return "/jogo/list";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam("id") long id,
                        @RequestParam("titulo") String titulo,
                        @RequestParam("id_plataforma") long[] idPlataformas,
                        @RequestParam("id_genero") long[] idGeneros,
                        @RequestParam("id_modo") long idModo){
        Optional<Jogo> resultJogo = jogoRepo.findById(id);
        
        if(resultJogo.isPresent()){
            Jogo jogo = resultJogo.get();
            jogo.setTitulo(titulo);
            
            Optional<Modo> resultModo = modoRepo.findById(idModo);
            
            if(resultModo.isPresent()){
                jogo.setModo(resultModo.get());
                jogo.setPlataformas(new HashSet<>());
                jogo.setGeneros(new HashSet<>());

                for (long idPlataforma : idPlataformas) {
                    Optional<Plataforma> resultPlataforma = plataformaRepo.findById(idPlataforma);
                    
                    if(resultPlataforma.isPresent()){
                        jogo.getPlataformas().add(resultPlataforma.get());
                    }
                }

                for(long idGenero : idGeneros){
                    Optional<Genero> resultGenero = generoRepo.findById(idGenero);

                    if(resultGenero.isPresent()){
                        jogo.getGeneros().add(resultGenero.get());
                    }
                }
                jogoRepo.save(jogo);
            }
        }
        return "redirect:/jogo/list";
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable long id, Model ui){
        Optional<Jogo> resultado = jogoRepo.findById(id);

        if (resultado.isPresent()) {
            ui.addAttribute("jogo", resultado.get());

            return "/jogo/delete";
        }

        return "/jogo/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam("id") long id){
        jogoRepo.deleteById(id);

        return "redirect:/jogo/list";
    }
}
