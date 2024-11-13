package taller1.grupo.vueadmin.system.entity.dto;

import lombok.Getter;
import lombok.Setter;

/**
 * @program: tarija
 * @description: this is a class
 * @author: richard sivila
 * @create: 2024
 **/
@Setter
@Getter
public class QueryDto {

    private String blurry;

    private long currentPage = 1;

    private long size = 10;
}
