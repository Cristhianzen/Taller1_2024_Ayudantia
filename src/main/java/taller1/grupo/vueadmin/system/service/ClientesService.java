package taller1.grupo.vueadmin.system.service;

import taller1.grupo.vueadmin.system.entity.Clientes;
import taller1.grupo.vueadmin.system.entity.dto.ClientesDto;
import taller1.grupo.vueadmin.system.entity.dto.QueryDto;

import java.util.List;

import com.baomidou.mybatisplus.core.metadata.IPage;

public interface ClientesService {
    public List<Clientes> getClientesList(String blurry);

    public IPage<ClientesDto> queryClientesTable(QueryDto queryDto);

    void editClientes(ClientesDto clientesDto);
}