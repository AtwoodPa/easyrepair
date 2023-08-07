package org.ee.authority.mapper.bussiness;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.ee.authority.entity.bussiness.Report;
import org.ee.authority.vo.ReportQueryVo;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ReportMapper extends BaseMapper<Report> {
    IPage<Report> selectPage(Page<Report> page, @Param("vo") ReportQueryVo reportQueryVo);

    Page<Report> selectPage2(Page<Report> pageReport, @Param("types") Integer type,@Param("nickName") String nickName);
}