package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import dto.PoDto;

public class PoMapper implements RowMapper<PoDto>
{

	@Override
	public PoDto mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		PoDto poDto = new PoDto();
		return null;
	}

}
