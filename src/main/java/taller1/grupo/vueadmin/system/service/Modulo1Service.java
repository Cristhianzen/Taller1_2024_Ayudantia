package taller1.grupo.vueadmin.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;

import taller1.grupo.vueadmin.system.entity.dto.Modulo1top10Dto;
import taller1.grupo.vueadmin.system.entity.dto.QueryDto;

public interface Modulo1Service {
    public IPage<Modulo1top10Dto> queryModulo1Table(QueryDto queryDto);

}
