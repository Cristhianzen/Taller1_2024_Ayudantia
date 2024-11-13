package taller1.grupo.vueadmin.system.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import lombok.RequiredArgsConstructor;
import taller1.grupo.vueadmin.system.entity.dto.Modulo1top10Dto;
import taller1.grupo.vueadmin.system.entity.dto.QueryDto;
import taller1.grupo.vueadmin.system.service.Modulo1Service;
import taller1.grupo.vueadmin.system.mapper.Modulo1Mapper;;;

@Service
@RequiredArgsConstructor
public class Modulo1ServiceImpl implements Modulo1Service {
    private final Modulo1Mapper modulo1Mapper;

    @Override
    public IPage<Modulo1top10Dto> queryModulo1Table(QueryDto queryDto) {
        Page<Modulo1top10Dto> page = new Page<>();
        page.setCurrent(queryDto.getCurrentPage());
        page.setSize(queryDto.getSize());
        return modulo1Mapper.queryModulo1Table(page, queryDto.getBlurry());
    }

}
