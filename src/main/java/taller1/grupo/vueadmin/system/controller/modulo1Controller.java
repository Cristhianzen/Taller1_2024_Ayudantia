package taller1.grupo.vueadmin.system.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import taller1.grupo.vueadmin.common.exception.BadRequestException;
import taller1.grupo.vueadmin.common.utils.ResultUtil;
import taller1.grupo.vueadmin.logs.annotation.Log;
import taller1.grupo.vueadmin.system.entity.dto.QueryDto;
import taller1.grupo.vueadmin.system.service.ClientesService;
import taller1.grupo.vueadmin.system.service.Modulo1Service;

@RestController
@RequiredArgsConstructor
@RequestMapping("/sys")
public class modulo1Controller extends ResultUtil {
    private final Modulo1Service modulo1Service;

    @Log("Consultar lista modulo1 los 10")
    @GetMapping("/modulo1/table")
    public ResponseEntity<Object> queryModulo1Table(QueryDto queryDto) {
        try {
            return success(true, modulo1Service.queryModulo1Table(queryDto));
        } catch (BadRequestException e) {
            return fail(false, e.getMsg());
        }
    }
    // otros metodos

}
